defmodule Offlixir.Countries.IE do
  @moduledoc false
  # Ireland.

  import Offlixir.Rules

  @monday 1
  @friday 5

  def holidays(year) do
    may_day = nth_weekday(year, 5, @monday, 1)
    june_holiday = nth_weekday(year, 6, @monday, 1)
    august_holiday = nth_weekday(year, 8, @monday, 1)
    october_holiday = last_weekday(year, 10, @monday)

    [
      fixed(year, 1, 1, "NEWYEARSDAY-01", "Lá Caille", "New Year's Day"),
      fixed(year, 3, 17, "SAINTPATRICKSDAY-01", "Lá Fhéile Pádraig", "Saint Patrick's Day"),
      on(may_day, "MAYDAY-01", "Lá Bealtaine", "May Day"),
      on(june_holiday, "JUNEHOLIDAY-01", "Lá Saoire i mí an Mheithimh", "June Holiday"),
      on(august_holiday, "AUGUSTHOLIDAY-01", "Lá Saoire i mí Lúnasa", "August Holiday"),
      on(
        october_holiday,
        "OCTOBERHOLIDAY-01",
        "Lá Saoire i mí Dheireadh Fómhair",
        "October Holiday"
      ),
      fixed(year, 12, 25, "CHRISTMASDAY-01", "Lá Nollag", "Christmas Day"),
      fixed(year, 12, 26, "STSTEPHENSDAY-01", "Lá Fhéile Stiofáin", "St. Stephen's Day"),
      easter(year, :catholic, :easter_monday, "Luan Cásca"),
      saint_brigids_day(year)
    ]
  end

  # From 2023: the 1st of February when it is a Friday, else the first Monday of February.
  defp saint_brigids_day(year) when year >= 2023 do
    first_of_february = Date.new!(year, 2, 1)

    date =
      if Date.day_of_week(first_of_february) == @friday,
        do: first_of_february,
        else: nth_weekday(year, 2, @monday, 1)

    on(date, "SAINTBRIGIDSDAY-01", "Lá Fhéile Bríde", "Saint Brigid's Day")
  end

  defp saint_brigids_day(_year), do: nil
end
