defmodule Offlixir.Countries.GR do
  @moduledoc false
  # Greece.

  import Offlixir.Rules

  alias Offlixir.Easter

  def holidays(year) do
    clean_monday = Date.add(Easter.orthodox(year), -48)

    [
      fixed(year, 1, 1, "NEWYEARSDAY-01", "Πρωτοχρονιά", "New Year's Day"),
      fixed(year, 1, 6, "EPIPHANY-01", "Θεοφάνεια", "Epiphany"),
      fixed(year, 3, 25, "ANNUNCIATION-01", "Ευαγγελισμός της Θεοτόκου", "Annunciation"),
      fixed(year, 3, 25, "INDEPENDENCEDAY-01", "Εικοστή Πέμπτη Μαρτίου", "Independence Day"),
      fixed(year, 8, 15, "ASSUMPTIONDAY-01", "Κοίμηση της Θεοτόκου", "Assumption Day"),
      fixed(year, 10, 28, "OCHIDAY-01", "Το Όχι", "Ochi Day"),
      fixed(year, 12, 25, "CHRISTMASDAY-01", "Χριστούγεννα", "Christmas Day"),
      fixed(
        year,
        12,
        26,
        "STSTEPHENSDAY-01",
        "Σύναξις Υπεραγίας Θεοτόκου Μαρίας",
        "St. Stephen's Day"
      ),
      on(clean_monday, "CLEANMONDAY-01", "Καθαρά Δευτέρα", "Clean Monday"),
      easter(year, :orthodox, :good_friday, "Μεγάλη Παρασκευή"),
      easter(year, :orthodox, :easter_sunday, "Κυριακή του Πάσχα"),
      easter(year, :orthodox, :easter_monday, "Δευτέρα του Πάσχα"),
      easter(year, :orthodox, :pentecost, "Πεντηκοστή"),
      easter(year, :orthodox, :whit_monday, "Δευτέρα Πεντηκοστής"),
      labour_day(year)
    ]
  end

  # Moved to the 7th of May in 2024 (Government Gazette B' 1406/4.3.2024), because
  # the 1st of May fell in the Orthodox Holy Week.
  defp labour_day(year) do
    day = if year == 2024, do: 7, else: 1
    fixed(year, 5, day, "LABOURDAY-01", "Εργατική Πρωτομαγιά", "Labour Day")
  end
end
