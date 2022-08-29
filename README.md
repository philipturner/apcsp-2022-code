# Climate Change Forecasting

Uses a linear regression mapping amount of CO2 burned to temperature rise. This modifies the projection of global warming by 2100 based on what % of energy is renewable by 2050. Energy demand increases 50% between 2020 and 2050, reflecting the higher standard of living in Africa and India.

The linear regression is possible because CO2 concentration (atmospheric parts per million/PPM) has an extremely strong correlation with the cumulative number of gigatons emitted. To forecast the future cumulative emissions, it takes the integral of an exponential decay function, where fossil fuel usage decays toward 0%. The temperature formula is optimized to forecast best-case scenarios, where temperature rise is close to 1.5 C. It does not account for the effects of geoengineering and large-scale carbon sequestration.

```swift
// Simulation parameters:
let emissions_2020: Double = 35
let ppm_2020: Double = 412.5
let celsius_2020: Double = 0.98

let ppm_per_gigaton: Double = 0.28
let celsius_per_ppm: Double = 0.008
```

## Energy Categories

| Category | Description | % (2020) | Default % (2050) |
| -------- | ----------- | -------- | ---------------- |
| Dirty | Fossil fuels | 65% | 20% |
| Old Clean | Renewables that are already well-established (nuclear fission, hydro) | 27% | 30% |
| New Clean | Renewables that are new to the 21st century (nuclear fusion, solar, wind, geothermal) | 8% | 50% |

## Projections

> Goal: Limit temperature rise to 1.5 C

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

With 5% dirty, 35% old clean, 60% new clean:

```
Fossil fuel % (2020): 65
Fossil fuel % (2050): 5

At 2020:
Total PPM: 412
Temperature rise (C): 1.0
Temperature rise (F): 1.8

Added Gigatons CO2: 488

By 2100:
Total PPM: 549
Temperature rise (C): 2.1
Temperature rise (F): 3.7
```

With 0.5% dirty, 37% old clean, 62.5% new clean:

```
Fossil fuel % (2020): 65
Fossil fuel % (2050): 1

At 2020:
Total PPM: 412
Temperature rise (C): 1.0
Temperature rise (F): 1.8

Added Gigatons CO2: 253

By 2100:
Total PPM: 483
Temperature rise (C): 1.5
Temperature rise (F): 2.8
```

## Usage

Download and run the Swift script:

```
swift main.swift
```

Or copy and paste its contents into [Google Colab](https://github.com/philipturner/swift-colab):

<img width="805" alt="Screen Shot 2022-08-28 at 7 53 13 PM" src="https://user-images.githubusercontent.com/71743241/187099966-086198cc-4610-4e22-b5db-ef9052929878.png">
