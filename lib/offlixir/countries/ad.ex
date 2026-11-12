defmodule Offlixir.Countries.AD do
  @moduledoc false
  # Andorra.

  import Offlixir.Rules

  alias Offlixir.Easter

  def holidays(year) do
    carnival = Date.add(Easter.gregorian(year), -48)

    [
      fixed(year, 1, 1, "NEWYEARSDAY-01", "Any nou", "New Year's Day"),
      fixed(year, 1, 6, "EPIPHANY-01", "Reis", "Epiphany"),
      fixed(year, 3, 14, "CONSTITUTIONDAY-01", "Dia de la Constitució", "Constitution Day"),
      fixed(year, 5, 1, "LABOURDAY-01", "Festa del Treball", "Labour Day"),
      fixed(year, 8, 15, "ASSUMPTIONDAY-01", "Assumpció", "Assumption Day"),
      fixed(year, 9, 8, "NATIONALHOLIDAY-01", "Mare de Déu de Meritxell", "National Holiday"),
      fixed(year, 11, 1, "ALLSAINTSDAY-01", "Tots Sants", "All Saints' Day"),
      fixed(
        year,
        12,
        8,
        "IMMACULATECONCEPTION-01",
        "Immaculada Concepció",
        "Immaculate Conception"
      ),
      fixed(year, 12, 25, "CHRISTMASDAY-01", "Nadal", "Christmas Day"),
      fixed(year, 12, 26, "STSTEPHENSDAY-01", "Sant Esteve", "St. Stephen's Day"),
      on(carnival, "CARNIVAL-01", "Carnaval", "Carnival"),
      easter(year, :catholic, :good_friday, "Divendres Sant"),
      easter(year, :catholic, :easter_monday, "Dilluns de Pasqua"),
      easter(year, :catholic, :whit_monday, "Dilluns de Pentecosta")
    ]
  end
end
