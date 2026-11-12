defmodule Offlixir.Countries.BA do
  @moduledoc false
  # Bosnia and Herzegovina. Only the holidays that apply to both entities are kept.

  import Offlixir.Rules

  def holidays(year) do
    [
      fixed(year, 1, 1, "NEWYEARSDAY-01", "Nova Godina", "New Year's Day"),
      fixed(year, 1, 2, "NEWYEARSDAY-02", "Nova Godina", "New Year's Day"),
      fixed(year, 5, 1, "MAYDAY-01", "Praznik rada", "May Day / International Workers' Day"),
      fixed(year, 5, 2, "MAYDAY-02", "Praznik rada", "May Day / International Workers' Day")
    ]
  end
end
