defmodule Offlixir.Countries.IM do
  @moduledoc false
  # Isle of Man.

  import Offlixir.Rules

  @monday 1
  @friday 5
  @saturday 6

  # A holiday on a Saturday or a Sunday is observed the following Monday.
  @to_monday %{6 => 2, 7 => 1}

  # Christmas Day and Boxing Day on a week-end are both observed two days later.
  @christmas %{6 => 2, 7 => 2}

  def holidays(year) do
    late_summer = last_weekday(year, 8, @monday)

    [
      fixed(year, 1, 1, "NEWYEARSDAY-01", "New Year's Day", "New Year's Day", @to_monday),
      fixed(year, 7, 5, "TYNWALDDAY-01", "Tynwald Day", "Tynwald Day", @to_monday),
      on(
        late_summer,
        "LATESUMMERBANKHOLIDAY-01",
        "Late Summer Bank Holiday",
        "Late Summer Bank Holiday"
      ),
      fixed(year, 12, 25, "CHRISTMASDAY-01", "Christmas Day", "Christmas Day", @christmas),
      fixed(year, 12, 26, "BOXINGDAY-01", "St. Stephen's Day", "Boxing Day", @christmas),
      easter(year, :catholic, :good_friday, "Good Friday"),
      easter(year, :catholic, :easter_monday, "Easter Monday"),
      early_may_bank_holiday(year),
      spring_bank_holiday(year),
      queens_platinum_jubilee(year),
      queens_state_funeral(year),
      coronation_bank_holiday(year),
      senior_race_day(year)
    ]
  end

  defp early_may_bank_holiday(year) do
    # Moved in 2020 for the 75th anniversary of VE Day.
    date =
      if year == 2020,
        do: nth_weekday(2020, 5, @friday, 2),
        else: nth_weekday(year, 5, @monday, 1)

    on(date, "EARLYMAYBANKHOLIDAY-01", "Early May Bank Holiday", "Early May Bank Holiday")
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
      "Queen’s Platinum Jubilee",
      "Queen’s Platinum Jubilee"
    )
  end

  defp queens_platinum_jubilee(_year), do: nil

  defp queens_state_funeral(2022) do
    fixed(2022, 9, 19, "QUEENSSTATEFUNERAL-01", "Queen’s State Funeral", "Queen’s State Funeral")
  end

  defp queens_state_funeral(_year), do: nil

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

  # The Friday after the first Saturday of June, during the TT races. Moved to the
  # 28th of August in 2020, when the races were cancelled.
  defp senior_race_day(year) do
    date =
      if year == 2020,
        do: Date.new!(2020, 8, 28),
        else: year |> nth_weekday(6, @saturday, 1) |> on_or_after(@friday)

    on(date, "SENIORRACEDAY-01", "Senior Race Day", "Senior Race Day")
  end
end
