defmodule Offlixir.Countries.SK do
  @moduledoc false
  # Slovakia.

  import Offlixir.Rules

  def holidays(year) do
    [
      fixed(
        year,
        1,
        1,
        "ESTABLISHMENTSLOVAKREPUBLIC-01",
        "Deň vzniku Slovenskej republiky",
        "Day of the Establishment of the Slovak Republic"
      ),
      fixed(year, 1, 6, "EPIPHANY-01", "Zjavenie Pána", "Epiphany"),
      fixed(
        year,
        5,
        1,
        "INTERNATIONALWORKERSDAY-01",
        "Sviatok práce",
        "International Workers' Day"
      ),
      fixed(
        year,
        7,
        5,
        "STCYRILANDMETHODIUSDAY-01",
        "Sviatok svätého Cyrila a svätého Metoda",
        "St. Cyril and Methodius Day"
      ),
      fixed(
        year,
        8,
        29,
        "SLOVAKNATIONALUPRISING-01",
        "Výročie Slovenského národného povstania",
        "Slovak National Uprising anniversary"
      ),
      fixed(year, 11, 1, "ALLSAINTSDAY-01", "Sviatok Všetkých svätých", "All Saints’ Day"),
      fixed(year, 12, 24, "CHRISTMASEVE-01", "Štedrý deň", "Christmas Eve"),
      fixed(year, 12, 25, "CHRISTMASDAY-01", "Prvý sviatok vianočný", "Christmas Day"),
      fixed(year, 12, 26, "STSTEPHENSDAY-01", "Druhý sviatok vianočný", "St. Stephen's Day"),
      easter(year, :catholic, :good_friday, "Veľkonočný piatok"),
      easter(year, :catholic, :easter_monday, "Veľkonočný pondelok"),
      constitution_day(year),
      day_of_our_lady_of_the_seven_sorrows(year),
      day_of_victory_over_fascism(year),
      struggle_for_freedom_and_democracy_day(year)
    ]
  end

  # The four holidays below stay in the Slovak calendar but are not days off the
  # years given: they are then observances, not public holidays.

  # Not a day off from 2025.
  defp constitution_day(year) when year < 2025 do
    fixed(
      year,
      9,
      1,
      "CONSTITUTIONDAY-01",
      "Deň Ústavy Slovenskej republiky",
      "Day of the Constitution of the Slovak Republic"
    )
  end

  defp constitution_day(_year), do: nil

  # Not a day off in 2026 only.
  defp day_of_our_lady_of_the_seven_sorrows(2026), do: nil

  defp day_of_our_lady_of_the_seven_sorrows(year) do
    fixed(
      year,
      9,
      15,
      "DAYOURLADYSEVENSORROWS-01",
      "Sedembolestná Panna Mária",
      "Day of Our Lady of the Seven Sorrows"
    )
  end

  # Not a day off in 2026 only.
  defp day_of_victory_over_fascism(2026), do: nil

  defp day_of_victory_over_fascism(year) do
    fixed(
      year,
      5,
      8,
      "DAYOFVICTORYOVERFASCISM-01",
      "Deň víťazstva nad fašizmom",
      "Day of victory over fascism"
    )
  end

  # Not a day off from 2025.
  defp struggle_for_freedom_and_democracy_day(year) when year < 2025 do
    fixed(
      year,
      11,
      17,
      "STRUGGLEFREEDOMDEMOCRACYDAY-01",
      "Deň boja za slobodu a demokraciu",
      "Struggle for Freedom and Democracy Day"
    )
  end

  defp struggle_for_freedom_and_democracy_day(_year), do: nil
end
