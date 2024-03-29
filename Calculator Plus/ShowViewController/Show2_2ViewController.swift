//
//  View_1_2_ViewController.swift
//  Calculator Plus
//
//  Created by Min_MacBook Pro on 2020/03/21.
//  Copyright © 2020 FreeDeveloper. All rights reserved.
//

import UIKit

class Show2_2ViewController: UIViewController {
    
    @IBOutlet var Text_1_money: UITextField!
    @IBOutlet var Button_plus_1_outlet: UIButton!
    @IBOutlet var Text_1_num: UITextField!
    @IBOutlet var Text_2_money: UITextField!
    @IBOutlet var Button_plus_2_outlet: UIButton!
    @IBOutlet var Text_2_num: UITextField!
    @IBOutlet var Button_Result_outlet: UIButton!
    
    @IBOutlet var Label_sum1_show: UILabel!
    @IBOutlet var Text_1_sum: UILabel!
    @IBOutlet var View_sum1_line: UIView!
    
    @IBOutlet var Label_sum2_show: UILabel!
    @IBOutlet var Text_2_sum: UILabel!
    @IBOutlet var View_sum2_line: UIView!
    
    @IBOutlet var Label_Result1_show: UILabel!
    @IBOutlet var Result_1: UILabel!
    @IBOutlet var View_Result1_Line: UIView!
    
    @IBOutlet var Label_Result2_show: UILabel!
    @IBOutlet var Result_2: UILabel!
    @IBOutlet var View_Result2_Line: UIView!
    
    @IBOutlet var Label_Result3_show: UILabel!
    @IBOutlet var Result_3: UILabel!
    @IBOutlet var View_Result3_Line: UIView!
    
    @IBOutlet var Text_show: UILabel!
    @IBOutlet var Text_detail: UILabel!
    @IBOutlet var View_result4_line: UIView!
    
    @IBOutlet var View_line: UIView!
    
    @IBOutlet var Button_detail_outlet: UIButton!
    @IBOutlet var Kakao_outlet: UIButton!
    @IBOutlet var View_Buttons: UIView!
    @IBOutlet var Button_RESET: UIButton!
    
    @IBOutlet var View_View: UIView!
    @IBOutlet var viewA: UIView!
    @IBOutlet var viewB: UIView!
    @IBOutlet var viewResult: UIView!
    @IBOutlet var viewDetail: UIView!
    
    var Money_1 = ""
    var MONEY_1 = 0
    var N_1 = ""
    var Money_2 = ""
    var MONEY_2 = 0
    var N_2 = ""
    var RESULT_1 = 0
    var RESULT_2 = 0
    var kakao_print = ""
    var DETAIL_1 = ""
    var DETAIL_2 = ""
    
    var detailShow: Bool = true
    var detailCount: Int = 0
    
    let GRAY = UIColor(named: "ColorGray")
    let BUTTON = UIColor(named: "button")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboard()
        
        setColor()
        setRadius()
        setAlpha()
        setTransform()
        showViewAnimation()
        
