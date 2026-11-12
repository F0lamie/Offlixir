defmodule Offlixir.Countries.DETest do
  use ExUnit.Case, async: true

  # Expected values: reference data retrieved on 2026-11-10 for 1985, 1998, 2012
  # (observed dates) and 2025, 2026, 2027 (calendar dates), keeping the holidays
  # that are public and national. 1967 and the years of the "year conditions"
  # tests have no reference data and are computed by hand from the rules.
  #
  # Only the holidays that apply to every Land are expected.

  test "1967" do
    assert Offlixir.dates!(:DE, 1967) == [
             ~D[1967-01-01],
             ~D[1967-03-24],
             ~D[1967-03-27],
             ~D[1967-05-01],
             ~D[1967-05-04],
             ~D[1967-05-15],
             ~D[1967-12-25],
             ~D[1967-12-26]
           ]
  end

  test "1985" do
    assert Offlixir.dates!(:DE, 1985) == [
             ~D[1985-01-01],
             ~D[1985-04-05],
             ~D[1985-04-08],
             ~D[1985-05-01],
             ~D[1985-05-16],
             ~D[1985-05-27],
             ~D[1985-12-25],
             ~D[1985-12-26]
           ]
  end

  test "1998" do
    assert Offlixir.dates!(:DE, 1998) == [
             ~D[1998-01-01],
             ~D[1998-04-10],
             ~D[1998-04-13],
             ~D[1998-05-01],
             ~D[1998-05-21],
             ~D[1998-06-01],
             ~D[1998-10-03],
             ~D[1998-12-25],
             ~D[1998-12-26]
           ]
  end

  test "2012" do
    assert Offlixir.dates!(:DE, 2012) == [
             ~D[2012-01-01],
             ~D[2012-04-06],
             ~D[2012-04-09],
             ~D[2012-05-01],
             ~D[2012-05-17],
             ~D[2012-05-28],
             ~D[2012-10-03],
             ~D[2012-12-25],
             ~D[2012-12-26]
           ]
  end

  test "2025" do
    assert Offlixir.dates!(:DE, 2025) == [
             ~D[2025-01-01],
             ~D[2025-04-18],
             ~D[2025-04-21],
             ~D[2025-05-01],
             ~D[2025-05-29],
             ~D[2025-06-09],
             ~D[2025-10-03],
             ~D[2025-12-25],
             ~D[2025-12-26]
           ]
  end

  test "2026" do
    assert Offlixir.dates!(:DE, 2026) == [
             ~D[2026-01-01],
             ~D[2026-04-03],
             ~D[2026-04-06],
             ~D[2026-05-01],
             ~D[2026-05-14],
             ~D[2026-05-25],
             ~D[2026-10-03],
             ~D[2026-12-25],
             ~D[2026-12-26]
           ]
  end

  test "2027" do
    assert Offlixir.dates!(:DE, 2027) == [
             ~D[2027-01-01],
             ~D[2027-03-26],
             ~D[2027-03-29],
             ~D[2027-05-01],
             ~D[2027-05-06],
             ~D[2027-05-17],
             ~D[2027-10-03],
             ~D[2027-12-25],
             ~D[2027-12-26]
           ]
  end

  describe "year conditions" do
    test "German Unity Day starts in 1990" do
      refute ~D[1989-10-03] in Offlixir.dates!(:DE, 1989)
      assert ~D[1990-10-03] in Offlixir.dates!(:DE, 1990)
    end

    test "Repentance and Prayer Day applies to every Land from 1990 to 1994 only" do
      # The Wednesday before the 23rd of November.
      refute ~D[1989-11-22] in Offlixir.dates!(:DE, 1989)
      assert ~D[1990-11-21] in Offlixir.dates!(:DE, 1990)
      assert ~D[1994-11-16] in Offlixir.dates!(:DE, 1994)
      refute ~D[1995-11-22] in Offlixir.dates!(:DE, 1995)

      assert length(Offlixir.dates!(:DE, 1989)) == 8
      assert length(Offlixir.dates!(:DE, 1990)) == 10
      assert length(Offlixir.dates!(:DE, 1994)) == 10
      assert length(Offlixir.dates!(:DE, 1995)) == 9
    end

    test "Repentance and Prayer Day also applies to every Land from 1934 to 1938" do
      refute ~D[1933-11-22] in Offlixir.dates!(:DE, 1933)
      assert ~D[1934-11-21] in Offlixir.dates!(:DE, 1934)
      assert ~D[1938-11-16] in Offlixir.dates!(:DE, 1938)
      refute ~D[1939-11-22] in Offlixir.dates!(:DE, 1939)
    end

    test "Reformation Day applies to every Land in 2017 only" do
      refute ~D[2016-10-31] in Offlixir.dates!(:DE, 2016)
      assert ~D[2017-10-31] in Offlixir.dates!(:DE, 2017)
      refute ~D[2018-10-31] in Offlixir.dates!(:DE, 2018)
    end
  end

  test "names and ids in 2026" do
    assert Enum.map(Offlixir.holidays!(:DE, 2026), &{&1.date, &1.id, &1.local_name}) == [
             {~D[2026-01-01], "DE-NEWYEARSDAY-01", "Neujahr"},
             {~D[2026-04-03], "DE-CGOODFRIDAY-01", "Karfreitag"},
             {~D[2026-04-06], "DE-CEASTERMONDAY-01", "Ostermontag"},
             {~D[2026-05-01], "DE-LABOURDAY-01", "Tag der Arbeit"},
             {~D[2026-05-14], "DE-CASCENSIONDAY-01", "Christi Himmelfahrt"},
             {~D[2026-05-25], "DE-CWHITMONDAY-01", "Pfingstmontag"},
             {~D[2026-10-03], "DE-GERMANUNITYDAY-01", "Tag der Deutschen Einheit"},
             {~D[2026-12-25], "DE-CHRISTMASDAY-01", "Erster Weihnachtstag"},
             {~D[2026-12-26], "DE-STSTEPHENSDAY-01", "Zweiter Weihnachtstag"}
           ]
  end
end
