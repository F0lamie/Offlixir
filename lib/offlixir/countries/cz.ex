defmodule Offlixir.Countries.CZ do
  @moduledoc false
  # Czech Republic.

  import Offlixir.Rules

  def holidays(year) do
    [
      fixed(
        year,
        1,
        1,
        "NEWYEARSDAY-01",
        "Den obnovy samostatného českého státu; Nový rok",
        "New Year's Day"
      ),
      fixed(year, 5, 1, "LABOURDAY-01", "Svátek práce", "Labour Day"),
      fixed(year, 5, 8, "LIBERATIONDAY-01", "Den vítězství", "Liberation Day"),
      fixed(
        year,
        7,
        5,
        "SAINTSCYRILMETHODIUSDAY-01",
        "Den slovanských věrozvěstů Cyrila a Metoděje",
        "Saints Cyril and Methodius Day"
      ),
      fixed(year, 7, 6, "JANHUSDAY-01", "Den upálení mistra Jana Husa", "Jan Hus Day"),
      fixed(year, 9, 28, "STWENCESLASDAY-01", "Den české státnosti", "St. Wenceslas Day"),
      fixed(
        year,
        10,
        28,
        "INDEPENDENTDAY-01",
        "Den vzniku samostatného československého státu",
        "Independent Czechoslovak State Day"
      ),
      fixed(
        year,
        11,
        17,
        "DEMOCRACYDAY-01",
        "Den boje za svobodu a demokracii a Mezinárodní den studentstva",
        "Struggle for Freedom and Democracy Day"
      ),
      fixed(year, 12, 24, "CHRISTMASEVE-01", "Štědrý den", "Christmas Eve"),
      fixed(year, 12, 25, "CHRISTMASDAY-01", "1. svátek vánoční", "Christmas Day"),
      fixed(year, 12, 26, "STSTEPHENSDAY-01", "2. svátek vánoční", "St. Stephen's Day"),
      easter(year, :catholic, :good_friday, "Velký pátek"),
      easter(year, :catholic, :easter_monday, "Velikonoční pondělí")
    ]
  end
end
