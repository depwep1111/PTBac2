//
//  ViewController.swift
//  GPTB2
//
//  Created by Duy Bùi on 4/9/17.
//  Copyright © 2017 Duy Bùi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var a: UITextField!
    @IBOutlet weak var b: UITextField!
    @IBOutlet weak var c: UITextField!
    
    @IBOutlet weak var wronga: UILabel!
    
    @IBOutlet weak var wrongb: UILabel!
    
    @IBOutlet weak var wrongc: UILabel!
    @IBOutlet weak var ketqua: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tinh(_ sender: Any) {
        var x: Float = 0
        var y: Float = 0
        var z: Float = 0
        var delta: Float
        var flag: Bool = true
        let checka = a.text
        let checkb = b.text
        let checkc = c.text
        let checksoa = isValidNumber(numberString: checka!)
        let checksob = isValidNumber(numberString: checkb!)
        let checksoc = isValidNumber(numberString: checkc!)
        if checksoa == false
        {
            wronga.text = "Nhap lai"
            flag = false
        }
        else
        {
            x = Float(a.text!)!
        }
        if checksob == false
        {
            wrongb.text = "Nhap lai"
            flag = false
        }
        else
        {
            y = Float(b.text!)!
        }
        if checksoc == false
        {
            wrongc.text = "Nhap lai"
            flag = false
        }
        else
        {
            z = Float(c.text!)!
        }
        if flag == true{
            if x==0
            {
                if y==0
                {
                    if z==0
                    {
                        ketqua.text = "Phuong trinh vo so nghiem"
                    }
                    else{
                        ketqua.text = "Phuong trinh vo nghiem"                    }
                }
                else{
                    ketqua.text = "Phuong trinh co 1 nghiem: \(-y/z)"                }
            }
            else{
                delta = y*y-4*x*z
                if delta<0
                {
                    ketqua.text = "Phuong trinh vo nghiem"                }
                if delta==0
                {
                    ketqua.text = "Phuong trinh co nghiem kep: \(-y/(2*x))"                }
                if delta>0
                {
                    ketqua.text = "Phuong trinh co 2 nghiem phan biet: \n x1: \((-y+sqrt(delta))/(2*x)) \n x2: \((-y-sqrt(delta))/(2*x))"                }
            }
        }
    }
    func isValidNumber(numberString: String) -> Bool{
        var returnValue = true
        let numberReg = "[0-9]"
        do{
            let reg = try NSRegularExpression (pattern: numberReg)
            let nsString = numberString as NSString
            let result = reg.matches(in: numberString, range: NSRange(location:0, length: nsString.length))
            if result.count == 0
            {
                returnValue = false
            }
            
        }catch let error as NSError{
            returnValue = false
        }
        return returnValue
        
    }

}

