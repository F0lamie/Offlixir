defmodule Offlixir.Countries.GG do
  @moduledoc false
  # Guernsey.

  import Offlixir.Rules

  @monday 1

  # A holiday on a Saturday or a Sunday is observed the following Monday.
  @to_monday %{6 => 2, 7 => 1}

  # Christmas Day and Boxing Day on a week-end are both observed two days later.
  @christmas %{6 => 2, 7 => 2}

  def holidays(year) do
    early_may = nth_weekday(year, 5, @monday, 1)
    summer = last_weekday(year, 8, @monday)

    [
      fixed(year, 1, 1, "NEWYEARSDAY-01", "New Year's Day", "New Year's Day", @to_monday),
      on(early_may, "EARLYMAYBANKHOLIDAY-01", "Early May Bank Holiday", "Early May Bank Holiday"),
      fixed(year, 5, 9, "LIBERATIONDAY-01", "Liberation Day", "Liberation Day"),
      on(summer, "SUMMERBANKHOLIDAY-01", "Summer Bank Holiday", "Summer Bank Holiday"),
      fixed(year, 12, 25, "CHRISTMASDAY-01", "Christmas Day", "Christmas Day", @christmas),
      fixed(year, 12, 26, "BOXINGDAY-01", "St. Stephen's Day", "Boxing Day", @christmas),
      easter(year, :catholic, :good_friday, "Good Friday"),
      easter(year, :catholic, :easter_monday, "Easter Monday"),
      spring_bank_holiday(year),
      queens_platinum_jubilee(year),
      coronation_bank_holiday(year)
    ]
  end

  defp spring_bank_holiday(year) do
    # Moved in 2022 for the Platinum Jubilee.
    date = if year == 2022, do: Date.new!(2022, 6, 2), else: last_weekday(year, 5, @monday)

    on(date, "SPRINGBANKHOLIDAY-01", "Spring Bank Holiday", "Spring Bank Holiday")
  end

  defp queens_platinum_jubilee(2022) do
    fixed(
      2022,
      6,
      3,
      "QUEENSPLATINUMJUBILEE-01",
      "Queen's Platinum Jubilee",
      "Queen's Platinum Jubilee"
    )
  end

  defp queens_platinum_jubilee(_year), do: nil

  defp coronation_bank_holiday(2023) do
    fixed(
      2023,
      5,
      8,
      "CORONATIONBANKHOLIDAY-01",
      "Coronation Bank Holiday",
      "Coronation Bank Holiday"
    )
  end

  defp coronation_bank_holiday(_year), do: nil
end
