defmodule Offlixir.Countries.EE do
  @moduledoc false
  # Estonia.

  import Offlixir.Rules

  def holidays(year) do
    [
      fixed(year, 1, 1, "NEWYEARSDAY-01", "uusaasta", "New Year's Day"),
      fixed(year, 2, 24, "INDEPENDENCEDAY-01", "iseseisvuspäev", "Independence Day"),
      fixed(year, 5, 1, "SPRINGDAY-01", "kevadpüha", "Spring Day"),
      fixed(year, 6, 23, "VICTORYDAY-01", "võidupüha and jaanilaupäev", "Victory Day"),
      fixed(year, 6, 24, "MIDSUMMERDAY-01", "jaanipäev", "Midsummer Day"),
      fixed(
        year,
        8,
        20,
        "RESTORATIONINDEPENDENCEDAY-01",
        "taasiseseisvumispäev",
        "Day of Restoration of Independence"
      ),
      fixed(year, 12, 24, "CHRISTMASEVE-01", "jõululaupäev", "Christmas Eve"),
      fixed(year, 12, 25, "CHRISTMASDAY-01", "esimene jõulupüha", "Christmas Day"),
      fixed(year, 12, 26, "STSTEPHENSDAY-01", "teine jõulupüha", "St. Stephen's Day"),
      easter(year, :catholic, :good_friday, "suur reede"),
      easter(year, :catholic, :easter_sunday, "ülestõusmispühade 1. püha"),
      easter(year, :catholic, :pentecost, "nelipühade 1. püha")
    ]
  end
end
