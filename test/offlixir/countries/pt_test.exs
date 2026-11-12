defmodule Offlixir.Countries.PTTest do
  use ExUnit.Case, async: true

  # Expected values: reference data retrieved on 2026-11-10 for 1985, 1998, 2012
  # (observed dates) and 2025, 2026, 2027 (calendar dates), keeping the holidays
  # that are public and national. 1967 and the years of the "year conditions"
  # tests have no reference data and are computed by hand from the rules.

  test "1967" do
    assert Offlixir.dates!(:PT, 1967) == [
             ~D[1967-01-01],
             ~D[1967-03-24],
             ~D[1967-03-26],
             ~D[1967-04-25],
             ~D[1967-05-01],
             ~D[1967-05-25],
             ~D[1967-06-10],
             ~D[1967-08-15],
             ~D[1967-10-05],
             ~D[1967-11-01],
             ~D[1967-12-01],
             ~D[1967-12-08],
             ~D[1967-12-25]
           ]
  end

  test "1985" do
    assert Offlixir.dates!(:PT, 1985) == [
             ~D[1985-01-01],
             ~D[1985-04-05],
             ~D[1985-04-07],
             ~D[1985-04-25],
             ~D[1985-05-01],
             ~D[1985-06-06],
             ~D[1985-06-10],
             ~D[1985-08-15],
             ~D[1985-10-05],
             ~D[1985-11-01],
             ~D[1985-12-01],
             ~D[1985-12-08],
             ~D[1985-12-25]
           ]
  end

  test "1998" do
    assert Offlixir.dates!(:PT, 1998) == [
             ~D[1998-01-01],
             ~D[1998-04-10],
             ~D[1998-04-12],
             ~D[1998-04-25],
             ~D[1998-05-01],
             ~D[1998-06-10],
             ~D[1998-06-11],
             ~D[1998-08-15],
             ~D[1998-10-05],
             ~D[1998-11-01],
             ~D[1998-12-01],
             ~D[1998-12-08],
             ~D[1998-12-25]
           ]
  end

  test "2012" do
    assert Offlixir.dates!(:PT, 2012) == [
             ~D[2012-01-01],
             ~D[2012-04-06],
             ~D[2012-04-08],
             ~D[2012-04-25],
             ~D[2012-05-01],
             ~D[2012-06-07],
             ~D[2012-06-10],
             ~D[2012-08-15],
             ~D[2012-10-05],
             ~D[2012-11-01],
             ~D[2012-12-01],
             ~D[2012-12-08],
             ~D[2012-12-25]
           ]
  end

  test "2025" do
    assert Offlixir.dates!(:PT, 2025) == [
             ~D[2025-01-01],
             ~D[2025-04-18],
             ~D[2025-04-20],
             ~D[2025-04-25],
             ~D[2025-05-01],
             ~D[2025-06-10],
             ~D[2025-06-19],
             ~D[2025-08-15],
             ~D[2025-10-05],
             ~D[2025-11-01],
             ~D[2025-12-01],
             ~D[2025-12-08],
             ~D[2025-12-25]
           ]
  end

  test "2026" do
    assert Offlixir.dates!(:PT, 2026) == [
             ~D[2026-01-01],
             ~D[2026-04-03],
             ~D[2026-04-05],
             ~D[2026-04-25],
             ~D[2026-05-01],
             ~D[2026-06-04],
             ~D[2026-06-10],
             ~D[2026-08-15],
             ~D[2026-10-05],
             ~D[2026-11-01],
             ~D[2026-12-01],
             ~D[2026-12-08],
             ~D[2026-12-25]
           ]
  end

  test "2027" do
    assert Offlixir.dates!(:PT, 2027) == [
             ~D[2027-01-01],
             ~D[2027-03-26],
             ~D[2027-03-28],
             ~D[2027-04-25],
             ~D[2027-05-01],
             ~D[2027-05-27],
             ~D[2027-06-10],
             ~D[2027-08-15],
             ~D[2027-10-05],
             ~D[2027-11-01],
             ~D[2027-12-01],
             ~D[2027-12-08],
             ~D[2027-12-25]
           ]
  end

  test "English names in 2026" do
    assert Enum.map(Offlixir.holidays!(:PT, 2026), &{&1.date, &1.english_name}) == [
             {~D[2026-01-01], "New Year's Day"},
             {~D[2026-04-03], "Good Friday"},
             {~D[2026-04-05], "Easter Sunday"},
             {~D[2026-04-25], "Freedom Day"},
             {~D[2026-05-01], "Labour Day"},
             {~D[2026-06-04], "Corpus Christi"},
             {~D[2026-06-10], "National Day"},
             {~D[2026-08-15], "Assumption Day"},
             {~D[2026-10-05], "Republic Day"},
             {~D[2026-11-01], "All Saints Day"},
             {~D[2026-12-01], "Restoration of Independence"},
             {~D[2026-12-08], "Immaculate Conception"},
             {~D[2026-12-25], "Christmas Day"}
           ]
  end
end
