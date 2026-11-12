defmodule Offlixir.Countries.GB do
  @moduledoc false
  # United Kingdom. Only the holidays that the reference rules do not attach to England,
  # Wales, Scotland or Northern Ireland are kept. New Year's Day is not one of them.

  import Offlixir.Rules

  @monday 1
  @friday 5

  # Christmas Day and Boxing Day on a week-end are both observed two days later.
  @christmas %{6 => 2, 7 => 2}

  def holidays(year) do
    [
      fixed(year, 12, 25, "CHRISTMASDAY-01", "Christmas Day", "Christmas Day", @christmas),
      fixed(year, 12, 26, "STSTEPHENSDAY-01", "Boxing Day", "St. Stephen's Day", @christmas),
      easter(year, :catholic, :good_friday, "Good Friday"),
      early_may_bank_holiday(year),
      spring_bank_holiday(year),
      queens_platinum_jubilee(year),
      queens_state_funeral(year),
      coronation_bank_holiday(year)
    ]
  end

  defp early_may_bank_holiday(year) do
    date =
      case year do
        # Moved for the 50th anniversary of VE Day.
        1995 -> Date.new!(1995, 5, 8)
        # Moved for the 75th anniversary of VE Day.
        2020 -> nth_weekday(2020, 5, @friday, 2)
        _other -> nth_weekday(year, 5, @monday, 1)
      end

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
end
