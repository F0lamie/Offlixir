defmodule Offlixir.Countries.MC do
  @moduledoc false
  # Monaco.

  import Offlixir.Rules

  # A holiday on a Sunday is observed the following Monday.
  @sunday_to_monday %{7 => 1}

  def holidays(year) do
    [
      fixed(year, 1, 1, "NEWYEARSDAY-01", "Le jour de l’An", "New Year's Day", @sunday_to_monday),
      fixed(year, 1, 27, "SAINTDEVOTASDAY-01", "La Sainte Dévote", "Saint Devota's Day"),
      fixed(year, 5, 1, "MAYDAY-01", "Le 1er mai", "May Day"),
      fixed(year, 8, 15, "ASSUMPTIONDAY-01", "L'Assomption de Marie", "Assumption Day"),
      fixed(year, 11, 1, "ALLSAINTSDAY-01", "La Toussaint", "All Saints Day", @sunday_to_monday),
      fixed(
        year,
        11,
        19,
        "NATIONALDAY-01",
        "La Fête du Prince",
        "National Day",
        @sunday_to_monday
      ),
      fixed(
        year,
        12,
        8,
        "THEIMMACULATECONCEPTION-01",
        "L’Immaculée Conception",
        "The Immaculate Conception"
      ),
      fixed(year, 12, 25, "CHRISTMASDAY-01", "Noël", "Christmas Day", @sunday_to_monday),
      easter(year, :catholic, :easter_monday, "Easter Monday"),
      easter(year, :catholic, :ascension_day, "L’Ascension"),
      easter(year, :catholic, :whit_monday, "Le lundi de Pentecôte"),
      easter(year, :catholic, :corpus_christi, "La Fête Dieu")
    ]
  end
end
