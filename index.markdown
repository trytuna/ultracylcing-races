---
title: Ultracycling Races
---

You can download a 📆 Calendar (.ics) for:
- [All ultracycling races here](api/all.ics)

<div id="upcoming"></div>

## Past ultracycling races

<div id="past"></div>

### More

If you want to add a ultracycling race to this list or edit the info, please open a **PR (Pull Request)**. Thank you!

<table class="race-table">
  <thead>
    <tr>
      <th>Name</th>
      <th>Location</th>
      <th>Date</th>
      <th>Status</th>
    </tr>
  </thead>
  <tbody>
    {% for race in site.data.races %}
    <tr{% if race.cancelled %} class="cancelled"{% endif %}>
      <td class="race-name">
        {% if race.link %}
          <a href="{{ race.link }}" target="_blank" rel="noopener">{{ race.name }}</a>
        {% else %}
          {{ race.name }}
        {% endif %}
      </td>
      <td class="start-location">{{ race.start-location | default: "TBA" }}</td>
      <td class="date">
        {% if race.start %}
          {{ race.start | date: "%d.%m.%Y" }}
          {% if race.end and race.end != race.start %}
            - {{ race.end | date: "%d.%m.%Y" }}
          {% endif %}
        {% else %}
          TBA
        {% endif %}
      </td>
      <td class="status">
        {% if race.cancelled %}
          <span class="badge badge-cancelled">Cancelled</span>
        {% else %}
          <span class="badge badge-active">Active</span>
        {% endif %}
      </td>
    </tr>
    {% endfor %}
  </tbody>
</table>
