import UIKit
"""
Your goal is to write a Swift playground that:
1. Creates a constant holding any temperature in Celsius
2. Converts it to Fahrenheit by multiplying by 9, dividing by 5, then adding 32
3. Prints the result for the user showign both the Celsius and Fahrenheit values.
"""

let tempC = 32.0
let tempF = (tempC * 9) / 5 + 32.0

print("Celsius: \(tempC)°, Fahrenheit: \(tempF)°")
