defmodule Offlixir.Countries.DE do
  @moduledoc false
  # Germany. Only the holidays that apply to every Land are kept.

  import Offlixir.Rules

  def holidays(year) do
    [
      fixed(year, 1, 1, "NEWYEARSDAY-01", "Neujahr", "New Year's Day"),
      fixed(year, 5, 1, "LABOURDAY-01", "Tag der Arbeit", "Labour Day"),
      fixed(year, 12, 25, "CHRISTMASDAY-01", "Erster Weihnachtstag", "Christmas Day"),
      fixed(year, 12, 26, "STSTEPHENSDAY-01", "Zweiter Weihnachtstag", "St. Stephen's Day"),
      easter(year, :catholic, :good_friday, "Karfreitag"),
      easter(year, :catholic, :easter_monday, "Ostermontag"),
      easter(year, :catholic, :ascension_day, "Christi Himmelfahrt"),
      easter(year, :catholic, :whit_monday, "Pfingstmontag"),
      german_unity_day(year),
      prayer_day(year),
      reformation_day(year)
    ]
  end

  defp german_unity_day(year) when year >= 1990 do
    fixed(year, 10, 3, "GERMANUNITYDAY-01", "Tag der Deutschen Einheit", "German Unity Day")
  end

  defp german_unity_day(_year), do: nil

  # A holiday in every Land from 1934 to 1938 and from 1990 to 1994. The other
  # years it only applies to some Länder, or to none.
  defp prayer_day(year) when year in 1934..1938 or year in 1990..1994 do
    # The Wednesday before the 23rd of November: 11 days before the first Sunday
    # of Advent, itself the fourth Sunday before Christmas Eve.
    christmas_eve = Date.new!(year, 12, 24)
    advent_sunday = Date.add(christmas_eve, -(21 + rem(Date.day_of_week(christmas_eve), 7)))

    on(
      Date.add(advent_sunday, -11),
      "REPENTANCEANDPRAYERDAY-01",
      "Buß- und Bettag",
      "Repentance and Prayer Day"
    )
  end

  defp prayer_day(_year), do: nil

  # A holiday in every Land only in 2017, for the 500th anniversary of the Reformation.
  defp reformation_day(2017) do
    fixed(2017, 10, 31, "REFORMATIONDAY-01", "Reformationstag", "Reformation Day")
  end

  defp reformation_day(_year), do: nil
end
