defmodule Offlixir.Countries.GI do
  @moduledoc false
  # Gibraltar. The local names are given in English.

  import Offlixir.Rules

  @monday 1

  # A holiday on a Saturday or a Sunday is observed the following Monday.
  @to_monday %{6 => 2, 7 => 1}

  # Boxing Day gives way to Christmas Day when Christmas Day is observed on Monday.
  @boxing_day %{6 => 2, 7 => 2, 1 => 1}

  def holidays(year) do
    [
      same_name(Date.new!(year, 1, 1), "NEWYEARSDAY-01", "New Year's Day", @to_monday),
      same_name(
        Date.new!(year, 4, 28),
        "WORKERSMEMORIALDAY-01",
        "Workers' Memorial Day",
        @to_monday
      ),
      same_name(Date.new!(year, 5, 1), "MAYDAY-01", "May Day", @to_monday),
      same_name(
        last_weekday(year, 8, @monday),
        "SUMMERBANKHOLIDAY-01",
        "Late Summer Bank Holiday"
      ),
      same_name(
        Date.new!(year, 9, 10),
        "GIBRALTARNATIONALDAY-01",
        "Gibraltar National Day",
        @to_monday
      ),
      same_name(Date.new!(year, 12, 25), "CHRISTMASDAY-01", "Christmas Day", @to_monday),
      same_name(Date.new!(year, 12, 26), "BOXINGDAY-01", "Boxing Day", @boxing_day),
      easter(year, :catholic, :good_friday, "Good Friday"),
      easter(year, :catholic, :easter_monday, "Easter Monday"),
      commonwealth_day(year),
      winter_midterm_bank_holiday(year),
      spring_bank_holiday(year),
      monarchs_birthday(year),
      ve_day_75th_anniversary(year),
      platinum_jubilee(year),
      kings_coronation_bank_holiday(year)
    ]
  end

  defp same_name(date, id, name, observed \\ %{}), do: on(date, id, name, name, observed)

  # Replaced by the Winter Midterm Bank Holiday in 2022.
  defp commonwealth_day(year) when year <= 2020 do
    same_name(nth_weekday(year, 3, @monday, 2), "COMMONWEALTHDAY-01", "Commonwealth Day")
  end

  defp commonwealth_day(2021) do
    same_name(nth_weekday(2021, 2, @monday, 3), "COMMONWEALTHDAY-01", "Commonwealth Day")
  end

  defp commonwealth_day(_year), do: nil

  defp winter_midterm_bank_holiday(year) when year >= 2022 do
    date = if year == 2024, do: Date.new!(2024, 2, 12), else: nth_weekday(year, 2, @monday, 3)

    same_name(date, "WINTERMIDTERMBANKHOLIDAY-01", "Winter Midterm Bank Holiday")
  end

  defp winter_midterm_bank_holiday(_year), do: nil

  defp spring_bank_holiday(year) do
    # Moved in 2022 for the Platinum Jubilee.
    date = if year == 2022, do: Date.new!(2022, 6, 2), else: last_weekday(year, 5, @monday)

    same_name(date, "SPRINGBANKHOLIDAY-01", "Spring Bank Holiday")
  end

  defp monarchs_birthday(year) do
    cond do
      year >= 2023 ->
        same_name(nth_weekday(year, 6, @monday, 3), "MONARCHBIRTHDAY-01", "King's Birthday")

      year >= 2021 ->
        same_name(nth_weekday(year, 6, @monday, 2), "MONARCHBIRTHDAY-01", "Queen's Birthday")

      true ->
        same_name(nth_weekday(year, 6, @monday, 3), "MONARCHBIRTHDAY-01", "Queen's Birthday")
    end
  end

  defp ve_day_75th_anniversary(2020) do
    same_name(~D[2020-05-08], "VEDAY-01", "75th anniversary of VE Day")
  end

  defp ve_day_75th_anniversary(_year), do: nil

  defp platinum_jubilee(2022) do
    same_name(~D[2022-06-03], "PLATINUMJUBILEE-01", "Platinum Jubilee")
  end

  defp platinum_jubilee(_year), do: nil

  defp kings_coronation_bank_holiday(2023) do
    same_name(
      ~D[2023-05-08],
      "CORONATIONBANKHOLIDAY-01",
      "Special King's Coronation Bank Holiday"
    )
  end

  defp kings_coronation_bank_holiday(_year), do: nil
end