        setNavigationButton()
        setInputType()
        setInputChanged()
    }
    
    @objc func fbButtonPressed() {
        goToCalculater()
    }
    @objc func textFieldDidChange1(textField: UITextField){
        algoOfTextChange1()
    }
    @objc func textFieldDidChange2(textField: UITextField){
        algoOfTextChange2()
    }
    @objc func textFieldDidChange3(textField: UITextField){
        algoOfTextChange3()
    }
    
    @IBAction func Button_plus_1(_ sender: UIButton) {
        Money_1 = Text_1_money.text!
        if(Money_1 != "") {
            algoOfPlus1()
        }
    }
    @IBAction func Button_plus_2(_ sender: UIButton) {
        Money_2 = Text_2_money.text!
        if(Money_2 != "") {
            algoOfPlus2()
        }
    }
    @IBAction func Button_detail(_ sender: UIButton) {
        algoOfDetail()
    }
    @IBAction func Button_Result(_ sender: UIButton) {
        if(check()) {
            algoOfResult()
        }
    }
    @IBAction func Button_kakao(_ sender: UIButton) {
        Kakao.sendData(data: kakao_print)
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



extension Show2_2ViewController {
    
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
    
    func showViewAnimation() {
        self.View_View.alpha = 0
        UIView.animate(withDuration: 0.5, animations: {
            self.View_View.alpha = 1
        })
    }
    
    func setRadius() {
        Button_plus_1_outlet.layer.cornerRadius = 4
        Button_plus_2_outlet.layer.cornerRadius = 4
        Button_Result_outlet.layer.cornerRadius = 4
        Button_detail_outlet.layer.cornerRadius = 4
        Kakao_outlet.layer.cornerRadius = 4
        viewA.layer.cornerRadius = 12
        viewB.layer.cornerRadius = 12
        viewResult.layer.cornerRadius = 12
        viewDetail.layer.cornerRadius = 12
    }
    
    func setInputType() {
        Text_1_money.keyboardType = .numberPad
        Text_1_num.keyboardType = .numberPad
        Text_2_money.keyboardType = .numberPad
        Text_2_num.keyboardType = .numberPad
    }
    
    func setAlpha() {
        self.Label_Result1_show.alpha = 0
        self.Result_1.alpha = 0
        self.View_Result1_Line.alpha = 0
        
        self.Label_Result2_show.alpha = 0
        self.Result_2.alpha = 0
        self.View_Result2_Line.alpha = 0
        
        self.Label_Result3_show.alpha = 0
        self.Result_3.alpha = 0
        self.View_Result3_Line.alpha = 0
        
        self.Text_show.alpha = 0
        self.Text_detail.alpha = 0
        self.View_result4_line.alpha = 0
        
        self.View_Buttons.alpha = 0
        self.viewResult.alpha = 0
        self.viewDetail.alpha = 0
    }
    
    func setTransform() {
        self.View_line.transform = CGAffineTransform(translationX: 0, y: -155)
        
        self.Label_Result1_show.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Result_1.transform = CGAffineTransform(translationX: 0, y: -10)
        self.View_Result1_Line.transform = CGAffineTransform(translationX: 0, y: -10)
        
        self.Label_Result2_show.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Result_2.transform = CGAffineTransform(translationX: 0, y: -10)
        self.View_Result2_Line.transform = CGAffineTransform(translationX: 0, y: -10)
        
        self.Label_Result3_show.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Result_3.transform = CGAffineTransform(translationX: 0, y: -10)
        self.View_Result3_Line.transform = CGAffineTransform(translationX: 0, y: -10)
        
        self.Text_show.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Text_detail.transform = CGAffineTransform(translationX: 0, y: -10)
        self.View_result4_line.transform = CGAffineTransform(translationX: 0, y: -10)
        
        self.View_Buttons.transform = CGAffineTransform(translationX: 0, y: -80)
        self.Button_RESET.transform = CGAffineTransform(translationX: 0, y: -230)
    }
    
    func setColor() {
        self.Button_plus_1_outlet.backgroundColor = self.GRAY
        self.Button_plus_2_outlet.backgroundColor = self.GRAY
        self.Button_Result_outlet.backgroundColor = self.GRAY
        
        self.Label_sum1_show.textColor = self.GRAY
        self.Text_1_sum.textColor = self.GRAY
        self.View_sum1_line.backgroundColor = self.GRAY
        
        self.Label_sum2_show.textColor = self.GRAY
        self.Text_2_sum.textColor = self.GRAY
        self.View_sum2_line.backgroundColor = self.GRAY
    }
    
    func setInputChanged() {
        Text_1_money.addTarget(self, action: #selector(textFieldDidChange1(textField:)),
            for: UIControl.Event.editingChanged)
        Text_2_money.addTarget(self, action: #selector(textFieldDidChange2(textField:)),
            for: UIControl.Event.editingChanged)
        Text_2_num.addTarget(self, action: #selector(textFieldDidChange3(textField:)),
            for: UIControl.Event.editingChanged)
    }
    
    func showPlus1Animation() {
        UIView.animate(withDuration: 0.5, animations: {
            self.Label_sum1_show.textColor = self.BUTTON
            self.Text_1_sum.textColor = self.BUTTON
            self.View_sum1_line.backgroundColor = self.BUTTON
            self.Button_plus_1_outlet.backgroundColor = self.GRAY
        })
    }
    
    func showPlus2Animation() {
        UIView.animate(withDuration: 0.5, animations: {
            self.Label_sum2_show.textColor = self.BUTTON
            self.Text_2_sum.textColor = self.BUTTON
            self.View_sum2_line.backgroundColor = self.BUTTON
            self.Button_plus_2_outlet.backgroundColor = self.GRAY
        })
    }
    
    func showResultButtonAnimation() {
        if(check()) {
            UIView.animate(withDuration: 0.5, animations: {
                self.Button_Result_outlet.backgroundColor = self.BUTTON
            })
        }
    }
    
    func check() -> Bool
    {
        if Text_1_sum.text == "원" {
            return false
        } else if N_1 == "" {
            return false
        } else if Text_2_sum.text == "원" {
            return false
        } else if N_2 == "" {
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
    
    func reset() {
        Money_1 = ""
        MONEY_1 = 0
        N_1 = ""
        Money_2 = ""
        MONEY_2 = 0
        N_2 = ""
        RESULT_1 = 0
        RESULT_2 = 0
        kakao_print = ""
        DETAIL_1 = ""
        DETAIL_2 = ""
        Text_1_money.text = ""
        Text_1_num.text = ""
        Text_1_sum.text = "원"
        Text_2_money.text = ""
        Text_2_num.text = ""
        Text_2_sum.text = "원"
        Result_3.text = ""
        Text_detail.text = ""
        detailShow = true
        detailCount = 0
    }
    
    func resetColor() {
        self.Button_plus_1_outlet.backgroundColor = self.GRAY
        self.Button_plus_2_outlet.backgroundColor = self.GRAY
        self.Button_Result_outlet.backgroundColor = self.GRAY
        
        self.Label_sum1_show.textColor = self.GRAY
        self.Text_1_sum.textColor = self.GRAY
        self.View_sum1_line.backgroundColor = self.GRAY
        
        self.Label_sum2_show.textColor = self.GRAY
        self.Text_2_sum.textColor = self.GRAY
        self.View_sum2_line.backgroundColor = self.GRAY
    }
    
    func resetAlpha() {
        self.Label_Result1_show.alpha = 0
        self.Result_1.alpha = 0
        self.View_Result1_Line.alpha = 0
        
        self.Label_Result2_show.alpha = 0
        self.Result_2.alpha = 0
        self.View_Result2_Line.alpha = 0
        
        self.Label_Result3_show.alpha = 0
        self.Result_3.alpha = 0
        self.View_Result3_Line.alpha = 0
        
        self.Text_show.alpha = 0
        self.Text_detail.alpha = 0
        self.View_result4_line.alpha = 0
        
        self.View_Buttons.alpha = 0
        self.viewResult.alpha = 0
        self.viewDetail.alpha = 0
    }
    
    func resetTransform() {
        self.View_line.transform = CGAffineTransform(translationX: 0, y: -155)
        
        self.Label_Result1_show.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Result_1.transform = CGAffineTransform(translationX: 0, y: -10)
        self.View_Result1_Line.transform = CGAffineTransform(translationX: 0, y: -10)
        
        self.Label_Result2_show.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Result_2.transform = CGAffineTransform(translationX: 0, y: -10)
        self.View_Result2_Line.transform = CGAffineTransform(translationX: 0, y: -10)
        
        self.Label_Result3_show.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Result_3.transform = CGAffineTransform(translationX: 0, y: -10)
        self.View_Result3_Line.transform = CGAffineTransform(translationX: 0, y: -10)
        
        self.Text_show.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Text_detail.transform = CGAffineTransform(translationX: 0, y: -10)
        self.View_result4_line.transform = CGAffineTransform(translationX: 0, y: -10)
        
        self.View_Buttons.transform = CGAffineTransform(translationX: 0, y: -80)
        self.Button_RESET.transform = CGAffineTransform(translationX: 0, y: -230)
    }
    
    func showDetailAnimation() {
        UIView.animate(withDuration: 0.5, animations: {
            self.View_Buttons.transform = CGAffineTransform(translationX: 0, y: 0)
            self.Button_RESET.transform = CGAffineTransform(translationX: 0, y: 0)
            self.viewDetail.alpha = 1
        })
        
        UIView.animate(withDuration: 0.7, animations: {
            self.Text_show.alpha = 1
            self.Text_show.transform = CGAffineTransform(translationX: 0, y: 0)
            self.Text_detail.alpha = 1
            self.Text_detail.transform = CGAffineTransform(translationX: 0, y: 0)
            self.View_result4_line.alpha = 1
            self.View_result4_line.transform = CGAffineTransform(translationX: 0, y: 0)
        })
    }
    
    func dismissDetailAnimation() {
        UIView.animate(withDuration: 0.5, animations: {
            self.View_Buttons.transform = CGAffineTransform(translationX: 0, y: -70)
            self.Button_RESET.transform = CGAffineTransform(translationX: 0, y: -70)
            self.viewDetail.alpha = 0
        })
        
        UIView.animate(withDuration: 0.5, animations: {
            self.Text_show.alpha = 0
            self.Text_show.transform = CGAffineTransform(translationX: 0, y: 0)
            self.Text_detail.alpha = 0
            self.Text_detail.transform = CGAffineTransform(translationX: 0, y: 0)
            self.View_result4_line.alpha = 0
            self.View_result4_line.transform = CGAffineTransform(translationX: 0, y: 0)
        })
    }
    
    func showResultAnimation() {
        UIView.animate(withDuration: 0.5, animations: {
            self.View_line.transform = CGAffineTransform(translationX: 0, y: 0)
            self.Button_RESET.transform = CGAffineTransform(translationX: 0, y: -70)
            self.Button_Result_outlet.backgroundColor = self.GRAY
            self.viewResult.alpha = 1
        })
        
        UIView.animate(withDuration: 0.7, animations: {
            self.Label_Result1_show.alpha = 1
            self.Label_Result1_show.transform = CGAffineTransform(translationX: 0, y: 0)
            self.Result_1.alpha = 1
            self.Result_1.transform = CGAffineTransform(translationX: 0, y: 0)
            self.View_Result1_Line.alpha = 1
            self.View_Result1_Line.transform = CGAffineTransform(translationX: 0, y: 0)
            
            self.Label_Result2_show.alpha = 1
            self.Label_Result2_show.transform = CGAffineTransform(translationX: 0, y: 0)
            self.Result_2.alpha = 1
            self.Result_2.transform = CGAffineTransform(translationX: 0, y: 0)
            self.View_Result2_Line.alpha = 1
            self.View_Result2_Line.transform = CGAffineTransform(translationX: 0, y: 0)
            
            self.Label_Result3_show.alpha = 1
            self.Label_Result3_show.transform = CGAffineTransform(translationX: 0, y: 0)
            self.Result_3.alpha = 1
            self.Result_3.transform = CGAffineTransform(translationX: 0, y: 0)
            self.View_Result3_Line.alpha = 1
            self.View_Result3_Line.transform = CGAffineTransform(translationX: 0, y: 0)
            
            self.View_Buttons.alpha = 1
            self.View_Buttons.transform = CGAffineTransform(translationX: 0, y: -70)
            
            self.Text_show.alpha = 0
            self.Text_show.transform = CGAffineTransform(translationX: 0, y: -10)
            self.Text_detail.alpha = 0
            self.Text_detail.transform = CGAffineTransform(translationX: 0, y: -10)
            self.View_result4_line.alpha = 0
            self.View_result4_line.transform = CGAffineTransform(translationX: 0, y: -10)
        })
    }
}



extension Show2_2ViewController {
    
    func algoOfTextChange1() {
        if(Text_1_money.text != "") {
            UIView.animate(withDuration: 0.5, animations: {
                self.Button_plus_1_outlet.backgroundColor = self.BUTTON
            })
        } else {
            UIView.animate(withDuration: 0.5, animations: {
                self.Button_plus_1_outlet.backgroundColor = self.GRAY
            })
        }
    }
    
    func algoOfTextChange2() {
        if(Text_2_money.text != "") {
            UIView.animate(withDuration: 0.5, animations: {
                self.Button_plus_2_outlet.backgroundColor = self.BUTTON
            })
        } else {
            UIView.animate(withDuration: 0.5, animations: {
                self.Button_plus_2_outlet.backgroundColor = self.GRAY
            })
        }
    }
    
    func algoOfTextChange3() {
        N_1 = Text_1_num.text!
        N_2 = Text_2_num.text!
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
    
    func algoOfPlus1() {
        kakao_print = ""
        detailCount = 0
        detailShow = true
        
        MONEY_1 += Int(Money_1)!
        Text_1_money.text = ""
        Text_1_sum.text = inputComma(innum: MONEY_1) + " 원"
        
        if(DETAIL_1 == "") {
            DETAIL_1 = inputComma(innum: Int(Money_1)!) + " 원"
        } else if (DETAIL_1 != "") {
            DETAIL_1 += "\n" + inputComma(innum: Int(Money_1)!) + " 원"
        }
        
        showPlus1Animation()
        showResultButtonAnimation()
    }
    
    func algoOfPlus2() {
        kakao_print = ""
        detailCount = 0
        detailShow = true
        
        MONEY_2 += Int(Money_2)!
        Text_2_money.text = ""
        Text_2_sum.text = inputComma(innum: MONEY_2) + " 원"
        
        if(DETAIL_2 == "") {
            DETAIL_2 = inputComma(innum: Int(Money_2)!) + " 원"
        } else if (DETAIL_2 != "") {
            DETAIL_2 += "\n" + inputComma(innum: Int(Money_2)!) + " 원"
        }
        
        showPlus2Animation()
        showResultButtonAnimation()
    }
    
    func algoOfResult() {
        kakao_print = "따로 더치페이"
        kakao_print += "\n\n더치페이1 총액 : " + inputComma(innum: MONEY_1) + " 원"
        kakao_print += "\n더치페이1 인원수 : " + N_1 + " 명"
        RESULT_1 = MONEY_1 / Int(N_1)!
        kakao_print += "\n더치페이1 결과 : " + inputComma(innum: RESULT_1) + " 원"
        Result_1.text = inputComma(innum: RESULT_1) + " 원"
        
        kakao_print += "\n\n더치페이2 총액 : " + inputComma(innum: MONEY_2) + " 원"
        kakao_print += "\n더치페이2 인원수 : " + N_2 + " 명"
        RESULT_2 = MONEY_2 / Int(N_2)!
        kakao_print += "\n더치페이2 결과 : " + inputComma(innum: RESULT_2) + " 원"
        Result_2.text = inputComma(innum: RESULT_2) + " 원"
        
        kakao_print += "\n\n둘다해당인원 : " + inputComma(innum: (RESULT_1+RESULT_2)) + " 원"
        Result_3.text = inputComma(innum: (RESULT_1+RESULT_2)) + " 원"
        
        showResultAnimation()
        self.view.endEditing(true)
    }
    
    func algoOfDetail() {
        if RESULT_1 != 0 {
            Text_detail.text = DETAIL_1 + "\n--------\n" + DETAIL_2
        }
        if(detailShow == true) {
            showDetailAnimation()
            detailShow = false
        } else {
            dismissDetailAnimation()
            detailShow = true
        }
    }
}
