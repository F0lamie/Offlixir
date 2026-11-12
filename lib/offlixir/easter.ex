defmodule Offlixir.Easter do
  @moduledoc """
  Easter Sunday in the Gregorian (Catholic and Protestant) and Orthodox traditions.
  """

  @doc """
  Returns Easter Sunday of `year` in the Gregorian computus.

      iex> Offlixir.Easter.gregorian(2026)
      ~D[2026-04-05]
  """
  @spec gregorian(integer) :: Date.t()
  def gregorian(year) when is_integer(year) do
    g = rem(year, 19)
    c = div(year, 100)
    h = rem(c - div(c, 4) - div(8 * c + 13, 25) + 19 * g + 15, 30)
    i = h - div(h, 28) * (1 - div(h, 28) * div(29, h + 1) * div(21 - g, 11))
    day = i - rem(year + div(year, 4) + i + 2 - c + div(c, 4), 7) + 28

    if day > 31 do
      Date.new!(year, 4, day - 31)
    else
      Date.new!(year, 3, day)
    end
  end

  @doc """
  Returns Orthodox Easter Sunday of `year` as a Gregorian calendar date.

  The date is computed in the Julian calendar, then shifted by the gap between the
  two calendars (see `gregorian_shift/1`).

      iex> Offlixir.Easter.orthodox(2026)
      ~D[2026-04-12]
  """
  @spec orthodox(integer) :: Date.t()
  def orthodox(year) when is_integer(year) do
    a = rem(year, 19)
    b = rem(year, 7)
    c = rem(year, 4)
    d = rem(19 * a + 15, 30)
    e = rem(2 * c + 4 * b - d + 34, 7)
    month = div(d + e + 114, 31)
    day = rem(d + e + 114, 31) + 1

    year |> Date.new!(month, day) |> Date.add(gregorian_shift(year))
  end

  @doc """
  Returns the number of days added to a Julian calendar date of `year` to get the
  Gregorian calendar date.

  The gap is valid for a date from the 1st of March of `year` to the end of
  February of the next year, which always holds for Easter. Before 1583 the
  Gregorian date is proleptic. The gap is negative before the year 200.

      iex> Offlixir.Easter.gregorian_shift(2026)
      13
  """
  @spec gregorian_shift(integer) :: integer
  def gregorian_shift(year) when is_integer(year) do
    div(year, 100) - div(year, 400) - 2
  end
end
