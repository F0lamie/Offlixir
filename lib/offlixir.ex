defmodule Offlixir do
  @moduledoc """
  Public holidays of European countries, computed offline.

  Offlixir keeps the public holidays that apply to the whole country.

  Every date returned is a `Date` struct of the `Calendar.ISO` calendar.

  A country is an ISO 3166-1 alpha-2 code in upper case, as an atom (`:FR`) or as
  a string (`"FR"`). A year is an integer between 1 and 9999.

  ## Observed dates

  Some countries move a holiday that falls on a week-end to a working day. A
  `Offlixir.Holiday` carries both the calendar date (`:date`) and the day
  actually taken off (`:observed_date`). The functions that return or test plain
  dates (`dates!/2`, `dates_between!/3`, `holiday?/2`) use the observed date.
  """

  alias Offlixir.{Countries, Holiday}

  @type country :: atom() | String.t()
  @type day :: Date.t() | NaiveDateTime.t() | DateTime.t()
  @type reason ::
          {:unknown_country, term()}
          | {:invalid_year, term()}
          | {:invalid_range, {Date.t(), Date.t()}}

  @doc """
  Returns the supported countries, as upper case atoms in alphabetical order.

      iex> :FR in Offlixir.countries()
      true
  """
  @spec countries() :: [atom()]
  def countries, do: Countries.codes()

  @doc """
  Returns the holidays of `country` for `year`, sorted by date.

  Two holidays that fall on the same date are both returned.

      iex> {:ok, [first | _]} = Offlixir.holidays(:FR, 2026)
      iex> first
      %Offlixir.Holiday{
        country: :FR,
        id: "FR-NEWYEARSDAY-01",
        date: ~D[2026-01-01],
        observed_date: ~D[2026-01-01],
        local_name: "Jour de l'an",
        english_name: "New Year's Day"
      }

      iex> Offlixir.holidays(:XX, 2026)
      {:error, {:unknown_country, :XX}}
  """
  @spec holidays(country, integer()) :: {:ok, [Holiday.t()]} | {:error, reason}
  def holidays(country, year) do
    with {:ok, code} <- Countries.fetch(country),
         :ok <- check_year(year) do
      {:ok, Countries.holidays(code, year)}
    end
  end

  @doc """
  Same as `holidays/2` but returns the list, or raises `ArgumentError`.

      iex> Offlixir.holidays!("FR", 2026) |> Enum.map(& &1.english_name) |> Enum.take(3)
      ["New Year's Day", "Easter Monday", "Labour Day"]
  """
  @spec holidays!(country, integer()) :: [Holiday.t()]
  def holidays!(country, year), do: country |> holidays(year) |> unwrap!()

  @doc """
  Returns the observed dates of the holidays of `country` for `year`, in
  ascending order and without duplicates.

      iex> Offlixir.dates(:FR, 2026)
      {:ok,
       [~D[2026-01-01], ~D[2026-04-06], ~D[2026-05-01], ~D[2026-05-08], ~D[2026-05-14],
        ~D[2026-05-25], ~D[2026-07-14], ~D[2026-08-15], ~D[2026-11-01], ~D[2026-11-11],
        ~D[2026-12-25]]}

      iex> Offlixir.dates(:FR, 10_000)
      {:error, {:invalid_year, 10_000}}
  """
  @spec dates(country, integer()) :: {:ok, [Date.t()]} | {:error, reason}
  def dates(country, year) do
    with {:ok, holidays} <- holidays(country, year) do
      {:ok, to_dates(holidays)}
    end
  end

  @doc """
  Same as `dates/2` but returns the list, or raises `ArgumentError`.

  The result is a plain list of `Date` structs, usable with `in`:

      iex> ~D[2026-07-14] in Offlixir.dates!(:FR, 2026)
      true

      iex> Offlixir.dates!(:fr, 2026)
      ** (ArgumentError) unknown country :fr, expected a supported ISO 3166-1 alpha-2 code in upper case such as :FR or "FR"
  """
  @spec dates!(country, integer()) :: [Date.t()]
  def dates!(country, year), do: country |> dates(year) |> unwrap!()

  @doc """
  Returns the holidays of `country` observed from `from` to `to`, both included.

  Raises `ArgumentError` when the country is unknown, when a year of the range is
  invalid or when `to` is before `from`.

      iex> Offlixir.holidays_between!(:FR, ~D[2025-12-01], ~D[2026-01-31]) |> Enum.map(& &1.id)
      ["FR-CHRISTMASDAY-01", "FR-NEWYEARSDAY-01"]
  """
  @spec holidays_between!(country, day, day) :: [Holiday.t()]
  def holidays_between!(country, from, to) do
    from = to_date!(from)
    to = to_date!(to)

    if Date.compare(from, to) == :gt do
      unwrap!({:error, {:invalid_range, {from, to}}})
    end

    from.year..to.year
    |> Enum.flat_map(&holidays!(country, &1))
    |> Enum.filter(fn holiday ->
      Date.compare(holiday.observed_date, from) != :lt and
        Date.compare(holiday.observed_date, to) != :gt
    end)
  end

  @doc """
  Returns the observed dates of the holidays of `country` from `from` to `to`,
  both included, in ascending order and without duplicates.

      iex> Offlixir.dates_between!(:FR, ~D[2025-12-01], ~D[2026-01-31])
      [~D[2025-12-25], ~D[2026-01-01]]
  """
  @spec dates_between!(country, day, day) :: [Date.t()]
  def dates_between!(country, from, to) do
    country |> holidays_between!(from, to) |> to_dates()
  end

  @doc """
  Returns `true` when `day` is the observed date of a holiday of `country`.

  `day` can be a `Date`, a `NaiveDateTime` or a `DateTime`. Only the date part is
  read. For a `DateTime` it is the date in its own time zone.

      iex> Offlixir.holiday?(~D[2026-07-14], :FR)
      true

      iex> Offlixir.holiday?(~N[2026-07-15 08:30:00], "FR")
      false
  """
  @spec holiday?(day, country) :: boolean()
  def holiday?(day, country) do
    date = to_date!(day)
    date in dates!(country, date.year)
  end

  @doc """
  Returns `true` when `day` falls on the week-end of `country`.

  The week-end is Saturday and Sunday in every supported country.

      iex> Offlixir.weekend?(~D[2026-07-11], :FR)
      true

      iex> Offlixir.weekend?(~D[2026-07-13], :FR)
      false
  """
  # None of the supported countries has a week-end other than Saturday and Sunday.
  @spec weekend?(day, country) :: boolean()
  def weekend?(day, country) do
    date = to_date!(day)
    _code = country |> Countries.fetch() |> unwrap!()
    Date.day_of_week(date) in [6, 7]
  end

  defp to_dates(holidays) do
    holidays |> Enum.map(& &1.observed_date) |> Enum.uniq() |> Enum.sort(Date)
  end

  defp check_year(year) when year in 1..9999, do: :ok
  defp check_year(year), do: {:error, {:invalid_year, year}}

  defp to_date!(%Date{calendar: Calendar.ISO} = date), do: date
  defp to_date!(%NaiveDateTime{calendar: Calendar.ISO} = naive), do: NaiveDateTime.to_date(naive)
  defp to_date!(%DateTime{calendar: Calendar.ISO} = datetime), do: DateTime.to_date(datetime)

  defp to_date!(other) do
    raise ArgumentError,
          "expected a Date, NaiveDateTime or DateTime of the Calendar.ISO calendar, " <>
            "got: #{inspect(other)}"
  end

  defp unwrap!({:ok, value}), do: value

  defp unwrap!({:error, {:unknown_country, country}}) do
    raise ArgumentError,
          "unknown country #{inspect(country)}, expected a supported ISO 3166-1 alpha-2 " <>
            "code in upper case such as :FR or \"FR\""
  end

  defp unwrap!({:error, {:invalid_year, year}}) do
    raise ArgumentError, "invalid year #{inspect(year)}, expected an integer between 1 and 9999"
  end

  defp unwrap!({:error, {:invalid_range, {from, to}}}) do
    raise ArgumentError, "invalid range, #{to} is before #{from}"
  end
end
