defmodule Offlixir.Countries.LU do
  @moduledoc false
  # Luxembourg.

  import Offlixir.Rules

  def holidays(year) do
    [
      fixed(year, 1, 1, "NEWYEARSDAY-01", "Neijoerschdag", "New Year's Day"),
      fixed(year, 5, 1, "LABOURDAY-01", "Dag vun der Aarbecht", "Labour Day"),
      fixed(
        year,
        6,
        23,
        "SOVEREIGNSBIRTHDAY-01",
        "Groussherzogsgebuertsdag",
        "Sovereign's birthday"
      ),
      fixed(year, 8, 15, "ASSUMPTIONDAY-01", "Léiffrawëschdag", "Assumption Day"),
      fixed(year, 11, 1, "ALLSAINTSDAY-01", "Allerhellgen", "All Saints' Day"),
      fixed(year, 12, 25, "CHRISTMASDAY-01", "Chrëschtdag", "Christmas Day"),
      fixed(year, 12, 26, "STSTEPHENSDAY-01", "Stiefesdag", "St. Stephen's Day"),
      easter(year, :catholic, :easter_monday, "Ouschterméindeg"),
      easter(year, :catholic, :ascension_day, "Christi Himmelfaart"),
      easter(year, :catholic, :whit_monday, "Péngschtméindeg"),
      if(year >= 2019, do: fixed(year, 5, 9, "EUROPEDAY-01", "Europadag", "Europe Day"))
    ]
  end
end
