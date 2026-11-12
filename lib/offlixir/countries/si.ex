defmodule Offlixir.Countries.SI do
  @moduledoc false
  # Slovenia.

  import Offlixir.Rules

  def holidays(year) do
    [
      fixed(year, 1, 1, "NEWYEARSDAY-01", "novo leto", "New Year's Day"),
      fixed(year, 1, 2, "NEWYEARSDAY-02", "novo leto", "New Year's Day"),
      fixed(year, 2, 8, "PRESERENDAY-01", "Prešernov dan", "Prešeren Day"),
      fixed(
        year,
        4,
        27,
        "DAYOFUPRISINGAGAINSTOCCUPATION-01",
        "dan upora proti okupatorju",
        "Day of Uprising Against Occupation"
      ),
      fixed(year, 5, 1, "LABOURDAY-01", "praznik dela", "Labour Day"),
      fixed(year, 5, 2, "LABOURDAY-02", "praznik dela", "Labour Day"),
      fixed(year, 6, 25, "STATEHOODDAY-01", "dan državnosti", "Statehood Day"),
      fixed(year, 8, 15, "ASSUMPTIONDAY-01", "Marijino vnebovzetje", "Assumption Day"),
      fixed(year, 10, 31, "REFORMATIONDAY-01", "dan reformacije", "Reformation Day"),
      fixed(year, 11, 1, "DAYOFTHEDEAD-01", "dan spomina na mrtve", "Day of the Dead"),
      fixed(year, 12, 25, "CHRISTMASDAY-01", "božič", "Christmas Day"),
      fixed(
        year,
        12,
        26,
        "INDEPENDENCEANDUNITYDAY-01",
        "dan samostojnosti in enotnosti",
        "Independence and Unity Day"
      ),
      easter(year, :catholic, :easter_sunday, "velikonočna nedelja in ponedeljek"),
      easter(year, :catholic, :easter_monday, "velikonočna nedelja in ponedeljek"),
      easter(year, :catholic, :pentecost, "binkoštna nedelja"),
      if(year == 2023,
        do: fixed(year, 8, 14, "SOLIDARITYDAY-01", "dan solidarnosti", "Solidarity Day")
      )
    ]
  end
end
