//
//  ViewController.swift
//  Calculator_Zexi_Liu_zl558
//
//  Created by LIU ZEXI on 9/1/16.
//  Copyright © 2016 LIU ZEXI. All rights reserved.
//

import UIKit

extension UIImage {
    
    class func imageWithColor(color:UIColor?) -> UIImage! {
        
        let rect = CGRectMake(0.0, 0.0, 50, 50);
        
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0)
        
        let context = UIGraphicsGetCurrentContext();
        
        if let color = color {
            
            color.setFill()
        }
        else {
            
            UIColor.whiteColor().setFill()
        }
        
        CGContextFillRect(context, rect);
        
        let image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        return image;
    }
    
}

class ViewController: UIViewController {

    @IBOutlet weak var resultDisplay: UILabel!
    
    @IBOutlet weak var operDisplay: UILabel!
    
    @IBOutlet var ACCoutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        resultDisplay.text = "0"
        operDisplay.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    var hasDot = false
    var countnum = 0
    
    @IBAction func dot(sender: UIButton)
    {
        sender.backgroundColor=UIColor(red: 211.0/255.0, green: 87.0/255.0, blue: 16.0/255.0,alpha:1.0)
        if hasDot == true
        {
            return
        }
        if resultDisplay.text!.componentsSeparatedByString(".").count == 1 || (resultDisplay.text!.componentsSeparatedByString(".").count == 2 && resultDisplay.text!.componentsSeparatedByString("\n").count == 2)
        {
            resultDisplay.text! += "."
            hasDot = true
        }
    }
    @IBAction func changecolorfordot(sender: UIButton)
    {
        sender.backgroundColor=UIColor(red: 0.0/255.0, green: 156.0/255.0, blue: 170.0/255.0,alpha:1.0)
    }
    
    @IBAction func digits(sender: UIButton)
    {
        //ACCoutlet.titleLabel!.text! = "C"
        //sender.showsTouchWhenHighlighted=true
        sender.backgroundColor=UIColor(red: 211.0/255.0, green: 87.0/255.0, blue: 16.0/255.0,alpha:1.0)
        countnum += 1
        if countnum > 12
        {
            return
        }
        if resultDisplay.text != "0"
        {
            resultDisplay.text! += sender.titleLabel!.text!
        }
        else
        {
            resultDisplay.text! = sender.titleLabel!.text!
        }
        
        ACCoutlet.setTitle(" C", forState: UIControlState.Normal)
    }
    
    @IBAction func changecolor(sender: UIButton)
    {
        //var c=sender.backgroundColor
        sender.backgroundColor=UIColor(red: 93.0/255.0, green: 157.0/255.0, blue: 170.0/255.0,alpha:1.0)
        
    }
    
    
    
    @IBAction func ACC(sender: UIButton)
    {
        sender.backgroundColor=UIColor(red: 211.0/255.0, green: 87.0/255.0, blue: 16.0/255.0,alpha:1.0)
        resultDisplay.text = "0"
        operDisplay.text = ""
        hasDot = false
        countnum = 0
        ACCoutlet.setTitle("AC", forState: UIControlState.Normal)
    }
    @IBAction func changecolorforACC(sender: UIButton)
    {
        sender.backgroundColor=UIColor(red: 92.0/255.0, green: 193.0/255.0, blue: 144.0/255.0,alpha:1.0)
    }
    
