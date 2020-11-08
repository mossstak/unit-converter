//
//  ConverterCalc.swift
//  CW1
//
//  Created by Mostak Khan on 16/03/2019.
//  Copyright © 2019 Mostak Khan. All rights reserved.
//

//This class shows the calculations for the conversions, here is I added a function which places the decimal to decimal places. I have attempted to do the stones-pounds but I found difficult to seperate the two so here i just the converted it into Stones Instead.



import Foundation
import UIKit

class Converter : NSObject
{
    
    var operandStack = Array<String>()
    
    func updateStackWithValue (value: String)
    {
        self.operandStack.append(value)
    }
    
    //Weight Calculations
    
    //OunceTo?Conversions
    func OunceToStone(value: Double) ->Double
    {
        return(value / 224).round(to: 4)
    }
    func OunceToPound(value: Double) ->Double
    {
        return(value / 16).round(to: 4)
    }
    func OunceToGram(value: Double) ->Double
    {
        return(value * 28.35 ).round(to: 4)
    }
    func OunceToKg(value: Double) ->Double
    {
        return(value / 35.274).round(to: 4)
    }
    
    //PoundTo?Conversions
    func PoundToKg(value: Double) -> Double
    {
        return(value / 2.205).round(to: 4)
    }
    func PoundToOunce(value: Double) -> Double
    {
        return(value * 16).round(to: 4)
    }
    func PoundToGram(value: Double) -> Double
    {
        return(value * 453.592).round(to: 4)
    }
    func PoundToStone(value: Double) -> Double
    {
        return(value / 14).round(to: 4)
    }
    
    //GramTo?Conversions
    func GramToKg(value: Double) -> Double
    {
        return(value / 1000).round(to: 4)
    }
    func GramToStone(value: Double) -> Double
    {
        return(value / 6350.293).round(to: 4)
    }
    func GramToOunce(value: Double) -> Double
    {
        return(value / 28.35).round(to: 4)
    }
    func GramToPound(value: Double) -> Double
    {
        return(value / 453.592).round(to: 4)
    }
    
    //KilogramsTo?Conversions
    func KgToStone(value: Double) -> Double
    {
        return(value / 6.35).round(to: 4)
    }
    func KgToOunce(value: Double) -> Double
    {
        return(value * 35.274).round(to: 4)
    }
    func KgToPound(value: Double) -> Double
    {
        return(value * 2.205).round(to: 4)
    }
    func KgToGram(value: Double) -> Double
    {
        return(value * 1000).round(to: 4)
    }
    
    //StoneTo?Conversions
    func StoneToKg(value: Double) -> Double
    {
        return(value * 6.35).round(to: 4)
    }
    func StoneToOunce(value: Double) -> Double
    {
        return(value * 224).round(to: 4)
    }
    func StoneToPound(value: Double) -> Double
    {
        return(value * 14).round(to: 4)
    }
    func StoneToGram(value: Double) -> Double
    {
        return(value * 6350.293).round(to: 4)
    }
    
    //Temperature Calculations
    
    //CelsiusTo?Conversions
    func CelsiusToFahrenheit(value: Double) -> Double
    {
        return(value * 9/5) + 32.round(to: 4)
    }
    func CelsiusToKelvin(value: Double) -> Double
    {
        return(value + 273.15).round(to: 4)
    }
    
    //FahrenheitTo?Conversions
    func FahrenheitToCelsius(value: Double) -> Double
    {
        return(value - 32) * 5/9.round(to: 4)
    }
    func FahrenheitToKelvin(value: Double) -> Double
    {
        return(value - 32) * 5/9 + 273.15.round(to: 4)
    }
    
    //KelvinTo?Conversion
    func KelvinToFahrenheit(value: Double) -> Double
    {
        return(value - 273.15) * 9/5 + 32.round(to: 4)
    }
    func KelvinToCelsius(value: Double) -> Double
    {
        return(value - 273.15).round(to: 4)
    }
    
    //Speed Calculations
    
    //Metres/SecTo?Conversions
    func MSToKH(value: Double) -> Double
    {
        return(value * 3.6).round(to: 4)    }
    func MSToMH(value: Double) -> Double
    {
        return(value * 2.237).round(to: 4)
    }
    func MSToNM(value: Double) -> Double
    {
        return(value * 1.944).round(to: 4)
    }
    
    //KiloMetres/HourTo?Conversions
    func KHToMS(value: Double) -> Double
    {
        return(value / 3.6).round(to: 4)
    }
    func KHToMH(value: Double) -> Double
    {
        return(value / 1.609).round(to: 4)
    }
    func KHToNM(value: Double) -> Double
    {
        return(value / 1.852).round(to: 4)
    }
    
    //Miles/HourTo?Conversions
    func MHToMS(value: Double)-> Double
    {
        return(value / 2.237).round(to: 4)
    }
    func MHToKH(value: Double)-> Double
    {
        return(value * 1.609).round(to: 4)
    }
    func MHToNM(value: Double)-> Double
    {
        return(value / 1.151).round(to: 4)
    }
    
    //Nautical Miles/HourTo?Conversions
    func NMToMS(value: Double)-> Double
    {
        return(value / 1.944).round(to: 4)
    }
    func NMToKH(value: Double)-> Double
    {
        return(value * 1.852).round(to: 4)
    }
    func NMToMH(value: Double)-> Double
    {
        return(value * 1.151).round(to: 4)
    }
    
    //Volume Liquid Calculations
    //GallonTo?Conversions
    func GallonToLitre(value: Double) -> Double
    {
        return(value * 4.546).round(to: 4)
    }
    func GallonToUKPint(value: Double) -> Double
    {
        return(value * 8).round(to: 4)
    }
    func GallonToFO(value: Double) -> Double
    {
        return(value * 160).round(to: 4)
    }
    func GallonToML(value: Double) -> Double
    {
        return(value * 4546.09).round(to: 4)
    }
    
