//
//  View_4_2_ViewController.swift
//  Calculator Plus
//
//  Created by Min_MacBook Pro on 2020/03/26.
//  Copyright © 2020 FreeDeveloper. All rights reserved.
//

import UIKit

class Show5_2ViewController: UIViewController {

    @IBOutlet var Text_before: UITextField!
    @IBOutlet var Text_after: UITextField!
    @IBOutlet var Button_Result_outlet: UIButton!
    
    @IBOutlet weak var Label_result1_show: UILabel!
    @IBOutlet weak var Label_result2_show: UILabel!
    
    @IBOutlet var Result_1: UILabel!
    @IBOutlet var Result_2: UILabel!
    
    @IBOutlet weak var View_result1_line: UIView!
    @IBOutlet weak var View_result2_line: UIView!
    
    @IBOutlet weak var View_line: UIView!
    @IBOutlet weak var Button_RESET: UIButton!
    
    @IBOutlet weak var View_View: UIView!
    @IBOutlet var viewA: UIView!
    @IBOutlet var viewResult: UIView!
    
    var BEFORE = ""
    var AFTER = ""
    var RESULT = 0.0
    
    let GRAY = UIColor(named: "ColorGray")
    let BUTTON = UIColor(named: "button")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboard()
        
        setColor()
        setRadius()
        setAlpha()
        setTransform()
        showAnimation()
        
        setNavigationButton()
        setInputType()
        setInputChanged()
    }
    
    @objc func fbButtonPressed() {
        goToCalculater()
    }
    @objc func textFieldDidChange(textField: UITextField){
        algoOfTextChange()
    }
    
    @IBAction func Button_Result(_ sender: UIButton) {
        BEFORE = Text_before.text!
        AFTER = Text_after.text!
        if(check()) {
            algoOfResult()
        }
    }
    
    @IBAction func Button_reset(_ sender: UIButton) {
        reset()
        UIView.animate(withDuration: 0.5, animations: {
            self.resetColor()
            self.resetAlpha()
            self.resetTransform()
        })
    }
}



extension Show5_2ViewController {
    
