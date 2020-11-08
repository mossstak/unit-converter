//
//  CustomKeyboard.swift
//  CW1
//
//  Created by Student User on 13/03/2019.
//  Copyright © 2019 Mostak Khan. All rights reserved.
//

import UIKit
import Foundation

class CustomKeyboard: UIViewController{
    @IBOutlet weak var Ounce: UITextField!
    @IBOutlet weak var Pound: UITextField!
    @IBOutlet weak var Gram: UITextField!
    @IBOutlet weak var Kilogram: UITextField!
    @IBOutlet weak var Stones: UITextField!
    @IBOutlet weak var Celsius: UITextField!
    @IBOutlet weak var Fahrenheit: UITextField!
    @IBOutlet weak var Kelvin: UITextField!
    @IBOutlet weak var MetresSecs: UITextField!
    @IBOutlet weak var KMHour: UITextField!
    @IBOutlet weak var MilesHour: UITextField!
    @IBOutlet weak var NMHour: UITextField!
    @IBOutlet weak var Gallon: UITextField!
    @IBOutlet weak var Litre: UITextField!
    @IBOutlet weak var UKPint: UITextField!
    @IBOutlet weak var FluidOunce: UITextField!
    @IBOutlet weak var Millilitre: UITextField!
    @IBOutlet weak var Metre: UITextField!
    @IBOutlet weak var Mile: UITextField!
    @IBOutlet weak var Centimetre: UITextField!
    @IBOutlet weak var Millimetre: UITextField!
    @IBOutlet weak var Yard: UITextField!
    @IBOutlet weak var Inch: UITextField!
    
