defmodule Offlixir.Countries.HRTest do
  use ExUnit.Case, async: true

  # Expected values: reference data retrieved on 2026-11-10 for 1985, 1998, 2012
  # (observed dates) and 2025, 2026, 2027 (calendar dates), keeping the holidays
  # that are public and national. 1967 and the years of the "year conditions"
  # tests have no reference data and are computed by hand from the rules.

  test "1967" do
    assert Offlixir.dates!(:HR, 1967) == [
             ~D[1967-01-01],
             ~D[1967-01-06],
             ~D[1967-03-26],
             ~D[1967-03-27],
             ~D[1967-05-01],
             ~D[1967-05-25],
             ~D[1967-06-22],
             ~D[1967-08-05],
             ~D[1967-08-15],
             ~D[1967-11-01],
             ~D[1967-12-25],
             ~D[1967-12-26]
           ]
  end

  test "1985" do
    assert Offlixir.dates!(:HR, 1985) == [
             ~D[1985-01-01],
             ~D[1985-01-06],
             ~D[1985-04-07],
             ~D[1985-04-08],
             ~D[1985-05-01],
             ~D[1985-06-06],
             ~D[1985-06-22],
             ~D[1985-08-05],
             ~D[1985-08-15],
             ~D[1985-11-01],
             ~D[1985-12-25],
             ~D[1985-12-26]
           ]
  end

  test "1998" do
    assert Offlixir.dates!(:HR, 1998) == [
             ~D[1998-01-01],
             ~D[1998-01-06],
             ~D[1998-04-12],
             ~D[1998-04-13],
             ~D[1998-05-01],
             ~D[1998-06-11],
             ~D[1998-06-22],
             ~D[1998-08-05],
             ~D[1998-08-15],
             ~D[1998-11-01],
             ~D[1998-12-25],
             ~D[1998-12-26]
           ]
  end

  test "2012" do
    assert Offlixir.dates!(:HR, 2012) == [
             ~D[2012-01-01],
             ~D[2012-01-06],
             ~D[2012-04-08],
             ~D[2012-04-09],
             ~D[2012-05-01],
             ~D[2012-06-07],
             ~D[2012-06-22],
             ~D[2012-06-25],
             ~D[2012-08-05],
             ~D[2012-08-15],
             ~D[2012-10-08],
             ~D[2012-11-01],
             ~D[2012-12-25],
             ~D[2012-12-26]
           ]
  end

  test "2025" do
    assert Offlixir.dates!(:HR, 2025) == [
             ~D[2025-01-01],
             ~D[2025-01-06],
             ~D[2025-04-20],
             ~D[2025-04-21],
             ~D[2025-05-01],
             ~D[2025-05-30],
             ~D[2025-06-19],
             ~D[2025-06-22],
             ~D[2025-08-05],
             ~D[2025-08-15],
             ~D[2025-11-01],
             ~D[2025-11-18],
             ~D[2025-12-25],
             ~D[2025-12-26]
           ]
  end

  test "2026" do
    assert Offlixir.dates!(:HR, 2026) == [
             ~D[2026-01-01],
             ~D[2026-01-06],
             ~D[2026-04-05],
             ~D[2026-04-06],
             ~D[2026-05-01],
             ~D[2026-05-30],
             ~D[2026-06-04],
             ~D[2026-06-22],
             ~D[2026-08-05],
             ~D[2026-08-15],
             ~D[2026-11-01],
             ~D[2026-11-18],
             ~D[2026-12-25],
             ~D[2026-12-26]
           ]
  end

  test "2027" do
    assert Offlixir.dates!(:HR, 2027) == [
             ~D[2027-01-01],
             ~D[2027-01-06],
             ~D[2027-03-28],
             ~D[2027-03-29],
             ~D[2027-05-01],
             ~D[2027-05-27],
             ~D[2027-05-30],
             ~D[2027-06-22],
             ~D[2027-08-05],
             ~D[2027-08-15],
             ~D[2027-11-01],
             ~D[2027-11-18],
             ~D[2027-12-25],
             ~D[2027-12-26]
           ]
  end

  describe "year conditions" do
    test "Independence Day and Statehood Day apply from 2002 to 2019" do
      refute ~D[2001-06-25] in Offlixir.dates!(:HR, 2001)
      refute ~D[2001-10-08] in Offlixir.dates!(:HR, 2001)
      assert ~D[2002-06-25] in Offlixir.dates!(:HR, 2002)
      assert ~D[2002-10-08] in Offlixir.dates!(:HR, 2002)
      assert ~D[2019-06-25] in Offlixir.dates!(:HR, 2019)
      assert ~D[2019-10-08] in Offlixir.dates!(:HR, 2019)
      refute ~D[2020-06-25] in Offlixir.dates!(:HR, 2020)
      refute ~D[2020-10-08] in Offlixir.dates!(:HR, 2020)
    end

    test "National Day and Remembrance Day start in 2020" do
      refute ~D[2019-05-30] in Offlixir.dates!(:HR, 2019)
      refute ~D[2019-11-18] in Offlixir.dates!(:HR, 2019)
      assert ~D[2020-05-30] in Offlixir.dates!(:HR, 2020)
      assert ~D[2020-11-18] in Offlixir.dates!(:HR, 2020)
    end
  end

  test "English names in 2026" do
    assert Enum.map(Offlixir.holidays!(:HR, 2026), &{&1.date, &1.english_name}) == [
             {~D[2026-01-01], "New Year's Day"},
             {~D[2026-01-06], "Epiphany"},
             {~D[2026-04-05], "Easter Sunday"},
             {~D[2026-04-06], "Easter Monday"},
             {~D[2026-05-01], "International Workers' Day"},
             {~D[2026-05-30], "National Day"},
             {~D[2026-06-04], "Corpus Christi"},
             {~D[2026-06-22], "Anti-Fascist Struggle Day"},
             {~D[2026-08-05],
              "Victory and Homeland Thanksgiving Day and the Day of Croatian defenders"},
             {~D[2026-08-15], "Assumption Day"},
             {~D[2026-11-01], "All Saints' Day"},
             {~D[2026-11-18], "Remembrance Day"},
             {~D[2026-12-25], "Christmas Day"},
             {~D[2026-12-26], "St. Stephen's Day"}
           ]
  end
end