    //LitreTo?Conversions
    func LitreToGallon(value: Double) -> Double
    {
        return(value / 4.546).round(to: 4)
    }
    func LitreToUKPint(value: Double) -> Double
    {
        return(value * 1.76).round(to: 4)
    }
    func LitreToFO(value: Double) -> Double
    {
        return(value * 35.195).round(to: 4)
    }
    func LitreToML(value: Double) -> Double
    {
        return(value * 1000).round(to: 4)
    }
    
    //UKPintTo?Conversions
    func UKPintToGallon(value: Double) -> Double
    {
        return(value / 8).round(to: 4)
    }
    func UKPintToLitre(value: Double) -> Double
    {
        return(value / 1.76).round(to: 4)
    }
    func UKPintToFO(value: Double) -> Double
    {
        return(value * 20).round(to: 4)
    }
    func UKPintToML(value: Double) -> Double
    {
        return(value * 568.261).round(to: 4)
    }
    
    //Fluid-OunceTo?Conversions
    func FOToGallon(value: Double) -> Double
    {
        return(value / 160).round(to: 4)
    }
    func FOToLitre(value: Double) -> Double
    {
        return(value / 35.195).round(to: 4)
    }
    func FOToUKPint(value: Double) -> Double
    {
        return(value / 20).round(to: 4)
    }
    func FOToML(value: Double) -> Double
    {
        return(value * 28.413).round(to: 4)
    }
    
    //Milli-LitreTo?Conversions
    func MLToGallon(value: Double) -> Double
    {
        return(value / 4546.09).round(to: 4)
    }
    func MLToLitre(value: Double) -> Double
    {
        return(value / 1000).round(to: 4)
    }
    func MLToUKPint(value: Double) -> Double
    {
        return(value / 568.261).round(to: 4)
    }
    func MLToFO(value: Double) -> Double
    {
        return(value / 28.413).round(to: 4)
    }
    
    //Length Calculations
    //MetresTo?Conversions
    func MetreToMile(value: Double) -> Double
    {
        return(value / 1609.344).round(to: 4)
    }
    func MetreToCM(value: Double) -> Double
    {
        return(value * 100).round(to: 4)
    }
    func MetreToMM(value: Double) -> Double
    {
        return(value * 1000).round(to: 4)
    }
    func MetreToYard(value: Double) -> Double
    {
        return(value * 1.094).round(to: 4)
    }
    func MetreToInch(value: Double) -> Double
    {
        return(value * 39.37).round(to: 4)
    }
    
    //MilesTo?Conversions
    func MileToMetre(value: Double) -> Double
    {
        return(value * 1609.344).round(to: 4)
    }
    func MileToCM(value: Double) -> Double
    {
        return(value * 160934.4).round(to: 4)
    }
    func MileToMM(value: Double) -> Double
    {
        return(value * 1.609e+6).round(to: 4)
    }
    func MileToYard(value: Double) -> Double
    {
        return(value * 1760).round(to: 4)
    }
    func MileToInch(value: Double) -> Double
    {
        return(value * 63360).round(to: 4)
    }
    
    //CentimetresTo?Conversion
    func CMToMetre(value: Double) -> Double
    {
        return(value / 100).round(to: 4)
    }
    func CMToMile(value: Double) -> Double
    {
        return(value / 160934.4).round(to: 4)
    }
    func CMToMM(value: Double) -> Double
    {
        return(value * 10).round(to: 4)
    }
    func CMToYard(value: Double) -> Double
    {
        return(value / 91.44).round(to: 4)
    }
    func CMToInch(value: Double) -> Double
    {
        return(value / 2.54).round(to: 4)
    }
    
    //Milli-MetresTo?Conversion
    func MMToMetre(value: Double) -> Double
    {
        return(value / 1000).round(to: 4)
    }
    func MMToMile(value: Double) -> Double
    {
        return(value / 1.609e+6).round(to: 4)
    }
    func MMToCM(value: Double) -> Double
    {
        return(value / 10).round(to: 4)
    }
    func MMToYard(value: Double) -> Double
    {
        return(value / 914.4).round(to: 4)
    }
    func MMToInch(value: Double) -> Double
    {
        return(value / 25.4).round(to: 4)
    }
    
    //YardTo?Conversion
    func YardToMetre(value: Double) -> Double
    {
        return(value / 1.094).round(to: 4)
    }
    func YardToMile(value: Double) -> Double
    {
        return(value / 1760).round(to: 4)
    }
    func YardToCM(value: Double) -> Double
    {
        return(value * 91.44).round(to: 4)
    }
    func YardToMM(value: Double) -> Double
    {
        return(value * 914.4).round(to: 4)
    }
    func YardToInch(value: Double) -> Double
    {
        return(value * 36).round(to: 4)
    }

    //InchTo?Conversion
    func InchToMetre(value: Double) -> Double
    {
        return(value / 39.37).round(to: 4)
    }
    func InchToMile(value: Double) -> Double
    {
        return(value / 63360).round(to: 4)
    }
    func InchToCM(value: Double) -> Double
    {
        return(value * 2.54).round(to: 4)
    }
    func InchToMM(value: Double) -> Double
    {
        return(value * 25.4).round(to: 4)
    }
    func InchToYard(value: Double) -> Double
    {
        return(value / 36).round(to: 4)
    }
}

extension Double{
    func round(to places: Int) -> Double{
        let divisor = pow(10.0, Double(places))
        return Darwin.round(self * divisor) / divisor
    }
}
