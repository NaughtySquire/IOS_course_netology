// Task - 1
func showCalculation(_ satelliteWeight: Double,_ flightLength: Double,_ calculation: (Double, Double) -> Double){
    print(calculation(satelliteWeight, flightLength))
}

var firstScientistCalculation: (Double, Double) -> Double = {
    (satelliteWeight: Double, flightLength: Double) -> Double in
    return flightLength * satelliteWeight
}

var secondScientistCalculation: (Double, Double) -> Double = {
    (satelliteWeight: Double, flightLength: Double) -> Double in
    return flightLength * satelliteWeight * 2
}

showCalculation(10, 10, firstScientistCalculation)

showCalculation(10, 10, secondScientistCalculation)

// Task - 2
var firstScientistCalculationShort: (Double, Double) -> Double = {$0 * $1}

var secondScientistCalculationShort: (Double, Double) -> Double = {$0 * $1 * 2}

showCalculation(10, 10, firstScientistCalculationShort)
showCalculation(10, 10, secondScientistCalculationShort)

// Task - 3
showCalculation(10, 10) {
    ($0 + $1) * 2
}
/*
 Т.к. param это - trailing closure - его вынесли за вызывающие круглые скобки функции example и там определили в сокращенном виде.
 func example(param: () -> Void) {
     // ...
 }

 example {
     // ...
 }

 */