    var convertApp : Converter? //This is linked to the CoverterCalc Class
    var userHasStartedTyping = false //This is linked to the Clear Button which resets the conversions
    var activeTextField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.convertApp = Converter()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    //Buttons for HomePage, This is linked to the Home Button and Menu Button
    @IBAction func homeWeightBtnPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "conWeight", sender: self)
    }
    @IBAction func homeTempBtnPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "conTemp", sender: self)
    }
    
    @IBAction func homeSpeedBtnPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "conSpeed", sender: self)
    }
    
    @IBAction func homeVolBtnPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "conVolume", sender: self)
    }
    
    @IBAction func homeLengthBtnPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "conLength", sender: self)
    }
    
    @IBAction func weightHomeBtnPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "weightCon", sender: self)
    }
    
    @IBAction func tempHomeBtnPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "tempCon", sender: self)
    }
    
    @IBAction func speedHomeBtnPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "speedCon", sender: self)
    }
    
    @IBAction func volHomeBtnPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "volCon", sender: self)
    }
    
    @IBAction func lengthHomeBtnPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "lengthCon", sender: self)
    }


    
    //CustomKeypads, This is the buttons from 1-9
    @IBAction func NumberTouch(_ sender: UIButton) {
        let current = view.getSelectedTextField().self
        let digit = sender.currentTitle!
        print("digit pressed = \(digit)")
        if userHasStartedTyping{
            current?.text = (current?.text!)! + "\(digit)"
        }else{
            current?.text = digit
            userHasStartedTyping = true
            
        }
    }
    
    //decimalsButtons, This is the decimals on the keypad which only does once
    @IBAction func DecimalPoints(_ sender: UIButton) {
        let current = view.getSelectedTextField().self
        let decimal = sender.currentTitle!
        print ("decimal pressed = \(decimal)")
        if(current?.text?.contains("\(decimal)"))!{
            current?.text = current?.text!
        }
        else{
            
            if userHasStartedTyping{
                current?.text = (current?.text!)! + "\(decimal)"
                
            }
        else{
            current?.text = decimal
            userHasStartedTyping = true
            }
        }
    }
    
    //This is the negative buttons that works with Temperature.
    @IBAction func Negative(_ sender: UIButton) {
        let current = view.getSelectedTextField().self
        let digit = (sender as AnyObject).currentTitle!
        if(current?.text != ""){
            Value = Value * -1
            current?.text = "\(Value)"
        }else{
            current?.text = digit
            userHasStartedTyping = true
        }
    }
    
    
    //Here is the clear button which does the similar job to backspace button, i attempted but couldn't work how to do this so i made a reset button instead which resets to zero and the variable goes back to being false.
    @IBAction func Clear(_ sender: UIButton) {
        Value = 0
        userHasStartedTyping = false
        
        //Value.droplast()


    }
    
    //This is the Double variable for Value, which changes the start application to the current text.
    var Value : Double{
        get {
            let current = view.getSelectedTextField().self
            return (NumberFormatter().number(from: current!.text!)?.doubleValue)!
        }
        set(newValue)
        {
            let current = view.getSelectedTextField().self
            current?.text = "\(newValue)"
        }
    }
    
    //This is the submit button for Weight
    @IBAction func subWeight(_ sender: UIButton) {
        if( (Ounce.text! as NSString).doubleValue.isEqual(to: Value) ){
            let conOunceToPound = self.convertApp?.OunceToPound(value: Value)
            let conOunceToGram = self.convertApp?.OunceToGram(value: Value)
            let conOunceToKg = self.convertApp?.OunceToKg(value: Value)
            let conOunceToStone = self.convertApp?.OunceToStone(value: Value)
            Pound.text = "\(String(describing: conOunceToPound!))"
            Gram.text = "\(String(describing: conOunceToGram!))"
            Kilogram.text = "\(String(describing: conOunceToKg!))"
            Stones.text = "\(String(describing: conOunceToStone!))"
        }else{
            if( (Pound.text! as NSString).doubleValue.isEqual(to: Value) ){
                let conPoundToOunce = self.convertApp?.PoundToOunce(value: Value)
                let conPoundToKg = self.convertApp?.PoundToKg(value: Value)
                let conPoundToGram = self.convertApp?.PoundToGram(value: Value)
                let conPoundToStone = self.convertApp?.PoundToStone(value: Value)
                Ounce.text = "\(String(describing: conPoundToOunce!))"
                Gram.text = "\(String(describing: conPoundToGram!))"
                Kilogram.text = "\(String(describing: conPoundToKg!))"
                Stones.text = "\(String(describing: conPoundToStone!))"
            }else{
                if( (Kilogram.text! as NSString).doubleValue.isEqual(to: Value) ){
                    let conKgToPound = self.convertApp?.KgToPound(value: Value)
                    let conKgToOunce = self.convertApp?.KgToOunce(value: Value)
                    let conKgToGram = self.convertApp?.KgToGram(value: Value)
                    let conKgToStone = self.convertApp?.KgToStone(value: Value)
                    Pound.text = "\(String(describing: conKgToPound!))"
                    Gram.text = "\(String(describing: conKgToOunce!))"
                    Ounce.text = "\(String(describing: conKgToGram!))"
                    Stones.text = "\(String(describing: conKgToStone!))"
                }else{
                    if( (Gram.text! as NSString).doubleValue.isEqual(to: Value) ){
                        let conGramToPound = self.convertApp?.GramToPound(value: Value)
                        let conGramToOunce = self.convertApp?.GramToOunce(value: Value)
                        let conGramToKg = self.convertApp?.GramToKg(value: Value)
                        let conGramToStone = self.convertApp?.GramToStone(value: Value)
                        Pound.text = "\(String(describing: conGramToPound!))"
                        Ounce.text = "\(String(describing: conGramToOunce!))"
                        Kilogram.text = "\(String(describing: conGramToKg!))"
                        Stones.text = "\(String(describing: conGramToStone!))"
                    }else{
                        if( (Stones.text! as NSString).doubleValue.isEqual(to: Value) ){
                            let conStoneToPound = self.convertApp?.StoneToPound(value: Value)
                            let conStoneToOunce = self.convertApp?.StoneToOunce(value: Value)
                            let conStoneToKg = self.convertApp?.StoneToKg(value: Value)
                            let conStoneToGram = self.convertApp?.StoneToGram(value: Value)
                            Pound.text = "\(String(describing: conStoneToPound!))"
                            Ounce.text = "\(String(describing: conStoneToOunce!))"
                            Kilogram.text = "\(String(describing: conStoneToKg!))"
                            Gram.text = "\(String(describing: conStoneToGram!))"
                        }
                    }
                }
            }
        }
    }
    
    //This is the submit button for Temperature
    @IBAction func subTemp(_ sender: UIButton) {
        if( (Celsius.text! as NSString).doubleValue.isEqual(to: Value) ){
            let conCelsiusToFahrenheit = self.convertApp?.CelsiusToFahrenheit(value: Value)
            let conCelsiusToKelvin = self.convertApp?.CelsiusToKelvin(value: Value)
            Fahrenheit.text = "\(String(describing: conCelsiusToFahrenheit!))"
            Kelvin.text = "\(String(describing: conCelsiusToKelvin!))"
        }else{
            if( (Fahrenheit.text! as NSString).doubleValue.isEqual(to: Value) ){
                let conFahrenheitToCelsius = self.convertApp?.FahrenheitToCelsius(value: Value)
                let conFahrenheitToKelvin = self.convertApp?.FahrenheitToKelvin(value: Value)
                Celsius.text = "\(String(describing: conFahrenheitToCelsius!))"
                Kelvin.text = "\(String(describing: conFahrenheitToKelvin!))"
            }else{
                if( (Kelvin.text! as NSString).doubleValue.isEqual(to: Value) ){
                    let conKelvinToFahrenheit = self.convertApp?.KelvinToFahrenheit(value: Value)
                    let conKelvinToCelsius = self.convertApp?.KelvinToCelsius(value: Value)
                    Fahrenheit.text = "\(String(describing: conKelvinToFahrenheit!))"
                    Celsius.text = "\(String(describing: conKelvinToCelsius!))"
                }
            }
        }
    }
    
    //This is the submit button for Speed
    @IBAction func subSpeed(_ sender: UIButton) {
        if( (MetresSecs.text! as NSString).doubleValue.isEqual(to: Value) ){
            let conMetresSecToKMHour = self.convertApp?.MSToKH(value: Value)
            let conMetresSecToMH = self.convertApp?.MSToMH(value: Value)
            let conMetresSecToNM = self.convertApp?.MSToNM(value: Value)
            KMHour.text = "\(String(describing: conMetresSecToKMHour!))"
            MilesHour.text = "\(String(describing: conMetresSecToMH!))"
            NMHour.text = "\(String(describing: conMetresSecToNM!))"
        }else{
            if( (KMHour.text! as NSString).doubleValue.isEqual(to: Value) ){
                let conKMHourToMetresSec = self.convertApp?.KHToMS(value: Value)
                let conKMHourSecToMH = self.convertApp?.KHToMH(value: Value)
                let conKMHourToNM = self.convertApp?.KHToNM(value: Value)
                MetresSecs.text = "\(String(describing: conKMHourToMetresSec!))"
                MilesHour.text = "\(String(describing: conKMHourSecToMH!))"
                NMHour.text = "\(String(describing: conKMHourToNM!))"
            }else{
                if( (MilesHour.text! as NSString).doubleValue.isEqual(to: Value) ){
                    let conMHToMetresSec = self.convertApp?.MHToMS(value: Value)
                    let conMHToKMHour = self.convertApp?.MHToKH(value: Value)
                    let conMHToNM = self.convertApp?.MHToNM(value: Value)
                    MetresSecs.text = "\(String(describing: conMHToMetresSec!))"
                    KMHour.text = "\(String(describing: conMHToKMHour!))"
                    NMHour.text = "\(String(describing: conMHToNM!))"
                }else{
                    if( (NMHour.text! as NSString).doubleValue.isEqual(to: Value) ){
                        let conNMToMS = self.convertApp?.NMToMS(value: Value)
                        let conNMToKMHour = self.convertApp?.NMToKH(value: Value)
                        let conNMToMH = self.convertApp?.NMToMH(value: Value)
                        MetresSecs.text = "\(String(describing: conNMToMS!))"
                        KMHour.text = "\(String(describing: conNMToKMHour!))"
                        MilesHour.text = "\(String(describing: conNMToMH!))"
                    }
                }
            }
        }
    }
    
    //This is the submit button for Volume
    @IBAction func subVol(_ sender: UIButton) {
        if( (Gallon.text! as NSString).doubleValue.isEqual(to: Value) ){
            let conGallonToLitre = self.convertApp?.GallonToLitre(value: Value)
            let conGallonToUKPint = self.convertApp?.GallonToUKPint(value: Value)
            let conGallonToFO = self.convertApp?.GallonToFO(value: Value)
            let conGallonToML = self.convertApp?.GallonToML(value: Value)
            Litre.text = "\(String(describing: conGallonToLitre!))"
            UKPint.text = "\(String(describing: conGallonToUKPint!))"
            FluidOunce.text = "\(String(describing: conGallonToFO!))"
            Millilitre.text = "\(String(describing: conGallonToML!))"
        }else{
            if( (Litre.text! as NSString).doubleValue.isEqual(to: Value) ){
                let conLitreToGallon = self.convertApp?.LitreToGallon(value: Value)
                let conLitreToUKPint = self.convertApp?.LitreToUKPint(value: Value)
                let conLitreToFO = self.convertApp?.LitreToFO(value: Value)
                let conLitreToML = self.convertApp?.LitreToML(value: Value)
                Gallon.text = "\(String(describing: conLitreToGallon!))"
                UKPint.text = "\(String(describing: conLitreToUKPint!))"
                FluidOunce.text = "\(String(describing: conLitreToFO!))"
                Millilitre.text = "\(String(describing: conLitreToML!))"
            }else{
                if( (UKPint.text! as NSString).doubleValue.isEqual(to: Value) ){
                    let conUKPintToGallon = self.convertApp?.UKPintToGallon(value: Value)
                    let conUKPintToLitre = self.convertApp?.UKPintToLitre(value: Value)
                    let conUKPintToFO = self.convertApp?.UKPintToFO(value: Value)
                    let conUKPintToML = self.convertApp?.UKPintToML(value: Value)
                    Gallon.text = "\(String(describing: conUKPintToGallon!))"
                    Litre.text = "\(String(describing: conUKPintToLitre!))"
                    FluidOunce.text = "\(String(describing: conUKPintToFO!))"
                    Millilitre.text = "\(String(describing: conUKPintToML!))"
                }else{
                    if( (FluidOunce.text! as NSString).doubleValue.isEqual(to: Value) ){
                        let conFOToGallon = self.convertApp?.FOToGallon(value: Value)
                        let conFOToLitre = self.convertApp?.FOToLitre(value: Value)
                        let conFOToUKPint = self.convertApp?.FOToUKPint(value: Value)
                        let conFOToML = self.convertApp?.FOToML(value: Value)
                        Gallon.text = "\(String(describing: conFOToGallon!))"
                        Litre.text = "\(String(describing: conFOToLitre!))"
                        UKPint.text = "\(String(describing: conFOToUKPint!))"
                        Millilitre.text = "\(String(describing: conFOToML!))"
                    }else{
                        if( (Millilitre.text! as NSString).doubleValue.isEqual(to: Value) ){
                            let conMLToGallon = self.convertApp?.MLToGallon(value: Value)
                            let conMLToLitre = self.convertApp?.MLToLitre(value: Value)
                            let conMLToUKPint = self.convertApp?.FOToUKPint(value: Value)
                            let conMLToFO = self.convertApp?.MLToFO(value: Value)
                            Gallon.text = "\(String(describing: conMLToGallon!))"
                            Litre.text = "\(String(describing: conMLToLitre!))"
                            UKPint.text = "\(String(describing: conMLToUKPint!))"
                            FluidOunce.text = "\(String(describing: conMLToFO!))"
                        }
                    }
                }
            }
        }
    }
    
    //This is the submit button for Length
    @IBAction func subLength(_ sender: UIButton) {
        if( (Metre.text! as NSString).doubleValue.isEqual(to: Value) ){
            let conMetreToMile = self.convertApp?.MetreToMile(value: Value)
            let conMetreToCentimetre = self.convertApp?.MetreToCM(value: Value)
            let conMetreToMillimetre = self.convertApp?.MetreToMM(value: Value)
            let conMetreToYard = self.convertApp?.MetreToYard(value: Value)
            let conMetreToInch = self.convertApp?.MetreToInch(value: Value)
            Mile.text = "\(String(describing: conMetreToMile!))"
            Centimetre.text = "\(String(describing: conMetreToCentimetre!))"
            Millimetre.text = "\(String(describing: conMetreToMillimetre!))"
            Yard.text = "\(String(describing: conMetreToYard!))"
            Inch.text = "\(String(describing: conMetreToInch!))"
        }else{
            if( (Mile.text! as NSString).doubleValue.isEqual(to: Value) ){
                let conMileToMetre = self.convertApp?.MileToMetre(value: Value)
                let conMileToCentimetre = self.convertApp?.MileToCM(value: Value)
                let conMileToMillimetre = self.convertApp?.MileToMM(value: Value)
                let conMileToYard = self.convertApp?.MileToYard(value: Value)
                let conMileToInch = self.convertApp?.MileToInch(value: Value)
                Metre.text = "\(String(describing: conMileToMetre!))"
                Centimetre.text = "\(String(describing: conMileToCentimetre!))"
                Millimetre.text = "\(String(describing: conMileToMillimetre!))"
                Yard.text = "\(String(describing: conMileToYard!))"
                Inch.text = "\(String(describing: conMileToInch!))"
            }else{
                if( (Centimetre.text! as NSString).doubleValue.isEqual(to: Value) ){
                    let conCentimetreToMile = self.convertApp?.CMToMile(value: Value)
                    let conCentimetreToMetre = self.convertApp?.CMToMetre(value: Value)
                    let conCentimetreToMillimetre = self.convertApp?.CMToMM(value: Value)
                    let conCentimetreToYard = self.convertApp?.CMToYard(value: Value)
                    let conCentimetreToInch = self.convertApp?.CMToInch(value: Value)
                    Mile.text = "\(String(describing: conCentimetreToMile!))"
                    Metre.text = "\(String(describing: conCentimetreToMetre!))"
                    Millimetre.text = "\(String(describing: conCentimetreToMillimetre!))"
                    Yard.text = "\(String(describing: conCentimetreToYard!))"
                    Inch.text = "\(String(describing: conCentimetreToInch!))"
                }else{
                    if( (Millimetre.text! as NSString).doubleValue.isEqual(to: Value) ){
                        let conMillimetreToMile = self.convertApp?.MMToMile(value: Value)
                        let conMillimetreToCentimetre = self.convertApp?.MMToCM(value: Value)
                        let conMillimetreToMetre = self.convertApp?.MMToMetre(value: Value)
                        let conMillimetreToYard = self.convertApp?.MMToYard(value: Value)
                        let conMillimetreToInch = self.convertApp?.MMToInch(value: Value)
                        Mile.text = "\(String(describing: conMillimetreToMile!))"
                        Centimetre.text = "\(String(describing: conMillimetreToCentimetre!))"
                        Metre.text = "\(String(describing: conMillimetreToMetre!))"
                        Yard.text = "\(String(describing: conMillimetreToYard!))"
                        Inch.text = "\(String(describing: conMillimetreToInch!))"
                    }else{
                        if( (Yard.text! as NSString).doubleValue.isEqual(to: Value) ){
                            let conYardToMile = self.convertApp?.YardToMile(value: Value)
                            let conYardToCentimetre = self.convertApp?.YardToCM(value: Value)
                            let conYardToMillimetre = self.convertApp?.YardToMM(value: Value)
                            let conYardToMetre = self.convertApp?.YardToMetre(value: Value)
                            let conYardToInch = self.convertApp?.YardToInch(value: Value)
                            Mile.text = "\(String(describing: conYardToMile!))"
                            Centimetre.text = "\(String(describing: conYardToCentimetre!))"
                            Millimetre.text = "\(String(describing: conYardToMillimetre!))"
                            Metre.text = "\(String(describing: conYardToMetre!))"
                            Inch.text = "\(String(describing: conYardToInch!))"
                        }else{
                            if( (Inch.text! as NSString).doubleValue.isEqual(to: Value) ){
                                let conInchToMile = self.convertApp?.InchToMile(value: Value)
                                let conInchToCentimetre = self.convertApp?.InchToCM(value: Value)
                                let conInchToMillimetre = self.convertApp?.InchToMM(value: Value)
                                let conInchToYard = self.convertApp?.InchToYard(value: Value)
                                let conInchToMetre = self.convertApp?.InchToMetre(value: Value)
                                Mile.text = "\(String(describing: conInchToMile!))"
                                Centimetre.text = "\(String(describing: conInchToCentimetre!))"
                                Millimetre.text = "\(String(describing: conInchToMillimetre!))"
                                Yard.text = "\(String(describing: conInchToYard!))"
                                Metre.text = "\(String(describing: conInchToMetre!))"
                            }
                        }
                    }
                }
            }
        }
    }
    
    
    //This is the Save Button for all my conversions, Here I done it different that what it was supposed to be, As it really isn't the same in the coursework specification, I tried to add through History Tab but I couldn't get it to work as it came up errors most of the time, so the history shows only in Command Line.
    @IBAction func saveWeight(_ sender: UIButton) {
        
        let fileName = "Weight"
        let DocumentDirURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        let WeightURL = DocumentDirURL.appendingPathComponent(fileName).appendingPathExtension("txt")
        
        print("File Path: \(WeightURL.path)")
 
        
        let writeString = " Ounce: " + Ounce.text! + " = " + " Pound: " + Pound.text! + "Gram: " + Gram.text! + " = " + " Kilogram: " + Kilogram.text! + " Stones " + Stones.text!
        
        do{
            //Write to the file
            try writeString.write(to: WeightURL, atomically: true, encoding: String.Encoding.utf8)
            print("Conversion has been saved.")
        }catch let error as NSError{
            print("Failed to write to URL ")
            print (error)
        }
        
        var readString = ""
        do{
            readString = try String(contentsOf: WeightURL)
        }catch let error as NSError{
            print ("Failed to read file")
            print(error)
        }
 
        print("Contents of the file \(readString)")
 
    }
    
    @IBAction func saveTemp(_ sender: UIButton) {
        
        let fileName = "Temperature"
        let DocumentDirURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        let TemperatureURL = DocumentDirURL.appendingPathComponent(fileName).appendingPathExtension("txt")
        
        print("File Path: \(TemperatureURL.path)")
        
        let writeString = " Celsius: " + Celsius.text! + " = " + " Kelvin: " + Kelvin.text! + " Fahrenheit: " + " = " + Fahrenheit.text!
        do{
            //Write to the file
            try writeString.write(to: TemperatureURL, atomically: true, encoding: String.Encoding.utf8)
            print("Conversion has been saved.")
        }catch let error as NSError{
            print("Failed to write to URL ")
            print (error)
        }
        
        var readString = ""
        do{
            readString = try String(contentsOf: TemperatureURL)
        }catch let error as NSError{
            print ("Failed to read file")
            print(error)
        }
        
        print("Contents of the file \(readString)")
        
    }
    
    @IBAction func saveSpeed(_ sender: UIButton) {
        
        let fileName = "Speed"
        let DocumentDirURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        let SpeedURL = DocumentDirURL.appendingPathComponent(fileName).appendingPathExtension("txt")
        
        print("File Path: \(SpeedURL.path)")
        let writeString = " Metres-Seconds: " + MetresSecs.text! + " = " + " Kilometres-Hour: " + KMHour.text! + "Miles-Hour: " + MilesHour.text! + " = " + " NMHours: " + NMHour.text!
        do{
            //Write to the file
            try writeString.write(to: SpeedURL, atomically: true, encoding: String.Encoding.utf8)
            print("Conversion has been saved.")
        }catch let error as NSError{
            print("Failed to write to URL ")
            print (error)
        }
        
        var readString = ""
        do{
            readString = try String(contentsOf: SpeedURL    )
        }catch let error as NSError{
            print ("Failed to read file")
            print(error)
        }
        
        print("Contents of the file \(readString)")
        
    }
    
    @IBAction func saveVolume(_ sender: UIButton) {
        
        let fileName = "Volume"
        let DocumentDirURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        let VolumeURL = DocumentDirURL.appendingPathComponent(fileName).appendingPathExtension("txt")
        
        print("File Path: \(VolumeURL.path)")
        
        let writeString = " Gallon: " + Gallon.text! + " = " + " Litre: " + Litre.text! + "UK Pint: " + UKPint.text! + " = " + " Fluid-Ounce: " + FluidOunce.text! + " = " + " Milli-Litres: " + Millilitre.text!
        
        do{
            //Write to the file
            try writeString.write(to: VolumeURL, atomically: true, encoding: String.Encoding.utf8)
            print("Conversion has been saved.")
        }catch let error as NSError{
            print("Failed to write to URL ")
            print (error)
        }
        
        var readString = ""
        do{
            readString = try String(contentsOf: VolumeURL)
        }catch let error as NSError{
            print ("Failed to read file")
            print(error)
        }
        
        print("Contents of the file \(readString)")
        
        
        
    }
    
    @IBAction func saveLength(_ sender: UIButton) {
        
        let fileName = "Volume"
        let DocumentDirURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        let VolumeURL = DocumentDirURL.appendingPathComponent(fileName).appendingPathExtension("txt")
        
        print("File Path: \(VolumeURL.path)")
        
        let writeString = " Metre: " + Metre.text! + " = " + " Mile: " + Mile.text! + "Centimetres: " + Centimetre.text! + " = " + " Milli-Metres: " + Millimetre.text! + " = " + " Yard: " + Yard.text! + " = " + " Inch: " + Inch.text!
        
        do{
            //Write to the file
            try writeString.write(to: VolumeURL, atomically: true, encoding: String.Encoding.utf8)
            print("Conversion has been saved.")
        }catch let error as NSError{
            print("Failed to write to URL ")
            print (error)
        }
        
        var readString = ""
        do{
            readString = try String(contentsOf: VolumeURL)
        }catch let error as NSError{
            print ("Failed to read file")
            print(error)
        }
        
        print("Contents of the file \(readString)")
    }
    
}

    extension UIView{
    func getSelectedTextField() -> UITextField?{ let totalTextFields = getTextFieldsInView(view: self); for textField in totalTextFields{ if textField.isFirstResponder{ return textField } }; return nil};
    func getTextFieldsInView(view: UIView) -> [UITextField]{var totalTextFields = [UITextField](); for subview in view.subviews as [UIView]{if let textField = subview as?  UITextField{totalTextFields += [textField]}else {totalTextFields += getTextFieldsInView(view: subview) }}; return totalTextFields}

    }

