defmodule Offlixir.Countries.JE do
  @moduledoc false
  # Jersey.

  import Offlixir.Rules

  @monday 1

  def holidays(year) do
    early_may = nth_weekday(year, 5, @monday, 1)
    spring = last_weekday(year, 5, @monday)
    summer = last_weekday(year, 8, @monday)

    [
      fixed(year, 1, 1, "NEWYEARSDAY-01", "New Year's Day", "New Year's Day"),
      on(early_may, "EARLYMAYBANKHOLIDAY-01", "Early May Bank Holiday", "Early May Bank Holiday"),
      fixed(year, 5, 9, "LIBERATIONDAY-01", "Liberation Day", "Liberation Day"),
      on(spring, "SPRINGBANKHOLIDAY-01", "Spring Bank Holiday", "Spring Bank Holiday"),
      on(summer, "SUMMERBANKHOLIDAY-01", "Summer Bank Holiday", "Summer Bank Holiday"),
      fixed(year, 12, 25, "CHRISTMASDAY-01", "Christmas Day", "Christmas Day"),
      fixed(year, 12, 26, "BOXINGDAY-01", "St. Stephen's Day", "Boxing Day"),
      easter(year, :catholic, :good_friday, "Good Friday"),
      easter(year, :catholic, :easter_monday, "Easter Monday")
    ]
  end
end
