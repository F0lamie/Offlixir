defmodule Offlixir.Countries.VATest do
  use ExUnit.Case, async: true

  # Expected values: reference data retrieved on 2026-11-10 for 1985, 1998, 2012
  # (observed dates) and 2025, 2026, 2027 (calendar dates), keeping the holidays
  # that are public and national. 1967 and the years of the "year conditions"
  # tests have no reference data and are computed by hand from the rules.
  #
  # Deliberate deviation: the reference data gives the anniversary of the election of Pope
  # Francis (13th of March) and his name day (23rd of April) for every year. Offlixir
  # only gives them during his pontificate, so the lists below do not carry them
  # outside of it. See DEVIATIONS.md.

  test "1967" do
    assert Offlixir.dates!(:VA, 1967) == [
             ~D[1967-01-01],
             ~D[1967-01-06],
             ~D[1967-02-11],
             ~D[1967-03-19],
             ~D[1967-03-27],
             ~D[1967-05-01],
             ~D[1967-06-29],
             ~D[1967-08-15],
             ~D[1967-09-08],
             ~D[1967-11-01],
             ~D[1967-12-08],
             ~D[1967-12-25],
             ~D[1967-12-26]
           ]
  end

  test "1985" do
    assert Offlixir.dates!(:VA, 1985) == [
             ~D[1985-01-01],
             ~D[1985-01-06],
             ~D[1985-02-11],
             ~D[1985-03-19],
             ~D[1985-04-08],
             ~D[1985-05-01],
             ~D[1985-06-29],
             ~D[1985-08-15],
             ~D[1985-09-08],
             ~D[1985-11-01],
             ~D[1985-12-08],
             ~D[1985-12-25],
             ~D[1985-12-26]
           ]
  end

  test "1998" do
    assert Offlixir.dates!(:VA, 1998) == [
             ~D[1998-01-01],
             ~D[1998-01-06],
             ~D[1998-02-11],
             ~D[1998-03-19],
             ~D[1998-04-13],
             ~D[1998-05-01],
             ~D[1998-06-29],
             ~D[1998-08-15],
             ~D[1998-09-08],
             ~D[1998-11-01],
             ~D[1998-12-08],
             ~D[1998-12-25],
             ~D[1998-12-26]
           ]
  end

  test "2012" do
    assert Offlixir.dates!(:VA, 2012) == [
             ~D[2012-01-01],
             ~D[2012-01-06],
             ~D[2012-02-11],
             ~D[2012-03-19],
             ~D[2012-04-09],
             ~D[2012-05-01],
             ~D[2012-06-29],
             ~D[2012-08-15],
             ~D[2012-09-08],
             ~D[2012-11-01],
             ~D[2012-12-08],
             ~D[2012-12-25],
             ~D[2012-12-26]
           ]
  end

  test "2025" do
    assert Offlixir.dates!(:VA, 2025) == [
             ~D[2025-01-01],
             ~D[2025-01-06],
             ~D[2025-02-11],
             ~D[2025-03-13],
             ~D[2025-03-19],
             ~D[2025-04-21],
             ~D[2025-05-01],
             ~D[2025-06-29],
             ~D[2025-08-15],
             ~D[2025-09-08],
             ~D[2025-11-01],
             ~D[2025-12-08],
             ~D[2025-12-25],
             ~D[2025-12-26]
           ]
  end

  test "2026" do
    assert Offlixir.dates!(:VA, 2026) == [
             ~D[2026-01-01],
             ~D[2026-01-06],
             ~D[2026-02-11],
             ~D[2026-03-19],
             ~D[2026-04-06],
             ~D[2026-05-01],
             ~D[2026-06-29],
             ~D[2026-08-15],
             ~D[2026-09-08],
             ~D[2026-11-01],
             ~D[2026-12-08],
             ~D[2026-12-25],
             ~D[2026-12-26]
           ]
  end

  test "2027" do
    assert Offlixir.dates!(:VA, 2027) == [
             ~D[2027-01-01],
             ~D[2027-01-06],
             ~D[2027-02-11],
             ~D[2027-03-19],
             ~D[2027-03-29],
             ~D[2027-05-01],
             ~D[2027-06-29],
             ~D[2027-08-15],
             ~D[2027-09-08],
             ~D[2027-11-01],
             ~D[2027-12-08],
             ~D[2027-12-25],
             ~D[2027-12-26]
           ]
  end

  describe "holidays tied to Pope Francis" do
    test "the anniversary of his election applies from 2013 to 2025" do
      refute ~D[2012-03-13] in Offlixir.dates!(:VA, 2012)
      assert ~D[2013-03-13] in Offlixir.dates!(:VA, 2013)
      assert ~D[2025-03-13] in Offlixir.dates!(:VA, 2025)
      refute ~D[2026-03-13] in Offlixir.dates!(:VA, 2026)
    end

    test "his name day applies from 2013 to 2024" do
      refute ~D[2012-04-23] in Offlixir.dates!(:VA, 2012)
      assert ~D[2013-04-23] in Offlixir.dates!(:VA, 2013)
      assert ~D[2024-04-23] in Offlixir.dates!(:VA, 2024)
      refute ~D[2025-04-23] in Offlixir.dates!(:VA, 2025)
    end
  end

  test "English names in 2026" do
    assert Enum.map(Offlixir.holidays!(:VA, 2026), &{&1.date, &1.english_name}) == [
             {~D[2026-01-01], "Solemnity of Mary, Mother of God"},
             {~D[2026-01-06], "Epiphany"},
             {~D[2026-02-11], "Anniversary of the foundation of Vatican City"},
             {~D[2026-03-19], "Saint Joseph's Day"},
             {~D[2026-04-06], "Easter Monday"},
             {~D[2026-05-01], "Saint Joseph the Worker"},
             {~D[2026-06-29], "Saint Peter and Saint Paul"},
             {~D[2026-08-15], "Assumption Day"},
             {~D[2026-09-08], "Nativity of Mary"},
             {~D[2026-11-01], "All Saints Day"},
             {~D[2026-12-08], "Immaculate Conception"},
             {~D[2026-12-25], "Christmas Day"},
             {~D[2026-12-26], "St. Stephen's Day"}
           ]
  end
end
