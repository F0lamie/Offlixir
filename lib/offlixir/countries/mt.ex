defmodule Offlixir.Countries.MT do
  @moduledoc false
  # Malta.

  import Offlixir.Rules

  def holidays(year) do
    [
      fixed(year, 1, 1, "NEWYEARSDAY-01", "L-Ewwel tas-Sena", "New Year's Day"),
      fixed(
        year,
        2,
        10,
        "FEASTSTPAULSSHIPWRECK-01",
        "In-Nawfraġju ta’ San Pawl",
        "Feast of St. Paul's Shipwreck"
      ),
      fixed(year, 3, 19, "FEASTOFSTJOSEPH-01", "San Ġużepp", "Feast of St. Joseph"),
      fixed(year, 3, 31, "FREEDOMDAY-01", "Jum il-Ħelsien", "Freedom Day"),
      fixed(year, 5, 1, "WORKERSDAY-01", "Jum il-Ħaddiem", "Worker's Day"),
      fixed(year, 6, 7, "SETTEGIUGNO-01", "Sette Giugno", "Sette Giugno"),
      fixed(year, 6, 29, "SAINTSPETERPAUL-01", "L-Imnarja", "Feast of St.Peter and St.Paul"),
      fixed(year, 8, 15, "ASSUMPTIONDAY-01", "Santa Marija", "Assumption Day"),
      fixed(year, 9, 8, "LADYVICTORIES-01", "Il-Vittorja", "Feast of Our Lady of Victories"),
      fixed(year, 9, 21, "INDEPENDENCEDAY-01", "L-Indipendenza", "Independence Day"),
      fixed(
        year,
        12,
        8,
        "IMMACULATECONCEPTION-01",
        "L-Immakulata Kunċizzjoni",
        "Feast of the Immaculate Conception"
      ),
      fixed(year, 12, 13, "REPUBLICDAY-01", "Jum ir-Repubblika", "Republic Day"),
      fixed(year, 12, 25, "CHRISTMASDAY-01", "Il-Milied", "Christmas Day"),
      easter(year, :catholic, :good_friday, "Il-Ġimgħa l-Kbira")
    ]
  end
end
