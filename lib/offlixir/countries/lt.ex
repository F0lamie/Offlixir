defmodule Offlixir.Countries.LT do
  @moduledoc false
  # Lithuania.

  import Offlixir.Rules

  def holidays(year) do
    [
      fixed(year, 1, 1, "NEWYEARSDAY-01", "Naujieji metai", "New Year's Day"),
      fixed(
        year,
        2,
        16,
        "RESTORATIONOFTHESTATE-01",
        "Lietuvos valstybės atkūrimo diena",
        "The Day of Restoration of the State of Lithuania"
      ),
      fixed(
        year,
        3,
        11,
        "RESTORATIONOFINDEPENDENCE-01",
        "Lietuvos nepriklausomybės atkūrimo diena",
        "Day of Restoration of Independence of Lithuania"
      ),
      fixed(
        year,
        5,
        1,
        "INTERNATIONALWORKINGDAY-01",
        "Tarptautinė darbo diena",
        "International Working Day"
      ),
      fixed(year, 6, 24, "STJOHNSDAY-01", "Joninės, Rasos", "St. John's Day"),
      fixed(year, 7, 6, "STATEHOODDAY-01", "Valstybės diena", "Statehood Day"),
      fixed(year, 8, 15, "ASSUMPTIONDAY-01", "Žolinė", "Assumption Day"),
      fixed(year, 11, 1, "ALLSAINTSDAY-01", "Visų šventųjų diena", "All Saints' Day"),
      fixed(year, 11, 2, "ALLSOULSDAY-01", "Vėlinės", "All Souls' Day"),
      fixed(year, 12, 24, "CHRISTMASEVE-01", "Šv. Kūčios", "Christmas Eve"),
      fixed(year, 12, 25, "CHRISTMASDAY-01", "Šv. Kalėdos", "Christmas Day"),
      fixed(year, 12, 26, "STSTEPHENSDAY-01", "Šv. Kalėdos", "St. Stephen's Day"),
      easter(year, :catholic, :easter_sunday, "Velykos"),
      easter(year, :catholic, :easter_monday, "Antroji Velykų diena")
    ]
  end
end
