defmodule Offlixir.Countries.NL do
  @moduledoc false
  # Netherlands.

  import Offlixir.Rules

  def holidays(year) do
    [
      fixed(year, 1, 1, "NEWYEARSDAY-01", "Nieuwjaarsdag", "New Year's Day"),
      monarchs_day(year),
      fixed(year, 12, 25, "CHRISTMASDAY-01", "Eerste Kerstdag", "Christmas Day"),
      fixed(year, 12, 26, "STSTEPHENSDAY-01", "Tweede Kerstdag", "St. Stephen's Day"),
      easter(year, :catholic, :easter_sunday, "Eerste Paasdag"),
      easter(year, :catholic, :easter_monday, "Tweede Paasdag"),
      easter(year, :catholic, :ascension_day, "Hemelvaartsdag"),
      easter(year, :catholic, :pentecost, "Eerste Pinksterdag"),
      easter(year, :catholic, :whit_monday, "Tweede Pinksterdag"),
      liberation_day(year)
    ]
  end

  # Correction of the reference rules, which give King's Day on the 27th of April for every
  # year. From 1949 to 2013 the holiday was Queen's Day, on the 30th of April. On a
  # Sunday it was held the next day until 1979 and the day before from 1980. See
  # DEVIATIONS.md. The years before 1949 keep the reference rule.
  defp monarchs_day(year) when year in 1949..1979 do
    fixed(year, 4, 30, "QUEENSDAY-01", "Koninginnedag", "Queen's Day", %{7 => 1})
  end

  defp monarchs_day(year) when year in 1980..2013 do
    fixed(year, 4, 30, "QUEENSDAY-01", "Koninginnedag", "Queen's Day", %{7 => -1})
  end

  defp monarchs_day(year) do
    fixed(year, 4, 27, "KINGSDAY-01", "Koningsdag", "King's Day", %{7 => -1})
  end

  # A public holiday every five years from 1945 to 1985. The reference rules do not flag it
  # as public from 1990.
  defp liberation_day(year) when year in 1945..1989 and rem(year, 5) == 0 do
    fixed(year, 5, 5, "LIBERATIONDAY-01", "Bevrijdingsdag", "Liberation Day")
  end

  defp liberation_day(_year), do: nil
end
