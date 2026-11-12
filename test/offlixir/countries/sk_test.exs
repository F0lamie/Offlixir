defmodule Offlixir.Countries.SKTest do
  use ExUnit.Case, async: true

  # Expected values: reference data retrieved on 2026-11-10 for 1985, 1998, 2012
  # (observed dates) and 2025, 2026, 2027 (calendar dates), keeping the holidays
  # that are public and national. 1967 and the years of the "year conditions"
  # tests have no reference data and are computed by hand from the rules.

  test "1967" do
    assert Offlixir.dates!(:SK, 1967) == [
             ~D[1967-01-01],
             ~D[1967-01-06],
             ~D[1967-03-24],
             ~D[1967-03-27],
             ~D[1967-05-01],
             ~D[1967-05-08],
             ~D[1967-07-05],
             ~D[1967-08-29],
             ~D[1967-09-01],
             ~D[1967-09-15],
             ~D[1967-11-01],
             ~D[1967-11-17],
             ~D[1967-12-24],
             ~D[1967-12-25],
             ~D[1967-12-26]
           ]
  end

  test "1985" do
    assert Offlixir.dates!(:SK, 1985) == [
             ~D[1985-01-01],
             ~D[1985-01-06],
             ~D[1985-04-05],
             ~D[1985-04-08],
             ~D[1985-05-01],
             ~D[1985-05-08],
             ~D[1985-07-05],
             ~D[1985-08-29],
             ~D[1985-09-01],
             ~D[1985-09-15],
             ~D[1985-11-01],
             ~D[1985-11-17],
             ~D[1985-12-24],
             ~D[1985-12-25],
             ~D[1985-12-26]
           ]
  end

  test "1998" do
    assert Offlixir.dates!(:SK, 1998) == [
             ~D[1998-01-01],
             ~D[1998-01-06],
             ~D[1998-04-10],
             ~D[1998-04-13],
             ~D[1998-05-01],
             ~D[1998-05-08],
             ~D[1998-07-05],
             ~D[1998-08-29],
             ~D[1998-09-01],
             ~D[1998-09-15],
             ~D[1998-11-01],
             ~D[1998-11-17],
             ~D[1998-12-24],
             ~D[1998-12-25],
             ~D[1998-12-26]
           ]
  end

  test "2012" do
    assert Offlixir.dates!(:SK, 2012) == [
             ~D[2012-01-01],
             ~D[2012-01-06],
             ~D[2012-04-06],
             ~D[2012-04-09],
             ~D[2012-05-01],
             ~D[2012-05-08],
             ~D[2012-07-05],
             ~D[2012-08-29],
             ~D[2012-09-01],
             ~D[2012-09-15],
             ~D[2012-11-01],
             ~D[2012-11-17],
             ~D[2012-12-24],
             ~D[2012-12-25],
             ~D[2012-12-26]
           ]
  end

  test "2025" do
    assert Offlixir.dates!(:SK, 2025) == [
             ~D[2025-01-01],
             ~D[2025-01-06],
             ~D[2025-04-18],
             ~D[2025-04-21],
             ~D[2025-05-01],
             ~D[2025-05-08],
             ~D[2025-07-05],
             ~D[2025-08-29],
             ~D[2025-09-15],
             ~D[2025-11-01],
             ~D[2025-12-24],
             ~D[2025-12-25],
             ~D[2025-12-26]
           ]
  end

  test "2026" do
    assert Offlixir.dates!(:SK, 2026) == [
             ~D[2026-01-01],
             ~D[2026-01-06],
             ~D[2026-04-03],
             ~D[2026-04-06],
             ~D[2026-05-01],
             ~D[2026-07-05],
             ~D[2026-08-29],
             ~D[2026-11-01],
             ~D[2026-12-24],
             ~D[2026-12-25],
             ~D[2026-12-26]
           ]
  end

  test "2027" do
    assert Offlixir.dates!(:SK, 2027) == [
             ~D[2027-01-01],
             ~D[2027-01-06],
             ~D[2027-03-26],
             ~D[2027-03-29],
             ~D[2027-05-01],
             ~D[2027-05-08],
             ~D[2027-07-05],
             ~D[2027-08-29],
             ~D[2027-09-15],
             ~D[2027-11-01],
             ~D[2027-12-24],
             ~D[2027-12-25],
             ~D[2027-12-26]
           ]
  end

  describe "year conditions" do
    test "Constitution Day and Struggle for Freedom and Democracy Day stop in 2025" do
      assert ~D[2024-09-01] in Offlixir.dates!(:SK, 2024)
      assert ~D[2024-11-17] in Offlixir.dates!(:SK, 2024)
      refute ~D[2025-09-01] in Offlixir.dates!(:SK, 2025)
      refute ~D[2025-11-17] in Offlixir.dates!(:SK, 2025)
      refute ~D[2027-09-01] in Offlixir.dates!(:SK, 2027)
      refute ~D[2027-11-17] in Offlixir.dates!(:SK, 2027)
    end

    test "the 8th of May and the 15th of September are not days off in 2026 only" do
      assert ~D[2025-05-08] in Offlixir.dates!(:SK, 2025)
      assert ~D[2025-09-15] in Offlixir.dates!(:SK, 2025)
      refute ~D[2026-05-08] in Offlixir.dates!(:SK, 2026)
      refute ~D[2026-09-15] in Offlixir.dates!(:SK, 2026)
      assert ~D[2027-05-08] in Offlixir.dates!(:SK, 2027)
      assert ~D[2027-09-15] in Offlixir.dates!(:SK, 2027)
    end

    test "number of holidays per year" do
      assert length(Offlixir.dates!(:SK, 2024)) == 15
      assert length(Offlixir.dates!(:SK, 2025)) == 13
      assert length(Offlixir.dates!(:SK, 2026)) == 11
      assert length(Offlixir.dates!(:SK, 2027)) == 13
    end
  end

  test "English names in 2026" do
    assert Enum.map(Offlixir.holidays!(:SK, 2026), &{&1.date, &1.english_name}) == [
             {~D[2026-01-01], "Day of the Establishment of the Slovak Republic"},
             {~D[2026-01-06], "Epiphany"},
             {~D[2026-04-03], "Good Friday"},
             {~D[2026-04-06], "Easter Monday"},
             {~D[2026-05-01], "International Workers' Day"},
             {~D[2026-07-05], "St. Cyril and Methodius Day"},
             {~D[2026-08-29], "Slovak National Uprising anniversary"},
             {~D[2026-11-01], "All Saints’ Day"},
             {~D[2026-12-24], "Christmas Eve"},
             {~D[2026-12-25], "Christmas Day"},
             {~D[2026-12-26], "St. Stephen's Day"}
           ]
  end
end
