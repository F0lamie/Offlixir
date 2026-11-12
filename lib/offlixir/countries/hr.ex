defmodule Offlixir.Countries.HR do
  @moduledoc false
  # Croatia.

  import Offlixir.Rules

  def holidays(year) do
    [
      fixed(year, 1, 1, "NEWYEARSDAY-01", "Nova Godina", "New Year's Day"),
      fixed(year, 1, 6, "EPIPHANY-01", "Bogojavljenje, Sveta tri kralja", "Epiphany"),
      fixed(
        year,
        5,
        1,
        "INTERNATIONALWORKERSDAY-01",
        "Međunarodni praznik rada",
        "International Workers' Day"
      ),
      fixed(
        year,
        6,
        22,
        "ANTIFASCISTSTRUGGLEDAY-01",
        "Dan antifašističke borbe",
        "Anti-Fascist Struggle Day"
      ),
      fixed(
        year,
        8,
        5,
        "THANKSGIVINGDAY-01",
        "Dan pobjede i domovinske zahvalnosti i Dan hrvatskih branitelja",
        "Victory and Homeland Thanksgiving Day and the Day of Croatian defenders"
      ),
      fixed(year, 8, 15, "ASSUMPTIONDAY-01", "Velika Gospa", "Assumption Day"),
      fixed(year, 11, 1, "ALLSAINTSDAY-01", "Dan svih svetih", "All Saints' Day"),
      fixed(year, 12, 25, "CHRISTMASDAY-01", "Božić", "Christmas Day"),
      fixed(
        year,
        12,
        26,
        "STSTEPHENSDAY-01",
        "Prvi dan po Božiću, Sveti Stjepan, Štefanje, Stipanje",
        "St. Stephen's Day"
      ),
      easter(year, :catholic, :easter_sunday, "Uskrs i uskrsni ponedjeljak"),
      easter(year, :catholic, :easter_monday, "Uskrs i uskrsni ponedjeljak"),
      easter(year, :catholic, :corpus_christi, "Tijelovo"),
      independence_day(year),
      remembrance_day(year),
      statehood_day(year),
      national_day(year)
    ]
  end

  defp independence_day(year) when year >= 2002 and year < 2020 do
    fixed(year, 10, 8, "INDEPENDENCEDAY-01", "Dan neovisnosti", "Independence Day")
  end

  defp independence_day(_year), do: nil

  defp remembrance_day(year) when year >= 2020 do
    fixed(
      year,
      11,
      18,
      "REMEMBRANCEDAY-01",
      "Dan sjećanja na žrtve Domovinskog rata",
      "Remembrance Day"
    )
  end

  defp remembrance_day(_year), do: nil

  defp statehood_day(year) when year >= 2002 and year < 2020 do
    fixed(year, 6, 25, "STATEHOODDAY-01", "Dan državnosti", "Statehood Day")
  end

  defp statehood_day(_year), do: nil

  defp national_day(year) when year >= 2020 do
    fixed(year, 5, 30, "NATIONALDAY-01", "Dan državnosti", "National Day")
  end

  defp national_day(_year), do: nil
end