    @IBAction func togglePlusMinus(sender: UIButton)
    {
        sender.backgroundColor=UIColor(red: 211.0/255.0, green: 87.0/255.0, blue: 16.0/255.0,alpha:1.0)
        if resultDisplay.text=="0"
        {
            return
        }
        var mymymy = resultDisplay.text!.componentsSeparatedByString("\n")
        if operDisplay.text == " +"
        {
            operDisplay.text = " -"
            return
        }
        else if operDisplay.text == " -"
        {
            operDisplay.text = " +"
            return
        }
        else if operDisplay.text == "=" || mymymy.count == 1 || mymymy[1] == ""
        {
            if resultDisplay.text![resultDisplay.text!.startIndex] != "-"
            {
                resultDisplay.text! = "-" + resultDisplay.text!
            }
            else
            {
                resultDisplay.text!.removeAtIndex(resultDisplay.text!.startIndex)
            }
        }
        else
        {
            if mymymy[1][mymymy[1].startIndex] != "-"
            {
                mymymy[1] = "-" + mymymy[1]
            }
            else
            {
                mymymy[1].removeAtIndex(mymymy[1].startIndex)
            }
            resultDisplay.text! = mymymy[0] + "\n" + mymymy[1]
        }
        
    }
    
    
    @IBAction func operation(sender: UIButton)
    {
        sender.backgroundColor=UIColor(red: 211.0/255.0, green: 87.0/255.0, blue: 16.0/255.0,alpha:1.0)
        resultDisplay.numberOfLines = 0
        hasDot = false
        countnum = 0
        if operDisplay.text == ""
        {
            resultDisplay.text! = resultDisplay.text! + "\n"
        }
        else if operDisplay.text == "="
        {
            resultDisplay.text! = resultDisplay.text! + "\n"
        }
        else
        {
            var myValue = resultDisplay.text!.componentsSeparatedByString("\n")
            let value1 = Double(myValue[0])!
            let value2 = Double(myValue[1]) ?? 123450123456789
            if value2 == 123450123456789
            {
                operDisplay.text! = " " + sender.titleLabel!.text!
                return
            }
            switch operDisplay.text!
            {
            case " +" :
                resultDisplay.text = String(value1+value2)
            case " -" :
                resultDisplay.text = String(value1-value2)
            case " x" :
                resultDisplay.text = String(value1*value2)
            case " ÷" :
                resultDisplay.text = String(format:"%.6f",value1/value2)
            case " %" :
                resultDisplay.text = String(value1%value2)
            default :
                return
            }
            if resultDisplay.text!.componentsSeparatedByString(".")[1] == "000000" || resultDisplay.text!.componentsSeparatedByString(".")[1] == "0"
            {
                resultDisplay.text! = resultDisplay.text!.componentsSeparatedByString(".")[0] + "\n"
            }
            else
            {
                resultDisplay.text! = resultDisplay.text! + "\n"
            }
        }
        operDisplay.text! = " " + sender.titleLabel!.text!
    }
    @IBAction func changecolorforope(sender: UIButton)
    {
        sender.backgroundColor=UIColor(red: 48.0/255.0, green: 170.0/255.0, blue: 126.0/255.0,alpha:1.0)
    }
    @IBAction func calculate(sender: UIButton)
    {
        sender.backgroundColor=UIColor(red: 211.0/255.0, green: 87.0/255.0, blue: 16.0/255.0,alpha:1.0)
        if operDisplay.text == "" || operDisplay.text == "="
        {
            operDisplay.text = sender.titleLabel!.text!
            return
        }
        var myValue = resultDisplay.text!.componentsSeparatedByString("\n")
        let value1 = Double(myValue[0])!
        let value2 = Double(myValue[1]) ?? 123450123456789
        switch operDisplay.text!
        {
        case " +" :
            resultDisplay.text = String(value1+value2)
        case " -" :
            resultDisplay.text = String(value1-value2)
        case " x" :
            resultDisplay.text = String(value1*value2)
        case " ÷" :
            resultDisplay.text = String(format:"%.6f",value1/value2)
        case " %" :
            resultDisplay.text = String(value1%value2)
        default :
            return
        }
        if resultDisplay.text!.componentsSeparatedByString(".")[1] == "000000" || resultDisplay.text!.componentsSeparatedByString(".")[1] == "0"
        {
            resultDisplay.text! = resultDisplay.text!.componentsSeparatedByString(".")[0]
        }
        else
        {
            resultDisplay.text! = resultDisplay.text!
        }
        operDisplay.text = sender.titleLabel!.text!
    }
    
    @IBAction func changecolorforcal(sender: UIButton)
    {
        sender.backgroundColor=UIColor(red: 0.0/255.0, green: 84.0/255.0, blue: 112.0/255.0,alpha:1.0)
    }
    
    
    
    
    
    
    
    
    
}

