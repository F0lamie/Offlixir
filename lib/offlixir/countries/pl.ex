defmodule Offlixir.Countries.PL do
  @moduledoc false
  # Poland.

  import Offlixir.Rules

  def holidays(year) do
    [
      fixed(year, 1, 1, "NEWYEARSDAY-01", "Nowy Rok", "New Year's Day"),
      fixed(year, 1, 6, "EPIPHANY-01", "Święto Trzech Króli", "Epiphany"),
      fixed(year, 5, 1, "MAYDAY-01", "Święto Pracy", "May Day"),
      fixed(year, 5, 3, "CONSTITUTIONDAY-01", "Święto Konstytucji 3 Maja", "Constitution Day"),
      fixed(
        year,
        8,
        15,
        "ASSUMPTIONDAY-01",
        "Wniebowzięcie Najświętszej Maryi Panny",
        "Assumption Day"
      ),
      fixed(year, 11, 1, "ALLSAINTSDAY-01", "Wszystkich Świętych", "All Saints' Day"),
      fixed(
        year,
        11,
        11,
        "INDEPENDENCEDAY-01",
        "Narodowe Święto Niepodległości",
        "Independence Day"
      ),
      fixed(year, 12, 25, "CHRISTMASDAY-01", "Boże Narodzenie", "Christmas Day"),
      fixed(
        year,
        12,
        26,
        "STSTEPHENSDAY-01",
        "Drugi Dzień Bożego Narodzenia",
        "St. Stephen's Day"
      ),
      easter(year, :catholic, :easter_sunday, "Wielkanoc"),
      easter(year, :catholic, :easter_monday, "Drugi Dzień Wielkanocy"),
      easter(year, :catholic, :pentecost, "Zielone Świątki"),
      easter(year, :catholic, :corpus_christi, "Boże Ciało"),
      independence_centenary(year),
      christmas_eve(year)
    ]
  end

  # One-off holiday for the 100th anniversary of independence.
  defp independence_centenary(2018) do
    fixed(
      2018,
      11,
      12,
      "INDEPENDENCEDAY-02",
      "Narodowe Święto Niepodległości",
      "Independence Day"
    )
  end

  defp independence_centenary(_year), do: nil

  defp christmas_eve(year) when year >= 2025 do
    fixed(year, 12, 24, "CHRISTMASEVE-01", "Wigilia Bożego Narodzenia", "Christmas Eve")
  end

  defp christmas_eve(_year), do: nil
end