    func setNavigationButton() {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "icon_bar"), for: .normal)
        button.addTarget(self, action: #selector(fbButtonPressed), for: .touchUpInside)
        button.frame = CGRect(x: 0, y: 0, width: 43, height: 51)
        let barButton = UIBarButtonItem(customView: button)
        self.navigationItem.rightBarButtonItem = barButton
    }
    
    func goToCalculater() {
        let vcName = self.storyboard?.instantiateViewController(withIdentifier: "CalculaterViewController")
                self.present(vcName!, animated: true, completion: nil)
    }
    
    func check() -> Bool {
        if BEFORE == "" {
            return false
        } else if AFTER == "" {
            return false
        }
        return true
    }
    
    func inputComma(innum: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        let RESULT_COMMA: String = numberFormatter.string(from:NSNumber(value: innum))!
        return RESULT_COMMA
    }
    
    func setColor() {
        self.Button_Result_outlet.backgroundColor = self.GRAY
    }
    
    func setRadius() {
        Button_Result_outlet.layer.cornerRadius = 4
        viewA.layer.cornerRadius = 12
        viewResult.layer.cornerRadius = 12
    }
    
    func setAlpha() {
        self.Label_result1_show.alpha = 0
        self.Label_result2_show.alpha = 0
        self.Result_1.alpha = 0
        self.Result_2.alpha = 0
        self.View_result1_line.alpha = 0
        self.View_result2_line.alpha = 0
        self.viewResult.alpha = 0
    }
    
    func setTransform() {
        self.Label_result1_show.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Label_result2_show.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Result_1.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Result_2.transform = CGAffineTransform(translationX: 0, y: -10)
        self.View_result1_line.transform = CGAffineTransform(translationX: 0, y: -10)
        self.View_result2_line.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Button_RESET.transform = CGAffineTransform(translationX: 0, y: -109)
        self.View_line.transform = CGAffineTransform(translationX: 0, y: -109)
    }
    
    func showAnimation() {
        self.View_View.alpha = 0
        UIView.animate(withDuration: 0.5, animations: {
            self.View_View.alpha = 1
        })
    }
    
    func setInputType() {
        Text_before.keyboardType = .numberPad
        Text_after.keyboardType = .numberPad
    }
    
    func setInputChanged() {
        Text_before.addTarget(self, action: #selector(textFieldDidChange(textField:)),
            for: UIControl.Event.editingChanged)
        Text_after.addTarget(self, action: #selector(textFieldDidChange(textField:)),
            for: UIControl.Event.editingChanged)
    }
    
    func showResultAnimation() {
        UIView.animate(withDuration: 0.5, animations: {
            self.View_line.transform = CGAffineTransform(translationX: 0, y: 0)
            self.Button_RESET.transform = CGAffineTransform(translationX: 0, y: 0)
            self.Button_Result_outlet.backgroundColor = self.GRAY
            self.viewResult.alpha = 1
        })
        
        UIView.animate(withDuration: 0.7, animations: {
            self.Label_result1_show.alpha = 1
            self.Label_result2_show.alpha = 1
            self.Result_1.alpha = 1
            self.Result_2.alpha = 1
            self.View_result1_line.alpha = 1
            self.View_result2_line.alpha = 1
            
            self.Label_result1_show.transform = CGAffineTransform(translationX: 0, y: 0)
            self.Label_result2_show.transform = CGAffineTransform(translationX: 0, y: 0)
            self.Result_1.transform = CGAffineTransform(translationX: 0, y: 0)
            self.Result_2.transform = CGAffineTransform(translationX: 0, y: 0)
            self.View_result1_line.transform = CGAffineTransform(translationX: 0, y: 0)
            self.View_result2_line.transform = CGAffineTransform(translationX: 0, y: 0)
        })
    }
    
    func reset() {
        BEFORE = ""
        AFTER = ""
        RESULT = 0.0
        Text_before.text = ""
        Text_after.text = ""
    }
    
    func resetColor() {
        self.Button_Result_outlet.backgroundColor = self.GRAY
    }
    
    func resetAlpha() {
        self.Label_result1_show.alpha = 0
        self.Label_result2_show.alpha = 0
        self.Result_1.alpha = 0
        self.Result_2.alpha = 0
        self.View_result1_line.alpha = 0
        self.View_result2_line.alpha = 0
        self.viewResult.alpha = 0
    }
    
    func resetTransform() {
        self.Label_result1_show.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Label_result2_show.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Result_1.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Result_2.transform = CGAffineTransform(translationX: 0, y: -10)
        self.View_result1_line.transform = CGAffineTransform(translationX: 0, y: -10)
        self.View_result2_line.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Button_RESET.transform = CGAffineTransform(translationX: 0, y: -109)
        self.View_line.transform = CGAffineTransform(translationX: 0, y: -109)
    }
}



extension Show5_2ViewController {
    
    func algoOfTextChange() {
        BEFORE = Text_before.text!
        AFTER = Text_after.text!
        if(check()) {
            UIView.animate(withDuration: 0.5, animations: {
                self.Button_Result_outlet.backgroundColor = self.BUTTON
            })
        } else {
            UIView.animate(withDuration: 0.5, animations: {
                self.Button_Result_outlet.backgroundColor = self.GRAY
            })
        }
    }
    
    func algoOfResult() {
        RESULT = 100 - (Double(AFTER)! / Double(BEFORE)! * 100)
        Result_1.text = String(format: "%.2f",RESULT) + " %"
        Result_2.text = "- " + inputComma(innum: (Int(BEFORE)!-Int(AFTER)!)) + " 원"
        
        showResultAnimation()
        self.view.endEditing(true)
    }
}
