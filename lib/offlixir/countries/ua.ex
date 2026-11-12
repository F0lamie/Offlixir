defmodule Offlixir.Countries.UA do
  @moduledoc false
  # Ukraine.

  import Offlixir.Rules

  def holidays(year) do
    [
      fixed(year, 1, 1, "NEWYEARSDAY-01", "Новий Рік", "New Year's Day"),
      fixed(
        year,
        3,
        8,
        "INTERNATIONALWOMENSDAY-01",
        "Міжнародний жіночий день",
        "International Women's Day"
      ),
      fixed(year, 5, 1, "INTERNATIONALWORKERSDAY-01", "День праці", "International Workers' Day"),
      fixed(year, 6, 28, "CONSTITUTIONDAY-01", "День Конституції", "Constitution Day"),
      fixed(year, 8, 24, "INDEPENDENCEDAY-01", "День Незалежності", "Independence Day"),
      easter(year, :orthodox, :easter_sunday, "Великдень"),
      easter(year, :orthodox, :pentecost, "Трійця"),
      julian_christmas_day(year),
      statehood_day(year),
      defender_day(year),
      gregorian_christmas_day(year),
      victory_day(year)
    ]
  end

  defp julian_christmas_day(year) when year < 2024 do
    fixed(year, 1, 7, "OCHRISTMASDAY-01", "Різдво", "Christmas Day (Orthodox)")
  end

  defp julian_christmas_day(_year), do: nil

  defp statehood_day(year) when year < 2022, do: nil

  defp statehood_day(year) do
    day = if year < 2024, do: 28, else: 15
    fixed(year, 7, day, "STATEHOODDAY-01", "День Української Державності", "Statehood Day")
  end

  defp defender_day(year) when year < 2015, do: nil

  defp defender_day(year) do
    day = if year < 2023, do: 14, else: 1

    fixed(
      year,
      10,
      day,
      "DEFENDEROFUKRAINEDAY-01",
      "День захисників і захисниць України",
      "Defender of Ukraine Day"
    )
  end

  defp gregorian_christmas_day(year) when year >= 2017 do
    fixed(year, 12, 25, "CHRISTMASDAY-01", "Різдво Христове", "Christmas Day")
  end

  defp gregorian_christmas_day(_year), do: nil

  defp victory_day(year) do
    day = if year < 2024, do: 9, else: 8

    fixed(
      year,
      5,
      day,
      "VICTORYDAY-01",
      "День перемоги над нацизмом у Другій світовій війні",
      "Victory day over Nazism in World War II"
    )
  end
end
