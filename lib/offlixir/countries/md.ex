defmodule Offlixir.Countries.MD do
  @moduledoc false
  # Moldova. Most local names are given in English.

  import Offlixir.Rules

  alias Offlixir.Easter

  def holidays(year) do
    # Correction of the reference rules, which compute the last Monday of August in a
    # variable named lastMondayInMay. Memorial Day (Paștele Blajinilor) is the
    # Monday one week after Orthodox Easter. See DEVIATIONS.md.
    memorial_day = Date.add(Easter.orthodox(year), 8)

    [
      fixed(year, 1, 1, "NEWYEARSDAY-01", "New Year's Day", "New Year's Day"),
      fixed(
        year,
        1,
        7,
        "OCHRISTMAS-01",
        "Craciun pe stil Vechi (Orthodox Christmas)",
        "Christmas Day (Orthodox)"
      ),
      fixed(
        year,
        1,
        8,
        "OCHRISTMAS-02",
        "Craciun pe stil Vechi (Orthodox Christmas)",
        "Christmas Day (Orthodox)"
      ),
      fixed(
        year,
        2,
        23,
        "VETERANSDAY-01",
        "Day of Veterans of the Armed Forces and Law Enforcement Agencies",
        "Day of Veterans of the Armed Forces and Law Enforcement Agencies"
      ),
      fixed(
        year,
        3,
        8,
        "INTERNATIONALWOMENSDAY-01",
        "International Women's Day",
        "International Women's Day"
      ),
      on(memorial_day, "MEMORIALDAY-01", "Memorial Day", "Memorial Day"),
      fixed(year, 5, 1, "LABOURDAY-01", "Labour Day (Moldova)", "Labour Day (Moldova)"),
      fixed(
        year,
        5,
        9,
        "VICTORYCOMMEMORATIONDAY-01",
        "Victory and Commemoration Day",
        "Victory and Commemoration Day"
      ),
      fixed(year, 5, 22, "BALTIDAY-01", "Bălţi Day", "Bălţi Day"),
      fixed(year, 8, 27, "INDEPENDENCEDAY-01", "Independence Day", "Independence Day (Moldova)"),
      fixed(
        year,
        8,
        31,
        "NATIONALLANGUAGEDAY-01",
        "Limba Noastra",
        "Limba Noastra (National Language Day)"
      ),
      fixed(
        year,
        9,
        3,
        "ARMYDAY-01",
        "Day of the Moldovan National Army",
        "Day of the Moldovan National Army"
      ),
      fixed(year, 10, 14, "CAPITALSDAY-01", "Capital's Day", "Capital's Day"),
      fixed(
        year,
        11,
        21,
        "SOUTHCAPITALSDAYCAHUL-01",
        "South Capital's Day Cahul",
        "South Capital's Day Cahul"
      ),
      fixed(
        year,
        12,
        25,
        "CHRISTMASDAY-01",
        "Craciun pe stil Nou (Western Christmas)",
        "Christmas Day"
      ),
      easter(year, :orthodox, :easter_sunday, "Orthodox Easter")
    ]
  end
end
