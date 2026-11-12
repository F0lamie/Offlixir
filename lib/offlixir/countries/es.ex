defmodule Offlixir.Countries.ES do
  @moduledoc false
  # Spain. Only the holidays that apply to every autonomous community are kept.

  import Offlixir.Rules

  def holidays(year) do
    [
      fixed(year, 1, 6, "EPIPHANY-01", "Día de Reyes / Epifanía del Señor", "Epiphany"),
      fixed(year, 5, 1, "LABOURDAY-01", "Fiesta del trabajo", "Labour Day"),
      fixed(
        year,
        10,
        12,
        "NATIONALDAYOFSPAIN-01",
        "Fiesta Nacional de España",
        "National Day of Spain"
      ),
      fixed(year, 11, 1, "ALLSAINTSDAY-01", "Día de todos los Santos", "All Saints Day"),
      fixed(year, 12, 6, "CONSTITUTIONDAY-01", "Día de la Constitución", "Constitution Day"),
      fixed(
        year,
        12,
        8,
        "IMMACULATECONCEPTION-01",
        "Inmaculada Concepción",
        "Immaculate Conception"
      ),
      easter(year, :catholic, :good_friday, "Viernes Santo"),
      christmas_day(year),
      fixed(year, 8, 15, "ASSUMPTION-01", "Asunción", "Assumption"),
      fixed(year, 1, 1, "NEWYEARSDAY-01", "Año Nuevo", "New Year's Day")
    ]
  end

  # In 2022 Christmas Day fell on a Sunday and the official list of holidays only
  # carries the following Monday, for some of the autonomous communities.
  defp christmas_day(2022), do: nil
  defp christmas_day(year), do: fixed(year, 12, 25, "CHRISTMASDAY-01", "Navidad", "Christmas Day")
end
