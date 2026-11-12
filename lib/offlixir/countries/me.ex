defmodule Offlixir.Countries.ME do
  @moduledoc false
  # Montenegro. The religious holidays are optional days off: they are not kept.

  import Offlixir.Rules

  def holidays(year) do
    [
      fixed(year, 1, 1, "NEWYEARSDAY-01", "Nova godina", "New Year's Day"),
      fixed(year, 1, 2, "NEWYEARSDAY-02", "Nova godina", "New Year's Day"),
      fixed(year, 5, 1, "LABOURDAY-01", "Praznik rada", "Labour Day"),
      fixed(year, 5, 2, "LABOURDAY-02", "Praznik rada", "Labour Day"),
      fixed(year, 5, 21, "INDEPENDENCEDAY-01", "Dan nezavisnosti", "Independence Day"),
      fixed(year, 5, 22, "INDEPENDENCEDAY-02", "Dan nezavisnosti", "Independence Day"),
      fixed(year, 7, 13, "STATEHOODDAY-01", "Dan državnosti", "Statehood Day"),
      fixed(year, 7, 14, "STATEHOODDAY-02", "Dan državnosti", "Statehood Day")
    ]
  end
end
