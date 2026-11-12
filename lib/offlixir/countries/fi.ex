defmodule Offlixir.Countries.FI do
  @moduledoc false
  # Finland.

  import Offlixir.Rules

  @saturday 6

  def holidays(year) do
    midsummer_day = on_or_after(Date.new!(year, 6, 20), @saturday)
    midsummer_eve = Date.add(midsummer_day, -1)
    all_saints_day = on_or_after(Date.new!(year, 10, 31), @saturday)

    [
      fixed(year, 1, 1, "NEWYEARSDAY-01", "Uudenvuodenpäivä", "New Year's Day"),
      fixed(year, 1, 6, "EPIPHANY-01", "Loppiainen", "Epiphany"),
      fixed(year, 5, 1, "MAYDAY-01", "Vappu", "May Day"),
      on(midsummer_eve, "MIDSUMMEREVE-01", "Juhannusaatto", "Midsummer Eve"),
      on(midsummer_day, "MIDSUMMERDAY-01", "Juhannuspäivä", "Midsummer Day"),
      on(all_saints_day, "ALLSAINTSDAY-01", "Pyhäinpäivä", "All Saints' Day"),
      fixed(year, 12, 6, "INDEPENDENCEDAY-01", "Itsenäisyyspäivä", "Independence Day"),
      fixed(year, 12, 24, "CHRISTMASEVE-01", "Jouluaatto", "Christmas Eve"),
      fixed(year, 12, 25, "CHRISTMASDAY-01", "Joulupäivä", "Christmas Day"),
      fixed(year, 12, 26, "STSTEPHENSDAY-01", "Tapaninpäivä", "St. Stephen's Day"),
      easter(year, :catholic, :good_friday, "Pitkäperjantai"),
      easter(year, :catholic, :easter_sunday, "Pääsiäispäivä"),
      easter(year, :catholic, :easter_monday, "Toinen pääsiäispäivä"),
      easter(year, :catholic, :ascension_day, "Helatorstai"),
      easter(year, :catholic, :pentecost, "Helluntaipäivä")
    ]
  end
end
