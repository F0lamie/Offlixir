defmodule Offlixir.Countries.MTTest do
  use ExUnit.Case, async: true

  # Expected values: reference data retrieved on 2026-11-10 for 1985, 1998, 2012
  # (observed dates) and 2025, 2026, 2027 (calendar dates), keeping the holidays
  # that are public and national. 1967 and the years of the "year conditions"
  # tests have no reference data and are computed by hand from the rules.

  test "1967" do
    assert Offlixir.dates!(:MT, 1967) == [
             ~D[1967-01-01],
             ~D[1967-02-10],
             ~D[1967-03-19],
             ~D[1967-03-24],
             ~D[1967-03-31],
             ~D[1967-05-01],
             ~D[1967-06-07],
             ~D[1967-06-29],
             ~D[1967-08-15],
             ~D[1967-09-08],
             ~D[1967-09-21],
             ~D[1967-12-08],
             ~D[1967-12-13],
             ~D[1967-12-25]
           ]
  end

  test "1985" do
    assert Offlixir.dates!(:MT, 1985) == [
             ~D[1985-01-01],
             ~D[1985-02-10],
             ~D[1985-03-19],
             ~D[1985-03-31],
             ~D[1985-04-05],
             ~D[1985-05-01],
             ~D[1985-06-07],
             ~D[1985-06-29],
             ~D[1985-08-15],
             ~D[1985-09-08],
             ~D[1985-09-21],
             ~D[1985-12-08],
             ~D[1985-12-13],
             ~D[1985-12-25]
           ]
  end

  test "1998" do
    assert Offlixir.dates!(:MT, 1998) == [
             ~D[1998-01-01],
             ~D[1998-02-10],
             ~D[1998-03-19],
             ~D[1998-03-31],
             ~D[1998-04-10],
             ~D[1998-05-01],
             ~D[1998-06-07],
             ~D[1998-06-29],
             ~D[1998-08-15],
             ~D[1998-09-08],
             ~D[1998-09-21],
             ~D[1998-12-08],
             ~D[1998-12-13],
             ~D[1998-12-25]
           ]
  end

  test "2012" do
    assert Offlixir.dates!(:MT, 2012) == [
             ~D[2012-01-01],
             ~D[2012-02-10],
             ~D[2012-03-19],
             ~D[2012-03-31],
             ~D[2012-04-06],
             ~D[2012-05-01],
             ~D[2012-06-07],
             ~D[2012-06-29],
             ~D[2012-08-15],
             ~D[2012-09-08],
             ~D[2012-09-21],
             ~D[2012-12-08],
             ~D[2012-12-13],
             ~D[2012-12-25]
           ]
  end

  test "2025" do
    assert Offlixir.dates!(:MT, 2025) == [
             ~D[2025-01-01],
             ~D[2025-02-10],
             ~D[2025-03-19],
             ~D[2025-03-31],
             ~D[2025-04-18],
             ~D[2025-05-01],
             ~D[2025-06-07],
             ~D[2025-06-29],
             ~D[2025-08-15],
             ~D[2025-09-08],
             ~D[2025-09-21],
             ~D[2025-12-08],
             ~D[2025-12-13],
             ~D[2025-12-25]
           ]
  end

  test "2026" do
    assert Offlixir.dates!(:MT, 2026) == [
             ~D[2026-01-01],
             ~D[2026-02-10],
             ~D[2026-03-19],
             ~D[2026-03-31],
             ~D[2026-04-03],
             ~D[2026-05-01],
             ~D[2026-06-07],
             ~D[2026-06-29],
             ~D[2026-08-15],
             ~D[2026-09-08],
             ~D[2026-09-21],
             ~D[2026-12-08],
             ~D[2026-12-13],
             ~D[2026-12-25]
           ]
  end

  test "2027" do
    assert Offlixir.dates!(:MT, 2027) == [
             ~D[2027-01-01],
             ~D[2027-02-10],
             ~D[2027-03-19],
             ~D[2027-03-26],
             ~D[2027-03-31],
             ~D[2027-05-01],
             ~D[2027-06-07],
             ~D[2027-06-29],
             ~D[2027-08-15],
             ~D[2027-09-08],
             ~D[2027-09-21],
             ~D[2027-12-08],
             ~D[2027-12-13],
             ~D[2027-12-25]
           ]
  end

  test "English names in 2026" do
    assert Enum.map(Offlixir.holidays!(:MT, 2026), &{&1.date, &1.english_name}) == [
             {~D[2026-01-01], "New Year's Day"},
             {~D[2026-02-10], "Feast of St. Paul's Shipwreck"},
             {~D[2026-03-19], "Feast of St. Joseph"},
             {~D[2026-03-31], "Freedom Day"},
             {~D[2026-04-03], "Good Friday"},
             {~D[2026-05-01], "Worker's Day"},
             {~D[2026-06-07], "Sette Giugno"},
             {~D[2026-06-29], "Feast of St.Peter and St.Paul"},
             {~D[2026-08-15], "Assumption Day"},
             {~D[2026-09-08], "Feast of Our Lady of Victories"},
             {~D[2026-09-21], "Independence Day"},
             {~D[2026-12-08], "Feast of the Immaculate Conception"},
             {~D[2026-12-13], "Republic Day"},
             {~D[2026-12-25], "Christmas Day"}
           ]
  end
end
