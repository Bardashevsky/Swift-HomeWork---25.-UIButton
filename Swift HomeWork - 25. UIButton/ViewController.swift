//
//  ViewController.swift
//  Swift HomeWork - 25. UIButton
//
//  Created by Oleksandr Bardashevskyi on 10/28/18.
//  Copyright © 2018 Oleksandr Bardashevskyi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var numberFromText = Double()
    var firstNumber = Double()
    var operation = Int()
    var mathSign = false
    
    
    struct StringWithMaxLenght9 {
        var lenght : String {
            didSet {
                if lenght.count > 9 {
                    lenght = oldValue
                }
            }
        }
    }
    
    var newString = StringWithMaxLenght9(lenght: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in self.view.subviews {
            i.layer.cornerRadius = i.frame.height / 2
        }
    }
    
    @IBOutlet weak var resultDisplay: UILabel!
    
    @IBAction func numbers(_ sender: UIButton) {
        
        if self.resultDisplay.text! == "0" {
            self.resultDisplay.text = ""
        }
        
        if mathSign == true {
            newString.lenght = String(sender.tag)
            mathSign = false
        } else {
            newString.lenght = self.resultDisplay.text! + String(sender.tag)
        }
        self.resultDisplay.text = newString.lenght
        numberFromText = Double(self.resultDisplay.text!) ?? 0
        
    }
    @IBAction func reset(_ sender: UIButton) {
        
        self.resultDisplay.text = "0"
        numberFromText = Double(self.resultDisplay.text!) ?? 0
        numberFromText = 0
        firstNumber = 0
        operation = 0
        
    }
    
    @IBAction func dot(_ sender: UIButton) {
        
        if !self.resultDisplay.text!.contains(".") {
            if mathSign == false {
                if (self.resultDisplay.text?.count)! < 9 {
            self.resultDisplay.text = self.resultDisplay.text! + "."
                }
            }
        }
        numberFromText = Double(self.resultDisplay.text!) ?? 0
        
    }
    
    @IBAction func plusAndMinus(_ sender: UIButton) {
        if Double(self.resultDisplay.text!) != nil {
        let minusNumber = Double(self.resultDisplay.text!)! * (-1)
            if Double(Int(minusNumber)) == Double(minusNumber) {
                self.resultDisplay.text = String(Int(minusNumber))
            } else {
                self.resultDisplay.text = String(minusNumber)
            }
        numberFromText = Double(minusNumber)
        }
    }
    
    @IBAction func operations(_ sender: UIButton) {
        if self.resultDisplay.text != "" && sender.tag != 12 && sender.tag != 19 {
            firstNumber = Double(self.resultDisplay.text!)!
            operation = sender.tag
            mathSign = true
        } else if sender.tag == 12 {
            if operation == 13 {
                mathSign = true
                self.resultDisplay.text = Double(Int(firstNumber + numberFromText)) == Double(firstNumber + numberFromText) ? String(Int(firstNumber + numberFromText)) : String(Double(firstNumber + numberFromText))
            } else if operation == 14 {
                mathSign = true
                self.resultDisplay.text = Double(Int(firstNumber - numberFromText)) == Double(firstNumber - numberFromText) ? String(Int(firstNumber - numberFromText)) : String(Double(firstNumber - numberFromText))
            } else if operation == 15 {
                mathSign = true
                self.resultDisplay.text = Double(Int(firstNumber * numberFromText)) == Double(firstNumber * numberFromText) ? String(Int(firstNumber * numberFromText)) : String(Double(firstNumber * numberFromText))
            } else if operation == 16 {
                mathSign = true
                self.resultDisplay.text = Double(Int(firstNumber / numberFromText)) == Double(firstNumber / numberFromText) ? String(Int(firstNumber / numberFromText)) : String(Double(firstNumber / numberFromText))
            } else if operation == 17 {
                mathSign = true
                self.resultDisplay.text = Double(Int(firstNumber / 100 * numberFromText)) == Double(firstNumber / 100 * numberFromText) ? String(Int(firstNumber / 100 * numberFromText)) : String(Double(firstNumber / 100 * numberFromText))
            }
        }
    }
    @IBAction func switchColor(_ sender: UISwitch) {
        sender.backgroundColor = self.view.backgroundColor
        if sender.isEnabled {
            self.view.backgroundColor = UIColor.white
            self.resultDisplay.textColor = UIColor.black
            self.resultDisplay.backgroundColor = self.view.backgroundColor
            sender.backgroundColor = self.view.backgroundColor
            for i in self.view.subviews {
                if i.layer.cornerRadius != i.frame.height/2 {
                    i.layer.cornerRadius = i.frame.height/2
                } else if i.layer.cornerRadius == i.frame.height/2 {
                    i.layer.cornerRadius = 0
                }
            }
        }
        if sender.isOn {
            self.view.backgroundColor = UIColor.black
            self.resultDisplay.textColor = UIColor.white
            self.resultDisplay.backgroundColor = self.view.backgroundColor
            sender.backgroundColor = self.view.backgroundColor
            for i in self.view.subviews {
                if i.layer.cornerRadius != i.frame.height/2 {
                    i.layer.cornerRadius = i.frame.height/2
                } else if i.layer.cornerRadius == i.frame.height/2 {
                    i.layer.cornerRadius = 0
                }
            }
        }
    }
    
    func randomColor() -> UIColor {
        let r = CGFloat(arc4random()%256)/CGFloat(255)
        let b = CGFloat(arc4random()%256)/CGFloat(255)
        let g = CGFloat(arc4random()%256)/CGFloat(255)
        return UIColor(red: r, green: b, blue: g, alpha: 1)
    }
    
    @IBAction func crazyMod(_ sender: UIButton) {
        for i in self.view.subviews {
            if i.layer.cornerRadius == i.frame.height/2 {
            self.view.backgroundColor = randomColor()
            i.backgroundColor = randomColor()
            self.resultDisplay.backgroundColor = self.view.backgroundColor
            }
        }
    }
    
    
}

