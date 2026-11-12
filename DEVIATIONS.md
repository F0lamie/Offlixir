# Rules, corrections and known limits

The holiday rules come from reference rules, checked against reference data for
the years 1985, 1998, 2012, 2025, 2026 and 2027. This file lists where Offlixir
departs from them and what it does not cover.

## Scope

| Topic | Offlixir |
|---|---|
| Holiday types | public holidays only. Bank, school, authorities, optional and observance days are left out |
| Subdivisions | national holidays only. A holiday attached to regions, Länder or cantons is left out |
| Years | 1 to 9999, explicit error outside |
| Country codes | upper case atom or string, lower case rejected |
| Duplicate dates | kept in the detailed list, removed from the plain list |
| Week-end | Saturday and Sunday in every supported country |

## Corrected rules

A reference rule is corrected only when it is clearly wrong and a source supports
the correction. Everything else follows the reference rules, including rules that
apply the holidays of today to years when they did not exist yet.

| Country | Reference rule | Offlixir rule | Source |
|---|---|---|---|
| MD | Memorial Day on the last Monday of August | Memorial Day (Paștele Blajinilor) on the Monday one week after Orthodox Easter | Notice of the State Agency on Intellectual Property quoting the Labour Code: https://agepi.gov.md/ro/printpdf/14311 |
| NL | King's Day on the 27th of April for every year, held on Saturday when it is a Sunday | From 1949 to 2013: Queen's Day on the 30th of April, held on Monday when it is a Sunday until 1979 and on Saturday from 1980. From 2014 and before 1949: the reference rule | Not an official source: https://en.wikipedia.org/wiki/Koningsdag. The Saturday rule from 1980 is not sourced |
| VA | Anniversary of the election of Pope Francis (13th of March) and his name day (23rd of April) for every year | 13th of March from 2013 to 2025 only, 23rd of April from 2013 to 2024 only. The holidays of the other popes are not added | No official source. Pope Francis was elected on 2013-03-13 and died in April 2025 |

Rules that look wrong but are kept:

| Country | Rule | Why it is kept |
|---|---|---|
| ES | No national Christmas Day in 2022 | The official list of holidays for 2022 does not carry the 25th of December, a Sunday, only the following Monday for some communities: https://www.boe.es/boe/dias/2021/10/21/pdfs/BOE-A-2021-17113.pdf |
| SK | The 8th of May and the 15th of September are not days off in 2026 only | Matches the Slovak measure for 2026: https://uniza.esn.sk/national-holidays |
| GB | New Year's Day is not national | It is attached to the four parts of the United Kingdom, and the scope keeps only holidays without subdivision |
| NL | Liberation Day is public only every five years from 1945 to 1985 | It is not a public holiday for everyone from 1990 |
| MD | City days (Bălți, Chișinău, Cahul) are national, there is no Orthodox Easter Monday | No source checked |
| all | The holidays of today are applied to every past year unless a rule has a year condition | Out of scope |

## Differences with the reference data

Last comparison: 2026-11-10, 50 countries, years 1985, 1998, 2012 (observed
dates) and 2025, 2026, 2027 (calendar dates). 300 comparisons, 279 identical, 21
different. Every difference is listed below.

| Country | Years | Offlixir | Reference data | Justification |
|---|---|---|---|---|
| GI | 2025, 2026, 2027 | Winter Midterm Bank Holiday on the third Monday of February, King's Birthday on the third Monday of June | Commonwealth Day on the second Monday of March, birthday on the second Monday of June | The reference data does not follow the reference rules of Gibraltar yet, changed on 2026-11-02. Offlixir follows the rules |
| GI | 1985, 1998, 2012 | Queen's Birthday on the third Monday of June, holidays on a week-end observed on Monday (1985-04-29, 1998-12-28, 2012-01-02, 2012-04-30) | Second Monday of June, no observed date | Same reason |
| NL | 1985, 1998, 2012 | 30th of April | 27th of April | Corrected rule, see above |
| MD | 1985, 2025, 2027 | Memorial Day on 1985-04-22, 2025-04-28, 2027-05-10 | 1985-08-26, 2025-08-25, 2027-08-30 | Corrected rule, see above |
| MD | 1998, 2012, 2026 | Memorial Day on 1998-04-27, 2012-04-23, 2026-04-20 | The last Monday of August falls on another holiday (27th or 31st of August), so no date is missing | Corrected rule, see above |
| VA | 1985, 1998, 2012, 2026, 2027 | No 13th of March, no 23rd of April | Both dates | Corrected rule, see above |
| VA | 2025 | No 23rd of April | 23rd of April | Corrected rule, see above |

The year 1967 has no reference data and is not part of the comparison.
