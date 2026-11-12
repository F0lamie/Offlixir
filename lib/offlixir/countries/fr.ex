defmodule Offlixir.Countries.FR do
  @moduledoc false
  # France.

  import Offlixir.Rules

  def holidays(year) do
    [
      fixed(year, 1, 1, "NEWYEARSDAY-01", "Jour de l'an", "New Year's Day"),
      fixed(year, 5, 1, "LABOURDAY-01", "Fête du Travail", "Labour Day"),
      fixed(year, 5, 8, "VICTORYINEUROPEDAY-01", "Victoire 1945", "Victory in Europe Day"),
      fixed(year, 7, 14, "BASTILLEDAY-01", "Fête nationale", "Bastille Day"),
      fixed(year, 8, 15, "ASSUMPTIONDAY-01", "Assomption", "Assumption Day"),
      fixed(year, 11, 1, "ALLSAINTSDAY-01", "Toussaint", "All Saints' Day"),
      fixed(year, 11, 11, "ARMISTICEDAY-01", "Armistice 1918", "Armistice Day"),
      fixed(year, 12, 25, "CHRISTMASDAY-01", "Noël", "Christmas Day"),
      easter(year, :catholic, :easter_monday, "Lundi de Pâques"),
      easter(year, :catholic, :ascension_day, "Ascension"),
      easter(year, :catholic, :whit_monday, "Lundi de Pentecôte")
    ]
  end
end
