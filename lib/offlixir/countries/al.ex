defmodule Offlixir.Countries.AL do
  @moduledoc false
  # Albania.

  import Offlixir.Rules

  # A holiday on a Saturday or a Sunday is observed the following Monday.
  @to_monday %{6 => 2, 7 => 1}

  def holidays(year) do
    [
      fixed(year, 1, 1, "NEWYEARSDAY-01", "Viti i Ri", "New Year's Day", @to_monday),
      fixed(year, 1, 2, "NEWYEARSDAY-02", "Viti i Ri", "New Year's Day", @to_monday),
      fixed(year, 3, 14, "SUMMERDAY-01", "Dita e Verës", "Summer Day", @to_monday),
      fixed(year, 3, 22, "NOWRUZ-01", "Dita e Sulltan Nevruzit", "Nowruz", @to_monday),
      fixed(year, 5, 1, "MAYDAY-01", "Dita Ndërkombëtare e Punonjësve", "May Day", @to_monday),
      fixed(
        year,
        9,
        5,
        "MOTHERTERESADAY-01",
        "Dita e Nënë Terezës",
        "Mother Teresa Day",
        @to_monday
      ),
      fixed(
        year,
        11,
        28,
        "INDEPENDENCEDAY-01",
        "Dita e Pavarësisë",
        "Independence Day",
        @to_monday
      ),
      fixed(year, 11, 29, "LIBERATIONDAY-01", "Dita e Çlirimit", "Liberation Day", @to_monday),
      fixed(year, 12, 8, "YOUTHDAY-01", "Dita Kombëtare e Rinisë", "Youth Day", @to_monday),
      fixed(year, 12, 25, "CHRISTMASDAY-01", "Krishtlindjet", "Christmas Day", @to_monday),
      easter(year, :catholic, :easter_sunday, "Pashkët Katolike"),
      easter(year, :catholic, :easter_monday, "E hëna e Pashkëve Katolike"),
      easter(year, :orthodox, :easter_sunday, "Pashkët Ortodokse"),
      easter(year, :orthodox, :easter_monday, "E hëna e Pashkëve Ortodokse")
    ]
  end
end
