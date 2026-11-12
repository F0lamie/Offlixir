defmodule Offlixir.Countries.RO do
  @moduledoc false
  # Romania.

  import Offlixir.Rules

  def holidays(year) do
    [
      fixed(year, 1, 1, "NEWYEARSDAY-01", "Anul Nou", "New Year's Day"),
      fixed(year, 1, 2, "NEWYEARSDAY-02", "Anul Nou", "Day after New Year's Day"),
      fixed(
        year,
        1,
        24,
        "UNIONDAY-01",
        "Unirea Principatelor Române/Mica Unire",
        "Union Day/Small Union"
      ),
      fixed(year, 5, 1, "LABOURDAY-01", "Ziua Muncii", "Labour Day"),
      fixed(year, 6, 1, "CHILDRENSDAY-01", "Ziua Copilului", "Children's Day"),
      fixed(
        year,
        8,
        15,
        "DORMITIONTHEOTOKOS-01",
        "Adormirea Maicii Domnului/Sfânta Maria Mare",
        "Dormition of the Theotokos"
      ),
      fixed(year, 11, 30, "STANDREWSDAY-01", "Sfântul Andrei", "St. Andrew's Day"),
      fixed(
        year,
        12,
        1,
        "NATIONALDAY-01",
        "Ziua Națională/Marea Unire",
        "National Day/Great Union"
      ),
      fixed(year, 12, 25, "CHRISTMASDAY-01", "Crăciunul", "Christmas Day"),
      fixed(year, 12, 26, "STSTEPHENSDAY-01", "Crăciunul", "St. Stephen's Day"),
      easter(year, :orthodox, :easter_sunday, "Paștele"),
      easter(year, :orthodox, :easter_monday, "Paștele"),
      easter(year, :orthodox, :pentecost, "Rusaliile"),
      easter(year, :orthodox, :whit_monday, "Rusaliile"),
      if(year >= 2018, do: easter(year, :orthodox, :good_friday, "Vinerea mare")),
      if(year >= 2024, do: fixed(year, 1, 6, "EPIPHANY-01", "Bobotează", "Epiphany")),
      if(year >= 2024,
        do: fixed(year, 1, 7, "SAINTJOHNBAPTIST-01", "Sfântul Ion", "Saint John the Baptist")
      )
    ]
  end
end
