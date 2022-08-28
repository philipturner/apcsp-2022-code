# Climate Change Forecasting

Creates a linear regression mapping amount of CO2 burned to temperature rise. This modifies the projection of global warming by 2100, based on what % of energy is renewable by 2050. It increases energy requirements by 50% between 2020-2050, reflecting the increase in energy consumption as more countries have a higher standard of living.

## Energy Categories

| Category | Description | % (2020) | Default % (2050) |
| -------- | ----------- | -------- | ---------------- |
| Dirty | Fossil fuels | 65% | 20% |
| Old Clean | Renewables that are already well-established (nuclear fission, hydro) | 27% | 30% |
| New Clean | Renewables that are new to the 21st century (nuclear fusion, solar, wind, geothermal) | 8% | 50% |

## Projections

> Goal: limit temperature rise to 1.5 C

With the default percents of each energy category:

```
Fossil fuel % (2020): 65
Fossil fuel % (2050): 20

At 2020:
Total PPM: 412
Temperature rise (C): 1.0
Temperature rise (F): 1.8

Added Gigatons CO2: 1163

By 2100:
Total PPM: 738
Temperature rise (C): 3.6
Temperature rise (F): 6.5
```
