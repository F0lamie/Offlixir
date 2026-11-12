defmodule Offlixir.Countries.CHTest do
  use ExUnit.Case, async: true

  # Expected values: reference data retrieved on 2026-11-10 for 1985, 1998, 2012
  # (observed dates) and 2025, 2026, 2027 (calendar dates), keeping the holidays
  # that are public and national. 1967 and the years of the "year conditions"
  # tests have no reference data and are computed by hand from the rules.
  #
  # Only the holidays that apply to every canton are expected.

  test "1967" do
    assert Offlixir.dates!(:CH, 1967) == [
             ~D[1967-01-01],
             ~D[1967-05-04],
             ~D[1967-08-01],
             ~D[1967-12-25]
           ]
  end

  test "1985" do
    assert Offlixir.dates!(:CH, 1985) == [
             ~D[1985-01-01],
             ~D[1985-05-16],
             ~D[1985-08-01],
             ~D[1985-12-25]
           ]
  end

  test "1998" do
    assert Offlixir.dates!(:CH, 1998) == [
             ~D[1998-01-01],
             ~D[1998-05-21],
             ~D[1998-08-01],
             ~D[1998-12-25]
           ]
  end

  test "2012" do
    assert Offlixir.dates!(:CH, 2012) == [
             ~D[2012-01-01],
             ~D[2012-05-17],
             ~D[2012-08-01],
             ~D[2012-12-25]
           ]
  end

  test "2025" do
    assert Offlixir.dates!(:CH, 2025) == [
             ~D[2025-01-01],
             ~D[2025-05-29],
             ~D[2025-08-01],
             ~D[2025-12-25]
           ]
  end

  test "2026" do
    assert Offlixir.dates!(:CH, 2026) == [
             ~D[2026-01-01],
             ~D[2026-05-14],
             ~D[2026-08-01],
             ~D[2026-12-25]
           ]
  end

  test "2027" do
    assert Offlixir.dates!(:CH, 2027) == [
             ~D[2027-01-01],
             ~D[2027-05-06],
             ~D[2027-08-01],
             ~D[2027-12-25]
           ]
  end

  test "English names in 2026" do
    assert Enum.map(Offlixir.holidays!(:CH, 2026), &{&1.date, &1.english_name}) == [
             {~D[2026-01-01], "New Year's Day"},
             {~D[2026-05-14], "Ascension Day"},
             {~D[2026-08-01], "Swiss National Day"},
             {~D[2026-12-25], "Christmas Day"}
           ]
  end
end
