---
layout: default
plugins:
  - date_filters
title: Ultracycling Races
---

You can download a 📆 Calendar (.ics) for:
- [All ultracycling races here](all.ics)

{% assign upcoming = site.data.races | upcoming_races: 12 %}
{% if upcoming and upcoming.size > 0 %}
## Upcoming ultracycling races

{{ upcoming | size }} upcoming ultracycling race(s)
{% include race-table.html races=upcoming %}
{% endif %}

{% assign past = site.data.races | past_races %}
{% if past and past.size > 0 %}

## Past ultracycling races

{{ past | size }} past ultracycling race(s)
{% include race-table.html races=past %}
{% endif %}

### More

**Add a race to this list:**
- Submit via [**Google Form**](https://forms.gle/qKVg8K1NJsXCoYKM7)
- Open a [**Pull Request**](https://github.com/trytuna/ultracylcing-races/edit/main/_data/races.yml) on GitHub
