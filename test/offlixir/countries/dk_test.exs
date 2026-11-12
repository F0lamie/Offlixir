defmodule Offlixir.Countries.DKTest do
  use ExUnit.Case, async: true

  # Expected values: reference data retrieved on 2026-11-10 for 1985, 1998, 2012
  # (observed dates) and 2025, 2026, 2027 (calendar dates), keeping the holidays
  # that are public and national. 1967 and the years of the "year conditions"
  # tests have no reference data and are computed by hand from the rules.

  test "1967" do
    assert Offlixir.dates!(:DK, 1967) == [
             ~D[1967-01-01],
             ~D[1967-03-23],
             ~D[1967-03-24],
             ~D[1967-03-26],
             ~D[1967-03-27],
             ~D[1967-04-21],
             ~D[1967-05-04],
             ~D[1967-05-14],
             ~D[1967-05-15],
             ~D[1967-12-25],
             ~D[1967-12-26]
           ]
  end

  test "1985" do
    assert Offlixir.dates!(:DK, 1985) == [
             ~D[1985-01-01],
             ~D[1985-04-04],
             ~D[1985-04-05],
             ~D[1985-04-07],
             ~D[1985-04-08],
             ~D[1985-05-03],
             ~D[1985-05-16],
             ~D[1985-05-26],
             ~D[1985-05-27],
             ~D[1985-12-25],
             ~D[1985-12-26]
           ]
  end

  test "1998" do
    assert Offlixir.dates!(:DK, 1998) == [
             ~D[1998-01-01],
             ~D[1998-04-09],
             ~D[1998-04-10],
             ~D[1998-04-12],
             ~D[1998-04-13],
             ~D[1998-05-08],
             ~D[1998-05-21],
             ~D[1998-05-31],
             ~D[1998-06-01],
             ~D[1998-12-25],
             ~D[1998-12-26]
           ]
  end

  test "2012" do
    assert Offlixir.dates!(:DK, 2012) == [
             ~D[2012-01-01],
             ~D[2012-04-05],
             ~D[2012-04-06],
             ~D[2012-04-08],
             ~D[2012-04-09],
             ~D[2012-05-04],
             ~D[2012-05-17],
             ~D[2012-05-27],
             ~D[2012-05-28],
             ~D[2012-12-25],
             ~D[2012-12-26]
           ]
  end

  test "2025" do
    assert Offlixir.dates!(:DK, 2025) == [
             ~D[2025-01-01],
             ~D[2025-04-17],
             ~D[2025-04-18],
             ~D[2025-04-20],
             ~D[2025-04-21],
             ~D[2025-05-29],
             ~D[2025-06-08],
             ~D[2025-06-09],
             ~D[2025-12-25],
             ~D[2025-12-26]
           ]
  end

  test "2026" do
    assert Offlixir.dates!(:DK, 2026) == [
             ~D[2026-01-01],
             ~D[2026-04-02],
             ~D[2026-04-03],
             ~D[2026-04-05],
             ~D[2026-04-06],
             ~D[2026-05-14],
             ~D[2026-05-24],
             ~D[2026-05-25],
             ~D[2026-12-25],
             ~D[2026-12-26]
           ]
  end

  test "2027" do
    assert Offlixir.dates!(:DK, 2027) == [
             ~D[2027-01-01],
             ~D[2027-03-25],
             ~D[2027-03-26],
             ~D[2027-03-28],
             ~D[2027-03-29],
             ~D[2027-05-06],
             ~D[2027-05-16],
             ~D[2027-05-17],
             ~D[2027-12-25],
             ~D[2027-12-26]
           ]
  end

  describe "year conditions" do
    test "General Prayer Day, the fourth Friday after Easter, stops in 2024" do
      assert ~D[2023-05-05] in Offlixir.dates!(:DK, 2023)
      refute ~D[2024-04-26] in Offlixir.dates!(:DK, 2024)
      assert length(Offlixir.dates!(:DK, 2023)) == 11
      assert length(Offlixir.dates!(:DK, 2024)) == 10
    end
  end

  test "English names in 2026" do
    assert Enum.map(Offlixir.holidays!(:DK, 2026), &{&1.date, &1.english_name}) == [
             {~D[2026-01-01], "New Year's Day"},
             {~D[2026-04-02], "Maundy Thursday"},
             {~D[2026-04-03], "Good Friday"},
             {~D[2026-04-05], "Easter Sunday"},
             {~D[2026-04-06], "Easter Monday"},
             {~D[2026-05-14], "Ascension Day"},
             {~D[2026-05-24], "Pentecost"},
             {~D[2026-05-25], "Whit Monday"},
             {~D[2026-12-25], "Christmas Day"},
             {~D[2026-12-26], "St. Stephen's Day"}
           ]
  end
end
