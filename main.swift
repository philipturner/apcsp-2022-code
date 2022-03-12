//
//  main.swift
//  Experimentation5
//
//  Created by Philip Turner on 3/9/22.
//

import Foundation

let percent_2050: Double = 0.99
let year_end: Double = 2100

let emissions_2020: Double = 35
let ppm_2020: Double = 412.5
let celsius_2020: Double = 0.98

let ppm_per_gigaton: Double = 0.28
let celsius_per_ppm: Double = 0.008

let delta_time: Double = year_end - 2020
let yearly_rate = pow(M_E, log(percent_2050) / 30)
let log_rate = log(yearly_rate)

func integral_body_1(x: Double) -> Double {
  (1 / log_rate) * pow(M_E, x * log_rate)
}

// formula acquired from Wolfram Alpha
func integral_body_2(x: Double) -> Double {
  // pow(rate, x)
  let numerator_pt_1 = pow(M_E, x * log_rate)
  
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
let total_fahrenheit = 1.8 * total_celsius

print("Added Gigatons: \(added_gigatons)")
print("Total PPM: \(total_ppm)")
print("Temperature rise (C): \(total_celsius)")
print("temperature rise (F): \(total_fahrenheit)")
