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

If you want to add a ultracycling race to this list or edit the info, please open a **PR (Pull Request)**. Thank you!
