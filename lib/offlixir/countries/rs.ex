defmodule Offlixir.Countries.RS do
  @moduledoc false
  # Serbia.

  import Offlixir.Rules

  # Two day holidays: when the first day is a Sunday it is observed on the Monday,
  # which pushes the second day to the Tuesday.
  @first_day %{7 => 1}
  @second_day %{1 => 1, 7 => 1}

  def holidays(year) do
    [
      fixed(year, 1, 1, "NEWYEARSDAY-01", "Nova Godina", "New Year's Day", @first_day),
      fixed(year, 1, 2, "NEWYEARSDAY-02", "Nova Godina", "New Year's Day", @second_day),
      fixed(year, 1, 7, "OCHRISTMASDAY-01", "Božić", "Christmas Day"),
      fixed(year, 2, 15, "STATEHOODDAY-01", "Dan državnosti Srbije", "Statehood Day", @first_day),
      fixed(
        year,
        2,
        16,
        "STATEHOODDAY-02",
        "Dan državnosti Srbije",
        "Statehood Day",
        @second_day
      ),
      fixed(year, 5, 1, "LABOURDAY-01", "Praznik rada", "Labour Day", @first_day),
      fixed(year, 5, 2, "LABOURDAY-02", "Praznik rada", "Labour Day", @second_day),
      fixed(year, 11, 11, "ARMISTICEDAY-01", "Dan primirja", "Armistice Day"),
      easter(year, :orthodox, :good_friday, "Veliki petak"),
      easter(year, :orthodox, :easter_sunday, "Vaskrs (Uskrs)"),
      easter(year, :orthodox, :easter_monday, "Vaskrsni (Uskrsni) ponedeljak")
    ]
  end
end
