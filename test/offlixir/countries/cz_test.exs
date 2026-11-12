defmodule Offlixir.Countries.CZTest do
  use ExUnit.Case, async: true

  # Expected values: reference data retrieved on 2026-11-10 for 1985, 1998, 2012
  # (observed dates) and 2025, 2026, 2027 (calendar dates), keeping the holidays
  # that are public and national. 1967 and the years of the "year conditions"
  # tests have no reference data and are computed by hand from the rules.

  test "1967" do
    assert Offlixir.dates!(:CZ, 1967) == [
             ~D[1967-01-01],
             ~D[1967-03-24],
             ~D[1967-03-27],
             ~D[1967-05-01],
             ~D[1967-05-08],
             ~D[1967-07-05],
             ~D[1967-07-06],
             ~D[1967-09-28],
             ~D[1967-10-28],
             ~D[1967-11-17],
             ~D[1967-12-24],
             ~D[1967-12-25],
             ~D[1967-12-26]
           ]
  end

  test "1985" do
    assert Offlixir.dates!(:CZ, 1985) == [
             ~D[1985-01-01],
             ~D[1985-04-05],
             ~D[1985-04-08],
             ~D[1985-05-01],
             ~D[1985-05-08],
             ~D[1985-07-05],
             ~D[1985-07-06],
             ~D[1985-09-28],
             ~D[1985-10-28],
             ~D[1985-11-17],
             ~D[1985-12-24],
             ~D[1985-12-25],
             ~D[1985-12-26]
           ]
  end

  test "1998" do
    assert Offlixir.dates!(:CZ, 1998) == [
             ~D[1998-01-01],
             ~D[1998-04-10],
             ~D[1998-04-13],
             ~D[1998-05-01],
             ~D[1998-05-08],
             ~D[1998-07-05],
             ~D[1998-07-06],
             ~D[1998-09-28],
             ~D[1998-10-28],
             ~D[1998-11-17],
             ~D[1998-12-24],
             ~D[1998-12-25],
             ~D[1998-12-26]
           ]
  end

  test "2012" do
    assert Offlixir.dates!(:CZ, 2012) == [
             ~D[2012-01-01],
             ~D[2012-04-06],
             ~D[2012-04-09],
             ~D[2012-05-01],
             ~D[2012-05-08],
             ~D[2012-07-05],
             ~D[2012-07-06],
             ~D[2012-09-28],
             ~D[2012-10-28],
             ~D[2012-11-17],
             ~D[2012-12-24],
             ~D[2012-12-25],
             ~D[2012-12-26]
           ]
  end

  test "2025" do
    assert Offlixir.dates!(:CZ, 2025) == [
             ~D[2025-01-01],
             ~D[2025-04-18],
             ~D[2025-04-21],
             ~D[2025-05-01],
             ~D[2025-05-08],
             ~D[2025-07-05],
             ~D[2025-07-06],
             ~D[2025-09-28],
             ~D[2025-10-28],
             ~D[2025-11-17],
             ~D[2025-12-24],
             ~D[2025-12-25],
             ~D[2025-12-26]
           ]
  end

  test "2026" do
    assert Offlixir.dates!(:CZ, 2026) == [
             ~D[2026-01-01],
             ~D[2026-04-03],
             ~D[2026-04-06],
             ~D[2026-05-01],
             ~D[2026-05-08],
             ~D[2026-07-05],
             ~D[2026-07-06],
             ~D[2026-09-28],
             ~D[2026-10-28],
             ~D[2026-11-17],
             ~D[2026-12-24],
             ~D[2026-12-25],
             ~D[2026-12-26]
           ]
  end

  test "2027" do
    assert Offlixir.dates!(:CZ, 2027) == [
             ~D[2027-01-01],
             ~D[2027-03-26],
             ~D[2027-03-29],
             ~D[2027-05-01],
             ~D[2027-05-08],
             ~D[2027-07-05],
             ~D[2027-07-06],
             ~D[2027-09-28],
             ~D[2027-10-28],
             ~D[2027-11-17],
             ~D[2027-12-24],
             ~D[2027-12-25],
             ~D[2027-12-26]
           ]
  end

  test "English names in 2026" do
    assert Enum.map(Offlixir.holidays!(:CZ, 2026), &{&1.date, &1.english_name}) == [
             {~D[2026-01-01], "New Year's Day"},
             {~D[2026-04-03], "Good Friday"},
             {~D[2026-04-06], "Easter Monday"},
             {~D[2026-05-01], "Labour Day"},
             {~D[2026-05-08], "Liberation Day"},
             {~D[2026-07-05], "Saints Cyril and Methodius Day"},
             {~D[2026-07-06], "Jan Hus Day"},
             {~D[2026-09-28], "St. Wenceslas Day"},
             {~D[2026-10-28], "Independent Czechoslovak State Day"},
             {~D[2026-11-17], "Struggle for Freedom and Democracy Day"},
             {~D[2026-12-24], "Christmas Eve"},
             {~D[2026-12-25], "Christmas Day"},
             {~D[2026-12-26], "St. Stephen's Day"}
           ]
  end
end
