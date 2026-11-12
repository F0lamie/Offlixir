defmodule Offlixir.Countries.LI do
  @moduledoc false
  # Liechtenstein.

  import Offlixir.Rules

  def holidays(year) do
    [
      fixed(year, 1, 1, "NEWYEARSDAY-01", "Neujahr", "New Year's Day"),
      fixed(year, 1, 6, "EPIPHANY-01", "Heilige Drei Könige", "Epiphany"),
      fixed(year, 2, 2, "CANDLEMAS-01", "Mariä Lichtmess", "Candlemas"),
      fixed(year, 3, 19, "SAINTJOSEPHSDAY-01", "Josefstag", "Saint Joseph's Day"),
      fixed(year, 5, 1, "LABOURDAY-01", "Tag der Arbeit", "Labour Day"),
      fixed(year, 8, 15, "NATIONALHOLIDAY-01", "Staatsfeiertag", "National Holiday"),
      fixed(year, 9, 8, "NATIVITYOFOURLADY-01", "Maria Geburt", "Nativity of Our Lady"),
      fixed(year, 11, 1, "ALLSAINTSDAY-01", "Allerheiligen", "All Saints Day"),
      fixed(year, 12, 8, "IMMACULATECONCEPTION-01", "Mariä Empfängnis", "Immaculate Conception"),
      fixed(year, 12, 25, "CHRISTMASDAY-01", "Weihnachten", "Christmas Day"),
      fixed(year, 12, 26, "STSTEPHENSDAY-01", "Stephanstag", "St. Stephen's Day"),
      easter(year, :catholic, :easter_monday, "Ostermontag"),
      easter(year, :catholic, :pentecost, "Pfingstsonntag"),
      easter(year, :catholic, :ascension_day, "Auffahrt"),
      easter(year, :catholic, :whit_monday, "Pfingstmontag"),
      easter(year, :catholic, :corpus_christi, "Fronleichnam")
    ]
  end
end
