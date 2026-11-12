defmodule Offlixir.Countries.BE do
  @moduledoc false
  # Belgium.

  import Offlixir.Rules

  def holidays(year) do
    [
      fixed(year, 1, 1, "NEWYEARSDAY-01", "Nieuwjaar", "New Year's Day"),
      fixed(year, 5, 1, "LABOURDAY-01", "Dag van de arbeid", "Labour Day"),
      fixed(year, 7, 21, "NATIONALDAY-01", "Nationale feestdag", "Belgian National Day"),
      fixed(year, 8, 15, "ASSUMPTIONDAY-01", "Onze Lieve Vrouw hemelvaart", "Assumption Day"),
      fixed(year, 11, 1, "ALLSAINTSDAY-01", "Allerheiligen", "All Saints' Day"),
      fixed(year, 11, 11, "ARMISTICEDAY-01", "Wapenstilstand", "Armistice Day"),
      fixed(year, 12, 25, "CHRISTMASDAY-01", "Kerstdag", "Christmas Day"),
      easter(year, :catholic, :easter_sunday, "Pasen"),
      easter(year, :catholic, :easter_monday, "Paasmaandag"),
      easter(year, :catholic, :ascension_day, "Onze Lieve Heer hemel"),
      easter(year, :catholic, :whit_monday, "Pinkstermaandag")
    ]
  end
end
