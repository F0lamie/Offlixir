# Offlixir

Public holidays of European countries, computed offline, with no dependency.

Versions: Elixir 1.15.8, Erlang/OTP 25.

## Usage

```elixir
iex> Offlixir.dates!(:FR, 2026)
[~D[2026-01-01], ~D[2026-04-06], ~D[2026-05-01], ~D[2026-05-08], ~D[2026-05-14],
 ~D[2026-05-25], ~D[2026-07-14], ~D[2026-08-15], ~D[2026-11-01], ~D[2026-11-11],
 ~D[2026-12-25]]

iex> Offlixir.dates("FR", 2026)
{:ok, [~D[2026-01-01], ~D[2026-04-06], ...]}

iex> Offlixir.holidays!(:FR, 2026) |> hd()
%Offlixir.Holiday{
  country: :FR,
  id: "FR-NEWYEARSDAY-01",
  date: ~D[2026-01-01],
  observed_date: ~D[2026-01-01],
  local_name: "Jour de l'an",
  english_name: "New Year's Day"
}

iex> Offlixir.dates_between!(:FR, ~D[2025-12-01], ~D[2026-01-31])
[~D[2025-12-25], ~D[2026-01-01]]

iex> Offlixir.holiday?(~D[2026-07-14], :FR)
true

iex> Offlixir.weekend?(~D[2026-07-11], :FR)
true

iex> Offlixir.countries()
[:AD, :AL, :AT, :AX, :BA, ...]
```

The plain list can be used directly with `in`:

```elixir
holidays = Offlixir.dates!(:FR, 2026)
working_day? = fn date -> Date.day_of_week(date) in 1..5 and date not in holidays end
```

| Function | Returns |
|---|---|
| `dates!/2`, `dates/2` | the holiday dates of a country for a year |
| `holidays!/2`, `holidays/2` | the `%Offlixir.Holiday{}` of a country for a year |
| `dates_between!/3`, `holidays_between!/3` | the holidays of a country between two dates, both included |
| `holiday?/2` | whether the date is a holiday in the country |
| `weekend?/2` | whether the date falls on the week-end of the country |
| `countries/0` | the supported countries |

## Values

- **Returned dates**: always `Date` structs of the `Calendar.ISO` calendar.
  `%Date{year: 2026, month: 1, day: 1}` and `~D[2026-01-01]` are the same value.
- **Lists**: sorted by ascending date. The plain list has no duplicate. The
  detailed list keeps two entries when two holidays fall on the same day (for
  example the 25th of March in Greece).
- **Country**: an ISO 3166-1 alpha-2 code in upper case, as an atom (`:FR`) or as
  a string (`"FR"`). Lower case is rejected.
- **Year**: an integer from 1 to 9999.
- **Dates given as input**: `Date`, `NaiveDateTime` or `DateTime`. Only the date
  part is read. For a `DateTime` it is the date in its own time zone.
- **Errors**: the functions ending in `!` or `?` raise `ArgumentError`. `dates/2`
  and `holidays/2` return `{:error, {:unknown_country, value}}` or
  `{:error, {:invalid_year, value}}`.

## Observed date

Some countries move a holiday that falls on a week-end. `%Offlixir.Holiday{}`
carries the calendar date (`date`) and the day actually taken off
(`observed_date`). The functions that return or test plain dates (`dates!/2`,
`dates_between!/3`, `holiday?/2`) use the observed date.

## Supported countries

50 countries and territories:

| Group | Codes |
|---|---|
| European Union | AT, BE, BG, CY, CZ, DE, DK, EE, ES, FI, FR, GR, HR, HU, IE, IT, LT, LU, LV, MT, NL, PL, PT, RO, SE, SI, SK |
| EFTA | CH, IS, LI, NO |
| United Kingdom | GB |
| Microstates | AD, MC, SM, VA |
| Balkans | AL, BA, ME, MK, RS |
| East | MD, UA |
| Territories | AX, FO, GG, GI, IM, JE, SJ |

## Limits

- No network call, no dependency.

## Checks

```sh
mix format --check-formatted
mix compile --warnings-as-errors
mix test
```

## License

MIT, see [LICENSE](LICENSE).