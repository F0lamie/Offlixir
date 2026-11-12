defmodule Offlixir.Countries.PT do
  @moduledoc false
  # Portugal. Only the holidays that apply to the whole country are kept.

  import Offlixir.Rules

  def holidays(year) do
    [
      fixed(year, 1, 1, "NEWYEARSDAY-01", "Ano Novo", "New Year's Day"),
      fixed(year, 4, 25, "FREEDOMDAY-01", "Dia da Liberdade", "Freedom Day"),
      fixed(year, 5, 1, "LABOURDAY-01", "Dia do Trabalhador", "Labour Day"),
      fixed(
        year,
        6,
        10,
        "NATIONALDAY-01",
        "Dia de Portugal, de Camões e das Comunidades Portuguesas",
        "National Day"
      ),
      fixed(year, 8, 15, "ASSUMPTIONDAY-01", "Assunção de Nossa Senhora", "Assumption Day"),
      fixed(year, 10, 5, "REPUBLICDAY-01", "Implantação da República", "Republic Day"),
      fixed(year, 11, 1, "ALLSAINTSDAY-01", "Dia de Todos-os-Santos", "All Saints Day"),
      fixed(
        year,
        12,
        1,
        "RESTORATIONINDEPENDENCE-01",
        "Restauração da Independência",
        "Restoration of Independence"
      ),
      fixed(
        year,
        12,
        8,
        "IMMACULATECONCEPTION-01",
        "Imaculada Conceição",
        "Immaculate Conception"
      ),
      fixed(year, 12, 25, "CHRISTMASDAY-01", "Natal", "Christmas Day"),
      easter(year, :catholic, :good_friday, "Sexta-feira Santa"),
      easter(year, :catholic, :easter_sunday, "Domingo de Páscoa"),
      easter(year, :catholic, :corpus_christi, "Corpo de Deus")
    ]
  end
end
