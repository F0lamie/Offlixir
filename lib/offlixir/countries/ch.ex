defmodule Offlixir.Countries.CH do
  @moduledoc false
  # Switzerland. Only the holidays that apply to every canton are kept. Good Friday,
  # that applies to 24 of the 26 cantons, is not one of them.

  import Offlixir.Rules

  def holidays(year) do
    [
      fixed(year, 1, 1, "NEWYEARSDAY-01", "Neujahr", "New Year's Day"),
      fixed(year, 8, 1, "SWISSNATIONALDAY-01", "Bundesfeier", "Swiss National Day"),
      fixed(year, 12, 25, "CHRISTMASDAY-01", "Weihnachten", "Christmas Day"),
      easter(year, :catholic, :ascension_day, "Auffahrt")
    ]
  end
end
