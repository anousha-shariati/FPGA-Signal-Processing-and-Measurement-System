# FPGA Signal Processing and Measurement System

## Overview
This project involves designing and implementing several modules for a signal processing system using FPGA. Key functionalities include generating and measuring timing signals, pulse width measurement, and implementing radar signal processing for distance measurement.

## Table of Contents
- [Project Overview](#overview)
- [Modules and Specifications](#modules-and-specifications)
  - [Timing Signal Generation](#timing-signal-generation)
  - [Square Wave Signal Generation](#square-wave-signal-generation)
  - [Frequency and Pulse Width Measurement](#frequency-and-pulse-width-measurement)
  - [Pulse Detection](#pulse-detection)
  - [Radar System Simulation](#radar-system-simulation)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
- [Usage](#usage)
- [License](#license)

## Modules and Specifications

### Timing Signal Generation
- **Objective**: Generate timing signals with specific frequencies.
- **Frequency Options**: 1 Hz, 1 kHz, 1 MHz, 23 MHz.
- **Requirements**: Design a VHDL module to produce each frequency with minimal deviation from the target values, considering a tolerance of 43.48 ns.

### Square Wave Signal Generation
- **Objective**: Generate a square wave with a variable duty cycle.
- **Output**: A signal at 100 kHz with duty cycle adjustments starting from 10% to 90%, changing every 100 µs.
- **Implementation**: Write a VHDL module with duty cycle variation from 10% to 90%, then decrement back to 10% at intervals of 10 kHz.

### Frequency and Pulse Width Measurement
- **Objective**: Measure input pulse frequency and width.
- **Frequency Measurement**:
  - Measure the frequency of a 1-32 bit unsigned input signal.
  - Valid output when data is reliable.
- **Pulse Width Measurement**:
  - Measure pulse width using a 16-bit unsigned input signal.
  - Output includes the measurement accuracy based on frequency.

### Pulse Detection
- **Objective**: Detect input pulses with a width between 50 µs and 70 µs.
- **Output**: A "valid" signal indicating when the pulse width is within range.

### Radar System Simulation
- **Objective**: Implement a radar system that calculates the distance to an object using pulse timing.
- **Specifications**:
  - Generate a continuous pulse signal at 500 MHz with a 5% duty cycle.
  - Calculate the time between signal transmission and reception to determine distance.
- **Formula**: Distance = \(\frac{c \times t}{2}\), where \(c = 300,000,000 \text{ m/s}\).

## Getting Started

### Prerequisites
- **FPGA Development Tools**: (e.g., Xilinx Vivado for VHDL design and synthesis)
- **VHDL Knowledge**: Basic understanding of VHDL coding and digital logic design.

### Installation
1. Clone this repository to your local machine:
   ```bash
   git clone https://github.com/anousha-shariati/FPGA-Signal-Processing-and-Measurement-System.git
   cd FPGA-Signal-Processing-and-Measurement-System
