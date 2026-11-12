defmodule Offlixir.Countries.HU do
  @moduledoc false
  # Hungary.

  import Offlixir.Rules

  def holidays(year) do
    [
      fixed(year, 1, 1, "NEWYEARSDAY-01", "Újév", "New Year's Day"),
      fixed(
        year,
        3,
        15,
        "1848REVOLUTIONMEMORIALDAY-01",
        "Nemzeti ünnep",
        "1848 Revolution Memorial Day"
      ),
      fixed(year, 5, 1, "LABOURDAY-01", "A munka ünnepe", "Labour day"),
      fixed(
        year,
        8,
        20,
        "STATEFOUNDATIONDAY-01",
        "Az államalapítás ünnepe",
        "State Foundation Day"
      ),
      fixed(
        year,
        10,
        23,
        "REVOLUTIONMEMORIALDAY-01",
        "Nemzeti ünnep",
        "1956 Revolution Memorial Day"
      ),
      fixed(year, 11, 1, "ALLSAINTSDAY-01", "Mindenszentek", "All Saints Day"),
      fixed(year, 12, 25, "CHRISTMASDAY-01", "Karácsony", "Christmas Day"),
      fixed(year, 12, 26, "STSTEPHENSDAY-01", "Karácsony másnapja", "St. Stephen's Day"),
      easter(year, :catholic, :easter_sunday, "Húsvétvasárnap"),
      easter(year, :catholic, :easter_monday, "Húsvéthétfő"),
      easter(year, :catholic, :pentecost, "Pünkösdvasárnap"),
      easter(year, :catholic, :whit_monday, "Pünkösdhétfő"),
      if(year >= 2017, do: easter(year, :catholic, :good_friday, "Nagypéntek"))
    ]
  end
end
