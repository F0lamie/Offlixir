defmodule Offlixir.Countries.HUTest do
  use ExUnit.Case, async: true

  # Expected values: reference data retrieved on 2026-11-10 for 1985, 1998, 2012
  # (observed dates) and 2025, 2026, 2027 (calendar dates), keeping the holidays
  # that are public and national. 1967 and the years of the "year conditions"
  # tests have no reference data and are computed by hand from the rules.

  test "1967" do
    assert Offlixir.dates!(:HU, 1967) == [
             ~D[1967-01-01],
             ~D[1967-03-15],
             ~D[1967-03-26],
             ~D[1967-03-27],
             ~D[1967-05-01],
             ~D[1967-05-14],
             ~D[1967-05-15],
             ~D[1967-08-20],
             ~D[1967-10-23],
             ~D[1967-11-01],
             ~D[1967-12-25],
             ~D[1967-12-26]
           ]
  end

  test "1985" do
    assert Offlixir.dates!(:HU, 1985) == [
             ~D[1985-01-01],
             ~D[1985-03-15],
             ~D[1985-04-07],
             ~D[1985-04-08],
             ~D[1985-05-01],
             ~D[1985-05-26],
             ~D[1985-05-27],
             ~D[1985-08-20],
             ~D[1985-10-23],
             ~D[1985-11-01],
             ~D[1985-12-25],
             ~D[1985-12-26]
           ]
  end

  test "1998" do
    assert Offlixir.dates!(:HU, 1998) == [
             ~D[1998-01-01],
             ~D[1998-03-15],
             ~D[1998-04-12],
             ~D[1998-04-13],
             ~D[1998-05-01],
             ~D[1998-05-31],
             ~D[1998-06-01],
             ~D[1998-08-20],
             ~D[1998-10-23],
             ~D[1998-11-01],
             ~D[1998-12-25],
             ~D[1998-12-26]
           ]
  end

  test "2012" do
    assert Offlixir.dates!(:HU, 2012) == [
             ~D[2012-01-01],
             ~D[2012-03-15],
             ~D[2012-04-08],
             ~D[2012-04-09],
             ~D[2012-05-01],
             ~D[2012-05-27],
             ~D[2012-05-28],
             ~D[2012-08-20],
             ~D[2012-10-23],
             ~D[2012-11-01],
             ~D[2012-12-25],
             ~D[2012-12-26]
           ]
  end

  test "2025" do
    assert Offlixir.dates!(:HU, 2025) == [
             ~D[2025-01-01],
             ~D[2025-03-15],
             ~D[2025-04-18],
             ~D[2025-04-20],
             ~D[2025-04-21],
             ~D[2025-05-01],
             ~D[2025-06-08],
             ~D[2025-06-09],
             ~D[2025-08-20],
             ~D[2025-10-23],
             ~D[2025-11-01],
             ~D[2025-12-25],
             ~D[2025-12-26]
           ]
  end

  test "2026" do
    assert Offlixir.dates!(:HU, 2026) == [
             ~D[2026-01-01],
             ~D[2026-03-15],
             ~D[2026-04-03],
             ~D[2026-04-05],
             ~D[2026-04-06],
             ~D[2026-05-01],
             ~D[2026-05-24],
             ~D[2026-05-25],
             ~D[2026-08-20],
             ~D[2026-10-23],
             ~D[2026-11-01],
             ~D[2026-12-25],
             ~D[2026-12-26]
           ]
  end

  test "2027" do
    assert Offlixir.dates!(:HU, 2027) == [
             ~D[2027-01-01],
             ~D[2027-03-15],
             ~D[2027-03-26],
             ~D[2027-03-28],
             ~D[2027-03-29],
             ~D[2027-05-01],
             ~D[2027-05-16],
             ~D[2027-05-17],
             ~D[2027-08-20],
             ~D[2027-10-23],
             ~D[2027-11-01],
             ~D[2027-12-25],
             ~D[2027-12-26]
           ]
  end

  describe "year conditions" do
    test "Good Friday starts in 2017" do
      refute ~D[2016-03-25] in Offlixir.dates!(:HU, 2016)
      assert ~D[2017-04-14] in Offlixir.dates!(:HU, 2017)
    end
  end

  test "English names in 2026" do
    assert Enum.map(Offlixir.holidays!(:HU, 2026), &{&1.date, &1.english_name}) == [
             {~D[2026-01-01], "New Year's Day"},
             {~D[2026-03-15], "1848 Revolution Memorial Day"},
             {~D[2026-04-03], "Good Friday"},
             {~D[2026-04-05], "Easter Sunday"},
             {~D[2026-04-06], "Easter Monday"},
             {~D[2026-05-01], "Labour day"},
             {~D[2026-05-24], "Pentecost"},
             {~D[2026-05-25], "Whit Monday"},
             {~D[2026-08-20], "State Foundation Day"},
             {~D[2026-10-23], "1956 Revolution Memorial Day"},
             {~D[2026-11-01], "All Saints Day"},
             {~D[2026-12-25], "Christmas Day"},
             {~D[2026-12-26], "St. Stephen's Day"}
           ]
  end
end
