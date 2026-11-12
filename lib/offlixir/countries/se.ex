defmodule Offlixir.Countries.SE do
  @moduledoc false
  # Sweden.

  import Offlixir.Rules

  @saturday 6

  def holidays(year) do
    midsummer_day = on_or_after(Date.new!(year, 6, 20), @saturday)
    midsummer_eve = Date.add(midsummer_day, -1)
    all_saints_day = on_or_after(Date.new!(year, 10, 31), @saturday)

    [
      fixed(year, 1, 1, "NEWYEARSDAY-01", "Nyårsdagen", "New Year's Day"),
      fixed(year, 1, 6, "EPIPHANY-01", "Trettondedag jul", "Epiphany"),
      fixed(year, 5, 1, "INTERNATIONALWORKERSDAY-01", "Första maj", "International Workers' Day"),
      on(midsummer_eve, "MIDSUMMEREVE-01", "Midsommarafton", "Midsummer Eve"),
      on(midsummer_day, "MIDSUMMERDAY-01", "Midsommardagen", "Midsummer Day"),
      on(all_saints_day, "ALLSAINTSDAY-01", "Alla helgons dag", "All Saints' Day"),
      fixed(year, 12, 24, "CHRISTMASEVE-01", "Julafton", "Christmas Eve"),
      fixed(year, 12, 25, "CHRISTMASDAY-01", "Juldagen", "Christmas Day"),
      fixed(year, 12, 26, "STSTEPHENSDAY-01", "Annandag jul", "St. Stephen's Day"),
      fixed(year, 12, 31, "NEWYEARSEVE-01", "Nyårsafton", "New Year's Eve"),
      easter(year, :catholic, :good_friday, "Långfredagen"),
      easter(year, :catholic, :easter_sunday, "Påskdagen"),
      easter(year, :catholic, :easter_monday, "Annandag påsk"),
      easter(year, :catholic, :ascension_day, "Kristi himmelsfärdsdag"),
      easter(year, :catholic, :pentecost, "Pingstdagen"),
      # Whit Monday was replaced by the National Day in 2005.
      if(year < 2005, do: easter(year, :catholic, :whit_monday, "Annandag Pingst")),
      if(year >= 2005,
        do: fixed(year, 6, 6, "NATIONALDAY-01", "Sveriges nationaldag", "National Day of Sweden")
      )
    ]
  end
end
