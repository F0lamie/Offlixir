defmodule Offlixir.Countries.UATest do
  use ExUnit.Case, async: true

  # Expected values: reference data retrieved on 2026-11-10 for 1985, 1998, 2012
  # (observed dates) and 2025, 2026, 2027 (calendar dates), keeping the holidays
  # that are public and national. 1967 and the years of the "year conditions"
  # tests have no reference data and are computed by hand from the rules.

  test "1967" do
    assert Offlixir.dates!(:UA, 1967) == [
             ~D[1967-01-01],
             ~D[1967-01-07],
             ~D[1967-03-08],
             ~D[1967-04-30],
             ~D[1967-05-01],
             ~D[1967-05-09],
             ~D[1967-06-18],
             ~D[1967-06-28],
             ~D[1967-08-24]
           ]
  end

  test "1985" do
    assert Offlixir.dates!(:UA, 1985) == [
             ~D[1985-01-01],
             ~D[1985-01-07],
             ~D[1985-03-08],
             ~D[1985-04-14],
             ~D[1985-05-01],
             ~D[1985-05-09],
             ~D[1985-06-02],
             ~D[1985-06-28],
             ~D[1985-08-24]
           ]
  end

  test "1998" do
    assert Offlixir.dates!(:UA, 1998) == [
             ~D[1998-01-01],
             ~D[1998-01-07],
             ~D[1998-03-08],
             ~D[1998-04-19],
             ~D[1998-05-01],
             ~D[1998-05-09],
             ~D[1998-06-07],
             ~D[1998-06-28],
             ~D[1998-08-24]
           ]
  end

  test "2012" do
    assert Offlixir.dates!(:UA, 2012) == [
             ~D[2012-01-01],
             ~D[2012-01-07],
             ~D[2012-03-08],
             ~D[2012-04-15],
             ~D[2012-05-01],
             ~D[2012-05-09],
             ~D[2012-06-03],
             ~D[2012-06-28],
             ~D[2012-08-24]
           ]
  end

  test "2025" do
    assert Offlixir.dates!(:UA, 2025) == [
             ~D[2025-01-01],
             ~D[2025-03-08],
             ~D[2025-04-20],
             ~D[2025-05-01],
             ~D[2025-05-08],
             ~D[2025-06-08],
             ~D[2025-06-28],
             ~D[2025-07-15],
             ~D[2025-08-24],
             ~D[2025-10-01],
             ~D[2025-12-25]
           ]
  end

  test "2026" do
    assert Offlixir.dates!(:UA, 2026) == [
             ~D[2026-01-01],
             ~D[2026-03-08],
             ~D[2026-04-12],
             ~D[2026-05-01],
             ~D[2026-05-08],
             ~D[2026-05-31],
             ~D[2026-06-28],
             ~D[2026-07-15],
             ~D[2026-08-24],
             ~D[2026-10-01],
             ~D[2026-12-25]
           ]
  end

  test "2027" do
    assert Offlixir.dates!(:UA, 2027) == [
             ~D[2027-01-01],
             ~D[2027-03-08],
             ~D[2027-05-01],
             ~D[2027-05-02],
             ~D[2027-05-08],
             ~D[2027-06-20],
             ~D[2027-06-28],
             ~D[2027-07-15],
             ~D[2027-08-24],
             ~D[2027-10-01],
             ~D[2027-12-25]
           ]
  end

  describe "year conditions" do
    test "Christmas on the 7th of January stops in 2024" do
      assert ~D[2023-01-07] in Offlixir.dates!(:UA, 2023)
      refute ~D[2024-01-07] in Offlixir.dates!(:UA, 2024)
    end

    test "Christmas on the 25th of December starts in 2017" do
      refute ~D[2016-12-25] in Offlixir.dates!(:UA, 2016)
      assert ~D[2017-12-25] in Offlixir.dates!(:UA, 2017)
    end

    test "Defender of Ukraine Day starts in 2015 and moves to the 1st of October in 2023" do
      refute ~D[2014-10-14] in Offlixir.dates!(:UA, 2014)
      assert ~D[2015-10-14] in Offlixir.dates!(:UA, 2015)
      assert ~D[2022-10-14] in Offlixir.dates!(:UA, 2022)
      refute ~D[2023-10-14] in Offlixir.dates!(:UA, 2023)
      assert ~D[2023-10-01] in Offlixir.dates!(:UA, 2023)
    end

    test "Statehood Day starts in 2022 and moves to the 15th of July in 2024" do
      refute ~D[2021-07-28] in Offlixir.dates!(:UA, 2021)
      assert ~D[2022-07-28] in Offlixir.dates!(:UA, 2022)
      assert ~D[2023-07-28] in Offlixir.dates!(:UA, 2023)
      refute ~D[2024-07-28] in Offlixir.dates!(:UA, 2024)
      assert ~D[2024-07-15] in Offlixir.dates!(:UA, 2024)
    end

    test "Victory Day moves to the 8th of May in 2024" do
      assert ~D[2023-05-09] in Offlixir.dates!(:UA, 2023)
      refute ~D[2024-05-09] in Offlixir.dates!(:UA, 2024)
      assert ~D[2024-05-08] in Offlixir.dates!(:UA, 2024)
    end
  end

  test "English names in 2026" do
    assert Enum.map(Offlixir.holidays!(:UA, 2026), &{&1.date, &1.english_name}) == [
             {~D[2026-01-01], "New Year's Day"},
             {~D[2026-03-08], "International Women's Day"},
             {~D[2026-04-12], "Easter Sunday"},
             {~D[2026-05-01], "International Workers' Day"},
             {~D[2026-05-08], "Victory day over Nazism in World War II"},
             {~D[2026-05-31], "Pentecost"},
             {~D[2026-06-28], "Constitution Day"},
             {~D[2026-07-15], "Statehood Day"},
             {~D[2026-08-24], "Independence Day"},
             {~D[2026-10-01], "Defender of Ukraine Day"},
             {~D[2026-12-25], "Christmas Day"}
           ]
  end
end
