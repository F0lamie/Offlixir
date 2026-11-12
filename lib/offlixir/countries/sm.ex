defmodule Offlixir.Countries.SM do
  @moduledoc false
  # San Marino. The local names are given in English.

  import Offlixir.Rules

  def holidays(year) do
    [
      same_name(year, 1, 1, "NEWYEARSDAY-01", "New Year's Day"),
      same_name(year, 1, 6, "EPIPHANY-01", "Epiphany"),
      same_name(year, 2, 5, "FEASTSAINTAGATHA-01", "Feast of Saint Agatha"),
      same_name(year, 3, 25, "ANNIVERSARYOFTHEARENGO-01", "Anniversary of the Arengo"),
      same_name(year, 5, 1, "LABOURDAY-01", "Labour Day"),
      same_name(year, 7, 28, "LIBERATIONFROMFASCISM-01", "Liberation from Fascism"),
      same_name(year, 8, 15, "FERRAGOSTO-01", "Ferragosto (Assumption)"),
      same_name(year, 9, 3, "FEASTOFSANMARINO-01", "The Feast of San Marino and the Republic"),
      same_name(year, 11, 1, "ALLSAINTSDAY-01", "All Saints' Day"),
      same_name(
        year,
        11,
        2,
        "COMMEMORATIONDIEDATWAR-01",
        "Commemoration of all those who died at war"
      ),
      same_name(year, 12, 8, "IMMACULATECONCEPTION-01", "Immaculate Conception"),
      same_name(year, 12, 24, "CHRISTMASEVE-01", "Christmas Eve"),
      same_name(year, 12, 25, "CHRISTMASDAY-01", "Christmas Day"),
      same_name(year, 12, 26, "STSTEPHENSDAY-01", "St. Stephen's Day"),
      same_name(year, 12, 31, "NEWYEARSEVE-01", "New Year's Eve"),
      easter(year, :catholic, :easter_sunday, "Easter Sunday"),
      easter(year, :catholic, :easter_monday, "Easter Monday"),
      easter(year, :catholic, :corpus_christi, "Corpus Christi")
    ]
  end

  defp same_name(year, month, day, id, name), do: fixed(year, month, day, id, name, name)
end
