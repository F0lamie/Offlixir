defmodule Offlixir.Countries.IS do
  @moduledoc false
  # Iceland.

  import Offlixir.Rules

  @monday 1
  @thursday 4

  def holidays(year) do
    first_day_of_summer = on_or_after(Date.new!(year, 4, 19), @thursday)
    first_monday_in_august = nth_weekday(year, 8, @monday, 1)

    [
      fixed(year, 1, 1, "NEWYEARSDAY-01", "Nýársdagur", "New Year's Day"),
      on(
        first_day_of_summer,
        "FIRSTDAYOFSUMMER-01",
        "Sumardagurinn fyrsti",
        "First Day of Summer"
      ),
      fixed(year, 5, 1, "MAYDAY-01", "Verkalýðsdagurinn", "May Day"),
      fixed(
        year,
        6,
        17,
        "ICELANDICNATIONALDAY-01",
        "Þjóðhátíðardagurinn",
        "Icelandic National Day"
      ),
      on(first_monday_in_august, "COMMERCEDAY-01", "Frídagur verslunarmanna", "Commerce Day"),
      fixed(year, 12, 24, "CHRISTMASEVE-01", "Aðfangadagur", "Christmas Eve"),
      fixed(year, 12, 25, "CHRISTMASDAY-01", "Jóladagur", "Christmas Day"),
      fixed(year, 12, 26, "STSTEPHENSDAY-01", "Annar í jólum", "St. Stephen's Day"),
      fixed(year, 12, 31, "NEWYEARSEVE-01", "Gamlársdagur", "New Year's Eve"),
      easter(year, :catholic, :maundy_thursday, "Skírdagur"),
      easter(year, :catholic, :good_friday, "Föstudagurinn langi"),
      easter(year, :catholic, :easter_sunday, "Páskadagur"),
      easter(year, :catholic, :easter_monday, "Annar í páskum"),
      easter(year, :catholic, :ascension_day, "Uppstigningardagur"),
      easter(year, :catholic, :pentecost, "Hvítasunnudagur"),
      easter(year, :catholic, :whit_monday, "Annar í hvítasunnu")
    ]
  end
end
