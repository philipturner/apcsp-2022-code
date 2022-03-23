
//
//  main.swift
//  Experimentation5
//
//  Created by Philip Turner on 3/9/22.
//

import Foundation

// Parameters

let old_clean_2020: Double = 0.27 // nuclear, hydro
let new_clean_2020: Double = 0.08 // solar, wind, geothermal
let dirty_2020 = 1.00 - old_clean_2020 - new_clean_2020

let old_clean_2050: Double = 0.30
let new_clean_2050: Double = 0.50
let dirty_2050 = 1.00 - old_clean_2050 - new_clean_2050

let emissions_2020: Double = 35
let ppm_2020: Double = 412.5
let celsius_2020: Double = 0.98

let ppm_per_gigaton: Double = 0.28
let celsius_per_ppm: Double = 0.008

// Simulation

func roundNumber(_ x: Double, dp decimalPlaces: Int = 0) -> String {
  String(format: "%.\(decimalPlaces)f", x)
}

print("Goal: limit temperature rise to 1.5 C")
print("Fossil fuel % (2020): \(roundNumber(dirty_2020 * 100, dp: 0))")
print("Fossil fuel % (2050): \(roundNumber(dirty_2050 * 100, dp: 0))")

let percent_2050: Double = max(0.01, min(dirty_2050 / dirty_2020, 0.99))
let year_end: Double = 2100

let delta_time: Double = year_end - 2020
let yearly_rate = exp(log(percent_2050) / 30)
let log_rate = log(yearly_rate)

func integral_body_1(x: Double) -> Double {
  (1 / log_rate) * exp(x * log_rate)
}

// formula acquired from Wolfram Alpha
func integral_body_2(x: Double) -> Double {
  // pow(rate, x)
  let numerator_pt_1 = exp(x * log_rate)

  // for energy increasing 50% by 2050
  // energy = 1 + 0.5 * (x / 30)
  // energy = 1 + x / 60
  // energy = 1 + x / coeff
  let coeff: Double = 60

  let numerator_pt_2 = (x + coeff) * log_rate - 1
  let denominator = coeff * (log_rate * log_rate)

  return (numerator_pt_1 * numerator_pt_2) / denominator
}

let integral_1 = integral_body_1(x: delta_time) - integral_body_1(x: 0)
let integral_2 = integral_body_2(x: delta_time) - integral_body_2(x: 0)
let added_gigatons = emissions_2020 * integral_2
let added_ppm = added_gigatons * ppm_per_gigaton

let total_ppm = added_ppm + ppm_2020
let total_celsius = added_ppm * celsius_per_ppm + celsius_2020

print()
print("At 2020:")
print("Total PPM: \(roundNumber(ppm_2020))")
print("Temperature rise (C): \(roundNumber(celsius_2020, dp: 1))")
print("Temperature rise (F): \(roundNumber(celsius_2020 * 1.8, dp: 1))")

print()
print("Added Gigatons CO2: \(roundNumber(added_gigatons))")

print()
print("By 2100:")
print("Total PPM: \(roundNumber(total_ppm))")
print("Temperature rise (C): \(roundNumber(total_celsius, dp: 1))")
print("Temperature rise (F): \(roundNumber(total_celsius * 1.8, dp: 1))")
