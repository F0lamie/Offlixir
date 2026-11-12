defmodule Offlixir.Rules do
  @moduledoc false
  # Building blocks used by the country modules. Each function returns the holiday
  # as a map. `Offlixir.Countries` adds the country and builds the struct.
  #
  # `observed` describes how a country moves a holiday: a map from the ISO day of
  # the week (1 = Monday, 7 = Sunday) to a number of days to add.

  alias Offlixir.Easter

  @type observed :: %{optional(1..7) => integer}
  @type holiday :: %{
          id: String.t(),
          date: Date.t(),
          observed_date: Date.t(),
          local_name: String.t(),
          english_name: String.t()
        }

  # Offset in days from Easter Sunday, id and English name of the feasts that
  # depend on Easter.
  @feasts %{
    maundy_thursday: {-3, "MAUNDYTHURSDAY", "Maundy Thursday"},
    good_friday: {-2, "GOODFRIDAY", "Good Friday"},
    holy_saturday: {-1, "HOLYSATURDAY", "Holy Saturday"},
    easter_sunday: {0, "EASTERSUNDAY", "Easter Sunday"},
    easter_monday: {1, "EASTERMONDAY", "Easter Monday"},
    ascension_day: {39, "ASCENSIONDAY", "Ascension Day"},
    pentecost: {49, "PENTECOST", "Pentecost"},
    whit_monday: {50, "WHITMONDAY", "Whit Monday"},
    corpus_christi: {60, "CORPUSCHRISTI", "Corpus Christi"}
  }

  @spec on(Date.t(), String.t(), String.t(), String.t(), observed) :: holiday
  def on(%Date{} = date, id, local_name, english_name, observed \\ %{}) do
    %{
      id: id,
      date: date,
      observed_date: Date.add(date, Map.get(observed, Date.day_of_week(date), 0)),
      local_name: local_name,
      english_name: english_name
    }
  end

  @spec fixed(integer, 1..12, 1..31, String.t(), String.t(), String.t(), observed) :: holiday
  def fixed(year, month, day, id, local_name, english_name, observed \\ %{}) do
    on(Date.new!(year, month, day), id, local_name, english_name, observed)
  end

  @spec easter(integer, :catholic | :orthodox, atom, String.t(), observed) :: holiday
  def easter(year, tradition, feast, local_name, observed \\ %{}) do
    {offset, name, english_name} = Map.fetch!(@feasts, feast)

    {sunday, prefix} =
      case tradition do
        :catholic -> {Easter.gregorian(year), "C"}
        :orthodox -> {Easter.orthodox(year), "O"}
      end

    on(Date.add(sunday, offset), "#{prefix}#{name}-01", local_name, english_name, observed)
  end

  # The first `weekday` (1 = Monday, 7 = Sunday) on or after `date`.
  @spec on_or_after(Date.t(), 1..7) :: Date.t()
  def on_or_after(%Date{} = date, weekday) when weekday in 1..7 do
    Date.add(date, Integer.mod(weekday - Date.day_of_week(date), 7))
  end

  # The `n`th `weekday` (1 = Monday, 7 = Sunday) of a month.
  @spec nth_weekday(integer, 1..12, 1..7, 1..4) :: Date.t()
  def nth_weekday(year, month, weekday, n) when weekday in 1..7 and n in 1..4 do
    year |> Date.new!(month, 1) |> on_or_after(weekday) |> Date.add(7 * (n - 1))
  end

  # The last `weekday` (1 = Monday, 7 = Sunday) of a month.
  @spec last_weekday(integer, 1..12, 1..7) :: Date.t()
  def last_weekday(year, month, weekday) when weekday in 1..7 do
    last_day = year |> Date.new!(month, 1) |> Date.end_of_month()
    Date.add(last_day, -Integer.mod(Date.day_of_week(last_day) - weekday, 7))
  end
end
