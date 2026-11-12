defmodule OfflixirTest do
  use ExUnit.Case, async: true

  doctest Offlixir

  describe "countries/0" do
    test "returns the 50 supported codes as sorted upper case atoms" do
      assert Offlixir.countries() ==
               ~w(AD AL AT AX BA BE BG CH CY CZ DE DK EE ES FI FO FR GB GG GI GR HR HU IE IM IS IT
                  JE LI LT LU LV MC MD ME MK MT NL NO PL PT RO RS SE SI SJ SK SM UA VA)a
    end

    test "does not support the countries left out of the scope" do
      for country <- ~w(TR BY RU GE AM GL XK US)a do
        refute country in Offlixir.countries()
        assert Offlixir.dates(country, 2026) == {:error, {:unknown_country, country}}
      end
    end
  end

  describe "dates!/2" do
    test "returns Date structs of the ISO calendar" do
      for country <- Offlixir.countries(), date <- Offlixir.dates!(country, 2026) do
        assert %Date{calendar: Calendar.ISO} = date
      end
    end

    test "is sorted and has no duplicate" do
      for country <- Offlixir.countries(), year <- [1967, 1985, 1998, 2012, 2025, 2026, 2027] do
        dates = Offlixir.dates!(country, year)

        assert dates == Enum.sort(dates, Date)
        assert dates == Enum.uniq(dates)
      end
    end

    test "can be used with in to tell a working day" do
      holidays = Offlixir.dates!(:FR, 2026)
      working_day? = fn date -> Date.day_of_week(date) in 1..5 and date not in holidays end

      refute working_day?.(%Date{year: 2026, month: 1, day: 1})
      refute working_day?.(~D[2026-07-14])
      refute working_day?.(~D[2026-07-11])
      assert working_day?.(~D[2026-07-15])
    end

    test "accepts the country as an atom or as a string" do
      assert Offlixir.dates!("FR", 2026) == Offlixir.dates!(:FR, 2026)
    end

    test "keeps a date once when two holidays share it" do
      # Greece has both the Annunciation and Independence Day on the 25th of March.
      assert Enum.count(Offlixir.dates!(:GR, 2026), &(&1 == ~D[2026-03-25])) == 1
    end

    test "raises on an unknown country" do
      for country <- [:XX, "XX", :fr, "fr", "Fr", "FRA", "", nil, 33, :TR] do
        assert_raise ArgumentError, ~r/unknown country/, fn ->
          Offlixir.dates!(country, 2026)
        end
      end
    end

    test "raises on an invalid year" do
      for year <- [0, -1, 10_000, "2026", 2026.0, nil] do
        assert_raise ArgumentError, ~r/invalid year/, fn -> Offlixir.dates!(:FR, year) end
      end
    end

    test "never fails on a year from 1 to 9999, keeps observed dates in the year and ids unique" do
      for country <- Offlixir.countries(), year <- 1..9999 do
        holidays = Offlixir.holidays!(country, year)
        ids = Enum.map(holidays, & &1.id)

        assert [_ | _] = holidays
        assert ids == Enum.uniq(ids)
        assert Enum.all?(holidays, &(&1.observed_date.year == year))
      end
    end
  end

  describe "dates/2" do
    test "returns the same list as dates!/2 in an ok tuple" do
      assert Offlixir.dates(:DE, 2026) == {:ok, Offlixir.dates!(:DE, 2026)}
    end

    test "returns an error tuple instead of raising" do
      assert Offlixir.dates(:fr, 2026) == {:error, {:unknown_country, :fr}}
      assert Offlixir.dates("XX", 2026) == {:error, {:unknown_country, "XX"}}
      assert Offlixir.dates(:FR, 0) == {:error, {:invalid_year, 0}}
    end
  end

  describe "holidays!/2" do
    test "returns structs sorted by date with the country and a prefixed id" do
      holidays = Offlixir.holidays!(:DE, 2026)

      assert Enum.all?(holidays, &match?(%Offlixir.Holiday{country: :DE, id: "DE-" <> _}, &1))
      assert Enum.map(holidays, & &1.date) == Enum.sort(Enum.map(holidays, & &1.date), Date)
      assert Enum.all?(holidays, &(is_binary(&1.local_name) and is_binary(&1.english_name)))
    end

    test "keeps the two holidays that share a date" do
      on_march_25 = Enum.filter(Offlixir.holidays!(:GR, 2026), &(&1.date == ~D[2026-03-25]))

      assert Enum.map(on_march_25, & &1.id) == ["GR-ANNUNCIATION-01", "GR-INDEPENDENCEDAY-01"]
    end

    test "has unique ids within a year" do
      for country <- Offlixir.countries() do
        ids = Enum.map(Offlixir.holidays!(country, 2026), & &1.id)
        assert ids == Enum.uniq(ids)
      end
    end

    test "raises like dates!/2" do
      assert_raise ArgumentError, ~r/unknown country/, fn -> Offlixir.holidays!(:XX, 2026) end
      assert_raise ArgumentError, ~r/invalid year/, fn -> Offlixir.holidays!(:FR, 0) end
    end
  end

  describe "holidays_between!/3 and dates_between!/3" do
    test "include both ends of the range" do
      assert Offlixir.dates_between!(:FR, ~D[2026-05-01], ~D[2026-05-08]) ==
               [~D[2026-05-01], ~D[2026-05-08]]
    end

    test "span several years" do
      assert Offlixir.dates_between!(:FR, ~D[2025-12-25], ~D[2027-01-01]) ==
               [~D[2025-12-25]] ++ Offlixir.dates!(:FR, 2026) ++ [~D[2027-01-01]]
    end

    test "return an empty list when no holiday is in the range" do
      assert Offlixir.holidays_between!(:FR, ~D[2026-02-01], ~D[2026-02-28]) == []
    end

    test "accept NaiveDateTime and DateTime" do
      from = ~N[2026-07-01 00:00:00]
      to = DateTime.new!(~D[2026-07-31], ~T[23:59:59])

      assert Offlixir.dates_between!(:FR, from, to) == [~D[2026-07-14]]
    end

    test "raise when the end is before the start" do
      assert_raise ArgumentError, ~r/invalid range/, fn ->
        Offlixir.dates_between!(:FR, ~D[2026-02-01], ~D[2026-01-01])
      end
    end

    test "raise on an unknown country and on a value that is not a date" do
      assert_raise ArgumentError, ~r/unknown country/, fn ->
        Offlixir.holidays_between!(:XX, ~D[2026-01-01], ~D[2026-12-31])
      end

      assert_raise ArgumentError, ~r/expected a Date/, fn ->
        Offlixir.holidays_between!(:FR, "2026-01-01", ~D[2026-12-31])
      end
    end
  end

  describe "holiday?/2" do
    test "tells whether a date is a holiday" do
      assert Offlixir.holiday?(~D[2026-12-25], :DE)
      refute Offlixir.holiday?(~D[2026-12-24], :DE)
    end

    test "accepts NaiveDateTime and DateTime" do
      assert Offlixir.holiday?(~N[2026-12-25 23:59:59], "DE")
      assert Offlixir.holiday?(DateTime.new!(~D[2026-12-25], ~T[00:00:00]), :DE)
    end

    test "raises on an unknown country and on a value that is not a date" do
      assert_raise ArgumentError, ~r/unknown country/, fn ->
        Offlixir.holiday?(~D[2026-12-25], :de)
      end

      assert_raise ArgumentError, ~r/expected a Date/, fn ->
        Offlixir.holiday?({2026, 12, 25}, :DE)
      end
    end
  end

  describe "weekend?/2" do
    test "is true on Saturday and Sunday only" do
      # The 6th of July 2026 is a Monday.
      week = Date.range(~D[2026-07-06], ~D[2026-07-12])

      for country <- Offlixir.countries() do
        assert Enum.map(week, &Offlixir.weekend?(&1, country)) ==
                 [false, false, false, false, false, true, true]
      end
    end

    test "accepts NaiveDateTime and DateTime" do
      assert Offlixir.weekend?(~N[2026-07-11 12:00:00], "GR")
      refute Offlixir.weekend?(DateTime.new!(~D[2026-07-10], ~T[12:00:00]), :GR)
    end

    test "raises on an unknown country" do
      assert_raise ArgumentError, ~r/unknown country/, fn ->
        Offlixir.weekend?(~D[2026-07-11], :XX)
      end
    end
  end
end
