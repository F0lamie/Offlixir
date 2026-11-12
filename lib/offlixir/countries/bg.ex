defmodule Offlixir.Countries.BG do
  @moduledoc false
  # Bulgaria.

  import Offlixir.Rules

  # A holiday on a Saturday or a Sunday is observed the following Monday.
  @to_monday %{6 => 2, 7 => 1}

  def holidays(year) do
    [
      fixed(year, 1, 1, "NEWYEARSDAY-01", "Нова година", "New Year's Day", @to_monday),
      fixed(
        year,
        3,
        3,
        "LIBERATIONDAY-01",
        "Ден на oсвобождението на България от Oсманско робство",
        "Liberation Day",
        @to_monday
      ),
      fixed(
        year,
        5,
        1,
        "INTERNATIONALWORKERSDAY-01",
        "Ден на труда и на международната работническа солидарност",
        "International Workers' Day"
      ),
      fixed(
        year,
        5,
        6,
        "SAINTGEORGESDAY-01",
        "Гергьовден, ден на храбростта и Българската армия",
        "Saint George's Day",
        @to_monday
      ),
      fixed(
        year,
        5,
        24,
        "SAINTSCYRILMETHODIUSDAY-01",
        "Ден на Българската просвета и култура и на славянската писменост",
        "Saints Cyril and Methodius Day",
        @to_monday
      ),
      fixed(
        year,
        9,
        6,
        "UNIFICATIONDAY-01",
        "Ден на съединението",
        "Unification Day",
        @to_monday
      ),
      fixed(
        year,
        9,
        22,
        "INDEPENDENCEDAY-01",
        "Ден на независимостта на България",
        "Independence Day",
        @to_monday
      ),
      # The three days of Christmas are observed after the 26th when one is a Sunday.
      fixed(year, 12, 24, "CHRISTMASEVE-01", "Бъдни вечер", "Christmas Eve", %{7 => 3}),
      fixed(year, 12, 25, "CHRISTMASDAY-01", "Рождество Христово", "Christmas Day", %{7 => 2}),
      fixed(
        year,
        12,
        26,
        "CHRISTMASDAY-02",
        "Рождество Христово",
        "Second day of Christmas",
        %{7 => 1}
      ),
      easter(year, :orthodox, :good_friday, "Разпети петък"),
      easter(year, :orthodox, :holy_saturday, "Велика събота"),
      easter(year, :orthodox, :easter_sunday, "Великден"),
      easter(year, :orthodox, :easter_monday, "Велики понеделник"),
      currency_change_day(year)
    ]
  end

  # One-off holidays around the adoption of the euro on the 1st of January 2026.
  defp currency_change_day(2025) do
    fixed(2025, 12, 31, "CURRENCYCHANGEDAY-01", "Ден на валутната смяна", "Currency change day")
  end

  defp currency_change_day(2026) do
    fixed(2026, 1, 2, "CURRENCYCHANGEDAY-02", "Ден на валутната смяна", "Currency change day")
  end

  defp currency_change_day(_year), do: nil
end
