defmodule Offlixir.Countries.MK do
  @moduledoc false
  # North Macedonia.

  import Offlixir.Rules

  def holidays(year) do
    [
      fixed(year, 1, 1, "NEWYEARSDAY-01", "Нова Година, Nova Godina", "New Year's Day"),
      fixed(
        year,
        1,
        7,
        "CHRISTMASDAY-01",
        "Прв ден Божик, Prv den Božik",
        "Christmas Day (Orthodox)"
      ),
      fixed(year, 5, 1, "LABOURDAY-01", "Ден на трудот, Den na trudot", "Labour Day"),
      fixed(
        year,
        5,
        24,
        "SAINTSCYRILMETHODIUSDAY-01",
        "Св. Кирил и Методиј, Ден на сèсловенските просветители",
        "Saints Cyril and Methodius Day"
      ),
      fixed(
        year,
        8,
        2,
        "REPUBLICDAY-01",
        "Ден на Републиката, Den na Republikata",
        "Day of the Republic"
      ),
      fixed(
        year,
        9,
        8,
        "INDEPENDENCEDAY-01",
        "Ден на независноста, Den na nezavisnosta",
        "Independence Day"
      ),
      fixed(
        year,
        10,
        11,
        "REVOLUTIONDAY-01",
        "Ден на востанието, Den na vostanieto",
        "Revolution Day"
      ),
      fixed(
        year,
        10,
        23,
        "REVOLUTIONARYSTRUGGLE-01",
        "Ден на македонската револуционерна борба,Den na makedonskata revolucionarna borba",
        "Day of the Macedonian Revolutionary Struggle"
      ),
      fixed(
        year,
        12,
        8,
        "SAINTCLEMENTOHRIDDAY-01",
        "Св. Климент Охридски, Sv. Kliment Ohridski",
        "Saint Clement of Ohrid Day"
      ),
      easter(year, :orthodox, :good_friday, "Велики Петок, Veliki Petok"),
      easter(year, :orthodox, :easter_sunday, "Прв ден Велигден, Prv den Veligden"),
      easter(year, :orthodox, :easter_monday, "Втор ден Велигден, Vtor den Veligden")
    ]
  end
end
