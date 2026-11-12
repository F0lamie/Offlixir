defmodule Offlixir.Countries.AT do
  @moduledoc false
  # Austria.

  import Offlixir.Rules

  def holidays(year) do
    [
      fixed(year, 1, 1, "NEWYEARSDAY-01", "Neujahr", "New Year's Day"),
      fixed(year, 1, 6, "EPIPHANY-01", "Heilige Drei Könige", "Epiphany"),
      fixed(year, 5, 1, "NATIONALHOLIDAY-01", "Staatsfeiertag", "National Holiday"),
      fixed(year, 8, 15, "ASSUMPTIONDAY-01", "Maria Himmelfahrt", "Assumption Day"),
      fixed(year, 10, 26, "NATIONALHOLIDAY-02", "Nationalfeiertag", "National Holiday"),
      fixed(year, 11, 1, "ALLSAINTSDAY-01", "Allerheiligen", "All Saints' Day"),
      fixed(year, 12, 8, "IMMACULATECONCEPTION-01", "Mariä Empfängnis", "Immaculate Conception"),
      fixed(year, 12, 25, "CHRISTMASDAY-01", "Weihnachten", "Christmas Day"),
      fixed(year, 12, 26, "STSTEPHENSDAY-01", "Stefanitag", "St. Stephen's Day"),
      easter(year, :catholic, :easter_sunday, "Ostersonntag"),
      easter(year, :catholic, :easter_monday, "Ostermontag"),
      easter(year, :catholic, :ascension_day, "Christi Himmelfahrt"),
      easter(year, :catholic, :pentecost, "Pfingstsonntag"),
      easter(year, :catholic, :whit_monday, "Pfingstmontag"),
      easter(year, :catholic, :corpus_christi, "Fronleichnam")
    ]
  end
end
