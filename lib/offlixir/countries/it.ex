defmodule Offlixir.Countries.IT do
  @moduledoc false
  # Italy.

  import Offlixir.Rules

  def holidays(year) do
    [
      fixed(year, 1, 1, "NEWYEARSDAY-01", "Capodanno", "New Year's Day"),
      fixed(year, 1, 6, "EPIPHANY-01", "Epifania", "Epiphany"),
      fixed(year, 4, 25, "LIBERATIONDAY-01", "Festa della Liberazione", "Liberation Day"),
      fixed(
        year,
        5,
        1,
        "INTERNATIONALWORKERSDAY-01",
        "Festa del Lavoro",
        "International Workers Day"
      ),
      fixed(year, 6, 2, "REPUBLICDAY-01", "Festa della Repubblica", "Republic Day"),
      fixed(year, 8, 15, "ASSUMPTIONDAY-01", "Ferragosto o Assunzione", "Assumption Day"),
      fixed(year, 11, 1, "ALLSAINTSDAY-01", "Tutti i Santi", "All Saints Day"),
      fixed(
        year,
        12,
        8,
        "IMMACULATECONCEPTION-01",
        "Immacolata Concezione",
        "Immaculate Conception"
      ),
      fixed(year, 12, 25, "CHRISTMASDAY-01", "Natale", "Christmas Day"),
      fixed(year, 12, 26, "STSTEPHENSDAY-01", "Santo Stefano", "St. Stephen's Day"),
      easter(year, :catholic, :easter_sunday, "Pasqua"),
      easter(year, :catholic, :easter_monday, "Lunedì dell'Angelo"),
      st_francis_of_assisi_day(year)
    ]
  end

  defp st_francis_of_assisi_day(year) when year >= 2026 do
    fixed(
      year,
      10,
      4,
      "STFRANCISOFASSISISDAY-01",
      "San Francesco d'Assisi",
      "St. Francis of Assisi's Day"
    )
  end

  defp st_francis_of_assisi_day(_year), do: nil
end
