defmodule Offlixir.Countries.CY do
  @moduledoc false
  # Cyprus.

  import Offlixir.Rules

  alias Offlixir.Easter

  def holidays(year) do
    green_monday = Date.add(Easter.orthodox(year), -48)

    [
      fixed(year, 1, 1, "NEWYEARSDAY-01", "Πρωτοχρονιά", "New Year's Day"),
      fixed(year, 1, 6, "EPIPHANY-01", "Θεοφάνεια", "Epiphany"),
      fixed(
        year,
        3,
        25,
        "GREEKINDEPENDENCEDAY-01",
        "Επέτειος Ελληνικής Ανεξαρτησίας",
        "Greek Independence Day"
      ),
      fixed(year, 4, 1, "NATIONALDAY-01", "Κυπριακή Εθνική Επέτειος", "Cyprus National Day"),
      fixed(year, 5, 1, "LABOURDAY-01", "Πρωτομαγιά", "Labour Day"),
      fixed(
        year,
        8,
        15,
        "ASSUMPTIONVIRGINMARY-01",
        "Η Κοίμησις της Θεοτόκου",
        "Assumption of the Virgin Mary"
      ),
      fixed(
        year,
        10,
        1,
        "INDEPENDENCEDAY-01",
        "Επέτειος Κυπριακής Ανεξαρτησίας",
        "Cyprus Independence Day"
      ),
      fixed(year, 10, 28, "OHIDAY-01", "Το Όχι", "Ohi Day"),
      fixed(year, 12, 24, "CHRISTMASEVE-01", "Παραμονή Χριστουγέννων", "Christmas Eve"),
      fixed(year, 12, 25, "CHRISTMASDAY-01", "Χριστούγεννα", "Christmas Day"),
      fixed(
        year,
        12,
        26,
        "STSTEPHENSDAY-01",
        "Δεύτερη μέρα των Χριστουγέννων",
        "St. Stephen's Day"
      ),
      on(green_monday, "GREENMONDAY-01", "Καθαρή Δευτέρα", "Green Monday"),
      easter(year, :orthodox, :good_friday, "Μεγάλη Παρασκευή"),
      easter(year, :orthodox, :easter_monday, "Δευτέρα της Διακαινησίμου"),
      easter(year, :orthodox, :pentecost, "Αγίου Πνεύματος"),
      easter(year, :orthodox, :whit_monday, "Δευτέρα Πεντηκοστής")
    ]
  end
end
