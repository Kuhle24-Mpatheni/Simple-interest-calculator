#!/bin/bash

# Simple Interest Calculator
# Calculates simple interest based on user input

echo "======================================="
echo "      SIMPLE INTEREST CALCULATOR       "
echo "======================================="

# Function to validate numeric input
validate_number() {
    local input=$1
    # Check if input is a positive number (integer or decimal)
    if [[ $input =~ ^[0-9]+(\.[0-9]+)?$ ]] && [[ $(echo "$input > 0" | bc -l) -eq 1 ]]; then
        return 0  # Valid
    else
        return 1  # Invalid
    fi
}

# Get principal amount
while true; do
    read -p "Enter Principal amount (in dollars): " principal
    if validate_number "$principal"; then
        break
    else
        echo "Error: Please enter a valid positive number."
    fi
done

# Get rate of interest
while true; do
    read -p "Enter Rate of Interest (in percentage): " rate
    if validate_number "$rate"; then
        break
    else
        echo "Error: Please enter a valid positive number."
    fi
done

# Get time period
while true; do
    read -p "Enter Time Period (in years): " time
    if validate_number "$time"; then
        break
    else
        echo "Error: Please enter a valid positive number."
    fi
done

# Calculate simple interest
# Formula: I = (P * R * T) / 100
interest=$(echo "scale=2; $principal * $rate * $time / 100" | bc -l)

# Calculate total amount
total=$(echo "scale=2; $principal + $interest" | bc -l)

# Display results
echo ""
echo "======================================="
echo "              CALCULATION RESULTS      "
echo "======================================="
echo "Principal Amount:      \$$principal"
echo "Rate of Interest:      $rate%"
echo "Time Period:           $time years"
echo "---------------------------------------"
echo "Simple Interest:       \$$interest"
echo "Total Amount:          \$$total"
echo "======================================="
echo ""

# Optional: Show formula used
echo "Formula Used: I = (P × R × T) / 100"
echo "Where: I = Interest, P = Principal, R = Rate, T = Time"
