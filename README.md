# To see the list of ultracycling races go here:
## [https://trytuna.github.io/ultracylcing-races/](https://trytuna.github.io/ultracylcing-races/)
---
List of ultra-distance bikepacking races for endurance cyclists interested in self-supported and unsupported racing across Europe and beyond.

## Adding a new race
The site is generated from [this file](https://github.com/trytuna/ultracylcing-races/blob/master/_data/races.yml); add new races there in YAML format.

```yaml
- name: The name of the race
  link: The URL for the race website
  start: The day the race starts (in "yyyy-MM-dd" format)
  end: The day the race ends (in "yyyy-MM-dd" format, optional)
  start-location: Text briefly describing where the race starts (e.g., 🇩🇪 Berlin)
  finish-location: Text briefly describing where the race finishes (optional)
  distance: Distance in kilometers (e.g., 1000km)
  elevation: Total elevation gain in meters (e.g., 15000m, optional)
  support-mode: unsupported, semi-supported, or supported
  route: fixed or free
  time-limit: Time limit if applicable (e.g., 96h, optional)
```

⚠️ The indentation is really important on `.yml` files, keep the same number of spaces as the rest of entries or it won't parse the file correctly.

### Examples
The following example provides all of the necessary information. It describes a race occurring from May 29 to May 31, 2026. It is an unsupported race with a fixed route and includes elevation data.

```yaml
- name: Peaks & Plains
  link: https://peaksandplains.cc
  start: 2026-05-29
  end: 2026-05-31
  start-location: 🇩🇪 Magdeburg
  distance: 555km
  elevation: 7400m
  support-mode: unsupported
  route: fixed
```

This example provides some of the information, but omits the end date and elevation. Perhaps the race is single-day or the elevation data is not yet available. Optional fields may be left incomplete or omitted entirely.

```yaml
- name: North Cape 4000
  link: https://northcape4000.com
  start: "2026-07-25"
  start-location: 🇮🇹 Italy, Rovereto
  finish-location: 🇳🇴 Norway, North Cape
  distance: 4000km
  support-mode: unsupported
  route: fixed
```

If you get stuck, just open an issue!

## Contributing
### Adding a Race
1. Fork the project.
2. Clone it locally.
3. Add your race to `races.yml`. It will be automatically sorted to the right spot on the website
4. Open a PR 🎉

### Work on the code locally
1. Fork the project.
2. Clone it locally.
3. Run `bundle install` to install initial dependencies.
4. Run `bundle exec jekyll serve`. The local site will be available at [http://127.0.0.1:4000](http://127.0.0.1:4000).

## Deploying
Deploying is handled automatically when a commit is made to the `main` branch or your pull request is merged.
