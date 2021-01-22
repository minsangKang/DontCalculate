//
//  View_2_4_ViewController.swift
//  Calculator Plus
//
//  Created by Min_MacBook Pro on 2020/03/13.
//  Copyright © 2020 FreeDeveloper. All rights reserved.
//

import UIKit

class Show3_4ViewController: UIViewController {
    
    @IBOutlet var Text_name_a: UITextField!
    @IBOutlet var Text_name_b: UITextField!
    @IBOutlet var Text_name_c: UITextField!
    @IBOutlet var Text_name_d: UITextField!
    @IBOutlet var Text_name_e: UITextField!
    
    @IBOutlet var Text_A: UITextField!
    @IBOutlet var Text_B: UITextField!
    @IBOutlet var Text_C: UITextField!
    @IBOutlet var Text_D: UITextField!
    @IBOutlet var Text_E: UITextField!
    
    //animation
    @IBOutlet var Button_plus_a: UIButton!
    @IBOutlet var Button_plus_b: UIButton!
    @IBOutlet var Button_plus_c: UIButton!
    @IBOutlet var Button_plus_d: UIButton!
    @IBOutlet var Button_plus_e: UIButton!
    
    @IBOutlet weak var Label_sum1_show: UILabel!
    @IBOutlet weak var Label_sum2_show: UILabel!
    @IBOutlet weak var Label_sum3_show: UILabel!
    @IBOutlet weak var Label_sum4_show: UILabel!
    @IBOutlet weak var Label_sum5_show: UILabel!
    
    @IBOutlet var Text_sum_a: UILabel!
    @IBOutlet var Text_sum_b: UILabel!
    @IBOutlet var Text_sum_c: UILabel!
    @IBOutlet var Text_sum_d: UILabel!
    @IBOutlet var Text_sum_e: UILabel!
    
    @IBOutlet weak var View_sum1_line: UIView!
    @IBOutlet weak var View_sum2_line: UIView!
    @IBOutlet weak var View_sum3_line: UIView!
    @IBOutlet weak var View_sum4_line: UIView!
    @IBOutlet weak var View_sum5_line: UIView!
    
    @IBOutlet weak var Label_result1_show: UILabel!
    @IBOutlet weak var Label_result2_show: UILabel!
    @IBOutlet weak var Label_result3_show: UILabel!
    
    @IBOutlet var Result_1: UILabel!
    @IBOutlet var Result_2: UILabel!
    @IBOutlet var Result_3: UILabel!
    
    @IBOutlet weak var View_result1_line: UIView!
    @IBOutlet weak var View_result2_line: UIView!
    @IBOutlet weak var View_result3_line: UIView!
    
    @IBOutlet weak var View_line: UIView!
    @IBOutlet var Button_Result_outlet: UIButton!
    @IBOutlet var Kakao_outlet: UIButton!
    @IBOutlet weak var Button_RESET: UIButton!
    
    @IBOutlet weak var View_View: UIView!
    
    @IBOutlet weak var View_dottedline_1: UIView!
    @IBOutlet weak var View_dottedline_2: UIView!
    @IBOutlet weak var View_dottedline_3: UIView!
    @IBOutlet weak var View_dottedline_4: UIView!
    
    
    
    
    
    var A = ""
    var B = ""
    var C = ""
    var D = ""
    var E = ""
    var SUM = 0
    var DIV = 0
    var RESULT_A = 0
    var RESULT_B = 0
    var RESULT_C = 0
    var RESULT_D = 0
    var RESULT_E = 0
    var Print = ""
    var kakao_print = ""
    var State = 0
    var array_before: [Int] = []
    var array_after: [Int] = []
    var ONE = ""
    var TWO = ""
    var THREE = ""
    var FOUR = ""
    var FIVE = ""
    
    var A_sum = 0
    var B_sum = 0
    var C_sum = 0
    var D_sum = 0
    var E_sum = 0
    var A_name = "A"
    var B_name = "B"
    var C_name = "C"
    var D_name = "D"
    var E_name = "E"
    
    let GRAY = UIColor(named: "ColorGray")
    let BUTTON = UIColor(named: "button")
    
    override func viewDidLoad() {
        
        self.View_View.alpha = 0
        UIView.animate(withDuration: 0.5, animations: {
            self.View_View.alpha = 1
        })
        
        Button_plus_a.layer.cornerRadius = 4
        Button_plus_b.layer.cornerRadius = 4
        Button_plus_c.layer.cornerRadius = 4
        Button_plus_d.layer.cornerRadius = 4
        Button_plus_e.layer.cornerRadius = 4
        Button_Result_outlet.layer.cornerRadius = 4
        Kakao_outlet.layer.cornerRadius = 4
        
        Text_A.keyboardType = .numberPad
        Text_B.keyboardType = .numberPad
        Text_C.keyboardType = .numberPad
        Text_D.keyboardType = .numberPad
        Text_E.keyboardType = .numberPad
        
        self.hideKeyboard()
        super.viewDidLoad()
        
        //animation
        self.Label_result1_show.alpha = 0
        self.Label_result2_show.alpha = 0
        self.Label_result3_show.alpha = 0
        self.Result_1.alpha = 0
        self.Result_2.alpha = 0
        self.Result_3.alpha = 0
        self.View_result1_line.alpha = 0
        self.View_result2_line.alpha = 0
        self.View_result3_line.alpha = 0
        self.Kakao_outlet.alpha = 0
        
        self.Label_result1_show.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Label_result2_show.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Label_result3_show.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Result_1.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Result_2.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Result_3.transform = CGAffineTransform(translationX: 0, y: -10)
        self.View_result1_line.transform = CGAffineTransform(translationX: 0, y: -10)
        self.View_result2_line.transform = CGAffineTransform(translationX: 0, y: -10)
        self.View_result3_line.transform = CGAffineTransform(translationX: 0, y: -10)
        self.View_line.transform = CGAffineTransform(translationX: 0, y: -155)
        self.Kakao_outlet.transform = CGAffineTransform(translationX: 0, y: -10)
        self.Button_RESET.transform = CGAffineTransform(translationX: 0, y: -200)
        //color
        self.Button_plus_a.backgroundColor = self.GRAY
        self.Button_plus_b.backgroundColor = self.GRAY
        self.Button_plus_c.backgroundColor = self.GRAY
        self.Button_plus_d.backgroundColor = self.GRAY
        self.Button_plus_e.backgroundColor = self.GRAY
        self.Label_sum1_show.textColor = self.GRAY
        self.Label_sum2_show.textColor = self.GRAY
        self.Label_sum3_show.textColor = self.GRAY
        self.Label_sum4_show.textColor = self.GRAY
        self.Label_sum5_show.textColor = self.GRAY
        self.Text_sum_a.textColor = self.GRAY
        self.Text_sum_b.textColor = self.GRAY
        self.Text_sum_c.textColor = self.GRAY
        self.Text_sum_d.textColor = self.GRAY
        self.Text_sum_e.textColor = self.GRAY
        self.View_sum1_line.backgroundColor = self.GRAY
        self.View_sum2_line.backgroundColor = self.GRAY
        self.View_sum3_line.backgroundColor = self.GRAY
        self.View_sum4_line.backgroundColor = self.GRAY
        self.View_sum5_line.backgroundColor = self.GRAY
        self.Button_Result_outlet.backgroundColor = self.GRAY
        //action
        Text_A.addTarget(self, action: #selector(textFieldDidChange1(textField:)), for: UIControl.Event.editingChanged)
        Text_B.addTarget(self, action: #selector(textFieldDidChange2(textField:)), for: UIControl.Event.editingChanged)
        Text_C.addTarget(self, action: #selector(textFieldDidChange3(textField:)), for: UIControl.Event.editingChanged)
        Text_D.addTarget(self, action: #selector(textFieldDidChange4(textField:)), for: UIControl.Event.editingChanged)
        Text_E.addTarget(self, action: #selector(textFieldDidChange5(textField:)), for: UIControl.Event.editingChanged)
        
        View_dottedline_1.backgroundColor = UIColor.clear
        View_dottedline_2.backgroundColor = UIColor.clear
        View_dottedline_3.backgroundColor = UIColor.clear
        View_dottedline_4.backgroundColor = UIColor.clear
        View_dottedline_1.addDashedBorder()
        View_dottedline_2.addDashedBorder()
        View_dottedline_3.addDashedBorder()
        View_dottedline_4.addDashedBorder()
        
        //우측상단버튼 생성
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "icon_bar"), for: .normal)
        button.addTarget(self, action: #selector(fbButtonPressed), for: .touchUpInside)
        button.frame = CGRect(x: 0, y: 0, width: 43, height: 51)
        let barButton = UIBarButtonItem(customView: button)
        self.navigationItem.rightBarButtonItem = barButton
    }
    //This method will call when you press button.
    @objc func fbButtonPressed() {
        performSegue(withIdentifier: "showNomal", sender: self)
    }
    
    @objc func textFieldDidChange1(textField: UITextField){
        if(Text_A.text != "")
        {
            UIView.animate(withDuration: 0.5, animations: {
                self.Button_plus_a.backgroundColor = self.BUTTON
            })
        }
        else
        {
            UIView.animate(withDuration: 0.5, animations: {
                self.Button_plus_a.backgroundColor = self.GRAY
            })
        }
    }
    
    @objc func textFieldDidChange2(textField: UITextField){
        if(Text_B.text != "")
        {
            UIView.animate(withDuration: 0.5, animations: {
                self.Button_plus_b.backgroundColor = self.BUTTON
            })
        }
        else
        {
            UIView.animate(withDuration: 0.5, animations: {
                self.Button_plus_b.backgroundColor = self.GRAY
            })
        }
    }
    
    @objc func textFieldDidChange3(textField: UITextField){
        if(Text_C.text != "")
        {
            UIView.animate(withDuration: 0.5, animations: {
                self.Button_plus_c.backgroundColor = self.BUTTON
            })
        }
        else
        {
            UIView.animate(withDuration: 0.5, animations: {
                self.Button_plus_c.backgroundColor = self.GRAY
            })
        }
    }
    
    @objc func textFieldDidChange4(textField: UITextField){
        if(Text_D.text != "")
        {
            UIView.animate(withDuration: 0.5, animations: {
                self.Button_plus_d.backgroundColor = self.BUTTON
            })
        }
        else
        {
            UIView.animate(withDuration: 0.5, animations: {
                self.Button_plus_d.backgroundColor = self.GRAY
            })
        }
    }
    
    @objc func textFieldDidChange5(textField: UITextField){
        if(Text_E.text != "")
        {
            UIView.animate(withDuration: 0.5, animations: {
                self.Button_plus_e.backgroundColor = self.BUTTON
            })
        }
        else
        {
            UIView.animate(withDuration: 0.5, animations: {
                self.Button_plus_e.backgroundColor = self.GRAY
            })
        }
    }
    
    @IBAction func Button_plus_a(_ sender: UIButton) {
        A = Text_A.text!
        if(A != "")
        {
            A_sum += Int(A)!
            Text_sum_a.text = inputComma(innum: A_sum) + " 원"
            Text_A.text = ""
            
            UIView.animate(withDuration: 0.5, animations: {
                self.Label_sum1_show.textColor = self.BUTTON
                self.Text_sum_a.textColor = self.BUTTON
                self.View_sum1_line.backgroundColor = self.BUTTON
                self.Button_plus_a.backgroundColor = self.GRAY
            })
            
            if(check())
            {
                UIView.animate(withDuration: 0.5, animations: {
                    self.Button_Result_outlet.backgroundColor = self.BUTTON
                })
            }
            self.view.endEditing(true)
        }
    }
    @IBAction func Button_plus_b(_ sender: UIButton) {
        B = Text_B.text!
        if(B != "")
        {
            B_sum += Int(B)!
            Text_sum_b.text = inputComma(innum: B_sum) + " 원"
            Text_B.text = ""
            
            UIView.animate(withDuration: 0.5, animations: {
                self.Label_sum2_show.textColor = self.BUTTON
                self.Text_sum_b.textColor = self.BUTTON
                self.View_sum2_line.backgroundColor = self.BUTTON
                self.Button_plus_b.backgroundColor = self.GRAY
            })
            
            if(check())
            {
                UIView.animate(withDuration: 0.5, animations: {
                    self.Button_Result_outlet.backgroundColor = self.BUTTON
                })
            }
            self.view.endEditing(true)
        }
    }
    @IBAction func Button_plus_c(_ sender: UIButton) {
        C = Text_C.text!
        if(C != "")
        {
            C_sum += Int(C)!
            Text_sum_c.text = inputComma(innum: C_sum) + " 원"
            Text_C.text = ""
            
            UIView.animate(withDuration: 0.5, animations: {
                self.Label_sum3_show.textColor = self.BUTTON
                self.Text_sum_c.textColor = self.BUTTON
                self.View_sum3_line.backgroundColor = self.BUTTON
                self.Button_plus_c.backgroundColor = self.GRAY
            })
            
            if(check())
            {
                UIView.animate(withDuration: 0.5, animations: {
                    self.Button_Result_outlet.backgroundColor = self.BUTTON
                })
            }
            self.view.endEditing(true)
        }
    }
    @IBAction func Button_plus_d(_ sender: UIButton) {
        D = Text_D.text!
        if(D != "")
        {
            D_sum += Int(D)!
            Text_sum_d.text = inputComma(innum: D_sum) + " 원"
            Text_D.text = ""
            
            UIView.animate(withDuration: 0.5, animations: {
                self.Label_sum4_show.textColor = self.BUTTON
                self.Text_sum_d.textColor = self.BUTTON
                self.View_sum4_line.backgroundColor = self.BUTTON
                self.Button_plus_d.backgroundColor = self.GRAY
            })
            
            if(check())
            {
                UIView.animate(withDuration: 0.5, animations: {
                    self.Button_Result_outlet.backgroundColor = self.BUTTON
                })
            }
            self.view.endEditing(true)
        }
    }
    @IBAction func Button_plus_e(_ sender: UIButton) {
        E = Text_E.text!
        if(E != "")
        {
            E_sum += Int(E)!
            Text_sum_e.text = inputComma(innum: E_sum) + " 원"
            Text_E.text = ""
            
            UIView.animate(withDuration: 0.5, animations: {
                self.Label_sum5_show.textColor = self.BUTTON
                self.Text_sum_e.textColor = self.BUTTON
                self.View_sum5_line.backgroundColor = self.BUTTON
                self.Button_plus_e.backgroundColor = self.GRAY
            })
            
            if(check())
            {
                UIView.animate(withDuration: 0.5, animations: {
                    self.Button_Result_outlet.backgroundColor = self.BUTTON
                })
            }
            self.view.endEditing(true)
        }
    }
    
    
    
    
    @IBAction func Button_Result(_ sender: UIButton) {
        if(check())
        {
            if Text_name_a.text != ""
            {
                A_name = Text_name_a.text!
            }
            if Text_name_b.text != ""
            {
                B_name = Text_name_b.text!
            }
            if Text_name_c.text != ""
            {
                C_name = Text_name_c.text!
            }
            if Text_name_d.text != ""
            {
                D_name = Text_name_d.text!
            }
            if Text_name_e.text != ""
            {
                E_name = Text_name_e.text!
            }
            //ver1.1 수정
            kakao_print = A_name + " : " + inputComma(innum: A_sum) + " 원"
            kakao_print += "\n" + B_name + " : " + inputComma(innum: B_sum) + " 원"
            kakao_print += "\n" + C_name + " : " + inputComma(innum: C_sum) + " 원"
            kakao_print += "\n" + D_name + " : " + inputComma(innum: D_sum) + " 원"
            kakao_print += "\n" + E_name + " : " + inputComma(innum: E_sum) + " 원"
            
            SUM = A_sum + B_sum + C_sum + D_sum + E_sum
            DIV = SUM / 5
            RESULT_A = A_sum - DIV
            RESULT_B = B_sum - DIV
            RESULT_C = C_sum - DIV
            RESULT_D = D_sum - DIV
            RESULT_E = E_sum - DIV
            
            kakao_print += "\n\n총 사용금액 : " + inputComma(innum: SUM) + " 원"
            Result_1.text = inputComma(innum: SUM) + " 원"
            kakao_print += "\n더치페이금액 : " + inputComma(innum: DIV) + " 원"
            Result_2.text = inputComma(innum: DIV) + " 원"
            
            bubble()
            kakao_print += "\n\n정산결과\n"
            kakao_print += Print
            Result_3.text = Print
            array_before = []
            array_after = []
            State = 0
            
            UIView.animate(withDuration: 0.5, animations: {
                self.View_line.transform = CGAffineTransform(translationX: 0, y: 0)
                self.Button_RESET.transform = CGAffineTransform(translationX: 0, y: 0)
                self.Button_Result_outlet.backgroundColor = self.GRAY
            })
            
            UIView.animate(withDuration: 0.7, animations: {
                self.Label_result1_show.alpha = 1
                self.Label_result1_show.transform = CGAffineTransform(translationX: 0, y: 0)
                self.Result_1.alpha = 1
                self.Result_1.transform = CGAffineTransform(translationX: 0, y: 0)
                self.View_result1_line.alpha = 1
                self.View_result1_line.transform = CGAffineTransform(translationX: 0, y: 0)
                
                self.Label_result2_show.alpha = 1
                self.Label_result2_show.transform = CGAffineTransform(translationX: 0, y: 0)
                self.Result_2.alpha = 1
                self.Result_2.transform = CGAffineTransform(translationX: 0, y: 0)
                self.View_result2_line.alpha = 1
                self.View_result2_line.transform = CGAffineTransform(translationX: 0, y: 0)
                
                self.Label_result3_show.alpha = 1
                self.Label_result3_show.transform = CGAffineTransform(translationX: 0, y: 0)
                self.Result_3.alpha = 1
                self.Result_3.transform = CGAffineTransform(translationX: 0, y: 0)
                self.View_result3_line.alpha = 1
                self.View_result3_line.transform = CGAffineTransform(translationX: 0, y: 0)
                
                self.Kakao_outlet.alpha = 1
                self.Kakao_outlet.transform = CGAffineTransform(translationX: 0, y: 0)
            })
        }
    }
    
    
    @IBAction func Button_kakao(_ sender: UIButton) {
        if kakao_print != ""
        {
            
            let template = KMTTextTemplate { (KMTTextTemplateBuilder) in
                KMTTextTemplateBuilder.text = self.kakao_print
                //KMTTextTemplateBuilder.buttonTitle = "Title"
                KMTTextTemplateBuilder.link = KMTLinkObject(builderBlock: { (linkBuilder) in
                    linkBuilder.mobileWebURL = URL(string: "https://developers.kakao.com")
                })
            }
            
            // 서버에서 콜백으로 받을 정보
            let serverCallbackArgs = ["user_id": "FDEE",
                                      "product_id": "415849"]
            
            // 카카오링크 실행
            KLKTalkLinkCenter.shared().sendDefault(with: template, serverCallbackArgs: serverCallbackArgs, success: { (warningMsg, argumentMsg) in
                
                // 성공
                print("warning message: \(String(describing: warningMsg))")
                print("argument message: \(String(describing: argumentMsg))")
                
            }, failure: { (error) in
                
                // 실패
                UIAlertController.showMessage(error.localizedDescription)
                print("error \(error)")
            })
        }
    }
    
    @IBAction func Button_reset(_ sender: UIButton) {
        A = ""
        B = ""
        C = ""
        D = ""
        E = ""
        SUM = 0
        DIV = 0
        RESULT_A = 0
        RESULT_B = 0
        RESULT_C = 0
        RESULT_D = 0
        RESULT_E = 0
        Print = ""
        kakao_print = ""
        State = 0
        array_before = []
        array_after = []
        ONE = ""
        TWO = ""
        THREE = ""
        FOUR = ""
        FIVE = ""
        A_sum = 0
        B_sum = 0
        C_sum = 0
        D_sum = 0
        E_sum = 0
        A_name = "A"
        B_name = "B"
        C_name = "C"
        D_name = "D"
        E_name = "E"
        Text_A.text = ""
        Text_B.text = ""
        Text_C.text = ""
        Text_D.text = ""
        Text_E.text = ""
        Text_sum_a.text = "원"
        Text_sum_b.text = "원"
        Text_sum_c.text = "원"
        Text_sum_d.text = "원"
        Text_sum_e.text = "원"
//        Result_1.text = ""
//        Result_2.text = ""
        Result_3.text = ""
        Text_name_a.text = ""
        Text_name_b.text = ""
        Text_name_c.text = ""
        Text_name_d.text = ""
        Text_name_e.text = ""
        
        UIView.animate(withDuration: 0.5, animations: {
            //animation
            self.Label_result1_show.alpha = 0
            self.Label_result2_show.alpha = 0
            self.Label_result3_show.alpha = 0
            self.Result_1.alpha = 0
            self.Result_2.alpha = 0
            self.Result_3.alpha = 0
            self.View_result1_line.alpha = 0
            self.View_result2_line.alpha = 0
            self.View_result3_line.alpha = 0
            self.Kakao_outlet.alpha = 0
            
            self.Label_result1_show.transform = CGAffineTransform(translationX: 0, y: -10)
            self.Label_result2_show.transform = CGAffineTransform(translationX: 0, y: -10)
            self.Label_result3_show.transform = CGAffineTransform(translationX: 0, y: -10)
            self.Result_1.transform = CGAffineTransform(translationX: 0, y: -10)
            self.Result_2.transform = CGAffineTransform(translationX: 0, y: -10)
            self.Result_3.transform = CGAffineTransform(translationX: 0, y: -10)
            self.View_result1_line.transform = CGAffineTransform(translationX: 0, y: -10)
            self.View_result2_line.transform = CGAffineTransform(translationX: 0, y: -10)
            self.View_result3_line.transform = CGAffineTransform(translationX: 0, y: -10)
            self.View_line.transform = CGAffineTransform(translationX: 0, y: -155)
            self.Kakao_outlet.transform = CGAffineTransform(translationX: 0, y: -10)
            self.Button_RESET.transform = CGAffineTransform(translationX: 0, y: -200)
            //color
            self.Button_plus_a.backgroundColor = self.GRAY
            self.Button_plus_b.backgroundColor = self.GRAY
            self.Button_plus_c.backgroundColor = self.GRAY
            self.Button_plus_d.backgroundColor = self.GRAY
            self.Button_plus_e.backgroundColor = self.GRAY
            self.Label_sum1_show.textColor = self.GRAY
            self.Label_sum2_show.textColor = self.GRAY
            self.Label_sum3_show.textColor = self.GRAY
            self.Label_sum4_show.textColor = self.GRAY
            self.Label_sum5_show.textColor = self.GRAY
            self.Text_sum_a.textColor = self.GRAY
            self.Text_sum_b.textColor = self.GRAY
            self.Text_sum_c.textColor = self.GRAY
            self.Text_sum_d.textColor = self.GRAY
            self.Text_sum_e.textColor = self.GRAY
            self.View_sum1_line.backgroundColor = self.GRAY
            self.View_sum2_line.backgroundColor = self.GRAY
            self.View_sum3_line.backgroundColor = self.GRAY
            self.View_sum4_line.backgroundColor = self.GRAY
            self.View_sum5_line.backgroundColor = self.GRAY
            self.Button_Result_outlet.backgroundColor = self.GRAY
        })
    }
    
    func check() -> Bool
    {
        if(A_sum != 0)
        {
            return true
        }
        if(B_sum != 0)
        {
            return true
        }
        if(C_sum != 0)
        {
            return true
        }
        if(D_sum != 0)
        {
            return true
        }
        if(E_sum != 0)
        {
            return true
        }
        return false
    }
    
    func bubble()
    {
        if RESULT_A > 0
        {
            State+=1
        }
        if RESULT_B > 0
        {
            State+=1
        }
        if RESULT_C > 0
        {
            State+=1
        }
        if RESULT_D > 0
        {
            State+=1
        }
        if RESULT_E > 0
        {
            State+=1
        }
        
        switch State {
        case 1:
            case1()
        case 2:
            case2()
        case 3:
            case3()
        case 4:
            case4()
        default:
            Print = "Error"
        }
    }
    
    func case1()
    {
        //나머지 네명이 한명한테 송금한다
        if RESULT_A > 0
        {
            if RESULT_B != 0
            {
                Print = B_name + " → " + A_name + " " + inputComma(innum: (-RESULT_B)) + " 원 송금\n"
            }
            if RESULT_C != 0
            {
                Print += C_name + " → " + A_name + " " + inputComma(innum: (-RESULT_C)) + " 원 송금\n"
            }
            if RESULT_D != 0
            {
                Print += D_name + " → " + A_name + " " + inputComma(innum: (-RESULT_D)) + " 원 송금\n"
            }
            if RESULT_E != 0
            {
                Print += E_name + " → " + A_name + " " + inputComma(innum: (-RESULT_E)) + " 원 송금"
            }
        }
        else if RESULT_B > 0
        {
            if RESULT_A != 0
            {
                Print = A_name + " → " + B_name + " " + inputComma(innum: (-RESULT_A)) + " 원 송금\n"
            }
            if RESULT_C != 0
            {
                Print += C_name + " → " + B_name + " " + inputComma(innum: (-RESULT_C)) + " 원 송금\n"
            }
            if RESULT_D != 0
            {
                Print += D_name + " → " + B_name + " " + inputComma(innum: (-RESULT_D)) + " 원 송금\n"
            }
            if RESULT_E != 0
            {
                Print += E_name + " → " + B_name + " " + inputComma(innum: (-RESULT_E)) + " 원 송금"
            }
        }
        else if RESULT_C > 0
        {
            if RESULT_A != 0
            {
                Print = A_name + " → " + C_name + " " + inputComma(innum: (-RESULT_A)) + " 원 송금\n"
            }
            if RESULT_B != 0
            {
                Print += B_name + " → " + C_name + " " + inputComma(innum: (-RESULT_B)) + " 원 송금\n"
            }
            if RESULT_D != 0
            {
                Print += D_name + " → " + C_name + " " + inputComma(innum: (-RESULT_D)) + " 원 송금\n"
            }
            if RESULT_E != 0
            {
                Print += E_name + " → " + C_name + " " + inputComma(innum: (-RESULT_E)) + " 원 송금"
            }
        }
        else if RESULT_D > 0
        {
            if RESULT_A != 0
            {
                Print = A_name + " → " + D_name + " " + inputComma(innum: (-RESULT_A)) + " 원 송금\n"
            }
            if RESULT_B != 0
            {
                Print += B_name + " → " + D_name + " " + inputComma(innum: (-RESULT_B)) + " 원 송금\n"
            }
            if RESULT_C != 0
            {
                Print += C_name + " → " + D_name + " " + inputComma(innum: (-RESULT_C)) + " 원 송금\n"
            }
            if RESULT_E != 0
            {
                Print += E_name + " → " + D_name + " " + inputComma(innum: (-RESULT_E)) + " 원 송금"
            }
        }
        else if RESULT_E > 0
        {
            if RESULT_A != 0
            {
                Print = A_name + " → " + E_name + " " + inputComma(innum: (-RESULT_A)) + " 원 송금\n"
            }
            if RESULT_B != 0
            {
                Print += B_name + " → " + E_name + " " + inputComma(innum: (-RESULT_B)) + " 원 송금\n"
            }
            if RESULT_C != 0
            {
                Print += C_name + " → " + E_name + " " + inputComma(innum: (-RESULT_C)) + " 원 송금\n"
            }
            if RESULT_D != 0
            {
                Print += D_name + " → " + E_name + " " + inputComma(innum: (-RESULT_D)) + " 원 송금"
            }
        }
    }
    
    func case2()
    {
        //받는사람2 주는사람3
        find()
        
        if array_after[0] > -(array_after[4])
        {
            if array_after[1] > -(array_after[2])
            {
                let temp = array_after[0] + array_after[4]
                Print = FIVE + " → " + ONE + " " + inputComma(innum: (-array_after[4])) + " 원 송금\n"
                    + FOUR + " → " + ONE + " " + inputComma(innum: temp) + " 원 송금\n"
                        + FOUR + " → " + TWO + " " + inputComma(innum: (-temp-array_after[3])) + " 원 송금\n"
                    + THREE + " → " + TWO + " " + inputComma(innum: (-array_after[2])) + " 원 송금"
            }
            else if array_after[1] == -(array_after[2])
            {
                Print = FIVE + " → " + ONE + " " + inputComma(innum: (-array_after[4])) + " 원 송금\n"
                        + FOUR + " → " + ONE + " " + inputComma(innum: array_after[3]) + " 원 송금\n"
                        + THREE + " → " + TWO + " " + inputComma(innum: array_after[1]) + " 원 송금"
            }
            else if array_after[1] < -(array_after[2])
            {
                let temp = array_after[0] + array_after[3] + array_after[4]
                Print = FIVE + " → " + ONE + " " + inputComma(innum: (-array_after[4])) + " 원 송금\n"
                        + FOUR + " → " + ONE + " " + inputComma(innum: (-array_after[3])) + " 원 송금\n"
                        + THREE + " → " + ONE + " " + inputComma(innum: temp) + " 원 송금\n"
                        + THREE + " → " + TWO + " " + inputComma(innum: array_after[1]) + " 원 송금"
            }
        }
        else if array_after[0] < -(array_after[4])
        {
            let temp = -(array_after[0] + array_after[4])
            Print = FIVE + " → " + ONE + " " + inputComma(innum: array_after[0]) + " 원 송금\n"
                    + FIVE + " → " + TWO + " " + inputComma(innum: temp) + " 원 송금\n"
                    + FOUR + " → " + TWO + " " + inputComma(innum: (-array_after[3])) + " 원 송금\n"
                    + THREE + " → " + TWO + " " + inputComma(innum: (-array_after[2])) + " 원 송금"
        }
        else if array_after[0] == -(array_after[4])
        {
            Print = FIVE + " → " + ONE + " " + inputComma(innum: array_after[0]) + " 원 송금\n"
                    + FOUR + " → " + TWO + " " + inputComma(innum: (-array_after[3])) + " 원 송금\n"
                    + THREE + " → " + TWO + " " + inputComma(innum: (-array_after[2])) + " 원 송금"
        }
    }
    
    func case3()
    {
        //받는사람3 주는사람2
        find()
        
        if array_after[0] < -(array_after[4])
        {
            if array_after[2] < -(array_after[3])
            {
                let temp = -(array_after[0] + array_after[4])
                Print = FIVE + " → " + ONE + " " + inputComma(innum: array_after[0]) + " 원 송금\n"
                        + FIVE + " → " + TWO + " " + inputComma(innum: temp) + " 원 송금\n"
                        + FOUR + " → " + TWO + " " + inputComma(innum: (array_after[1]-temp)) + " 원 송금\n"
                        + FOUR + " → " + THREE + " " + inputComma(innum: array_after[2]) + " 원 송금"
            }
            else if array_after[2] > -(array_after[3])
            {
                let temp = -(array_after[0] + array_after[1] + array_after[4])
                Print = FIVE + " → " + ONE + " " + inputComma(innum: array_after[0]) + " 원 송금\n"
                        + FIVE + " → " + TWO + " " + inputComma(innum: array_after[1]) + " 원 송금\n"
                        + FIVE + " → " + THREE + " " + inputComma(innum: temp) + " 원 송금\n"
                        + FOUR + " → " + THREE + " " + inputComma(innum: (array_after[2]-temp)) + " 원 송금"
            }
            else if array_after[2] == -(array_after[3])
            {
                Print = FIVE + " → " + ONE + " " + inputComma(innum: array_after[0]) + " 원 송금\n"
                        + FIVE + " → " + TWO + " " + inputComma(innum: array_after[1]) + " 원 송금\n"
                        + FOUR + " → " + THREE + " " + inputComma(innum: array_after[2]) + " 원 송금"
            }
        }
        else if array_after[0] > -(array_after[4])
        {
            let temp = array_after[0] + array_after[4]
            Print = FIVE + " → " + ONE + " " + inputComma(innum: (-array_after[4])) + " 원 송금\n"
                + FOUR + " → " + ONE + " " + inputComma(innum: temp) + " 원 송금\n"
                    + FOUR + " → " + TWO + " " + inputComma(innum: array_after[1]) + " 원 송금\n"
                    + FOUR + " → " + THREE + " " + inputComma(innum: array_after[2]) + " 원 송금"
        }
        else if array_after[0] == -(array_after[4])
        {
            Print = FIVE + " → " + ONE + " " + inputComma(innum: array_after[0]) + " 원 송금\n"
                    + FOUR + " → " + TWO + " " + inputComma(innum: array_after[1]) + " 원 송금\n"
                    + FOUR + " → " + THREE + " " + inputComma(innum: array_after[2]) + " 원 송금"
        }
    }
    
    func case4()
    {
        //한명이 나머지 네명한테 송금한다
        if RESULT_A < 0
        {
            Print = A_name + " → " + B_name + " " + inputComma(innum: RESULT_B) + " 원 송금\n"
                    + A_name + " → " + C_name + " " + inputComma(innum: RESULT_C) + " 원 송금\n"
                    + A_name + " → " + D_name + " " + inputComma(innum: RESULT_D) + " 원 송금\n"
                    + A_name + " → " + E_name + " " + inputComma(innum: RESULT_E) + " 원 송금"
        }
        else if RESULT_B < 0
        {
            Print = B_name + " → " + A_name + " " + inputComma(innum: RESULT_A) + " 원 송금\n"
                    + B_name + " → " + C_name + " " + inputComma(innum: RESULT_C) + " 원 송금\n"
                    + B_name + " → " + D_name + " " + inputComma(innum: RESULT_D) + " 원 송금\n"
                    + B_name + " → " + E_name + " " + inputComma(innum: RESULT_E) + " 원 송금"
        }
        else if RESULT_C < 0
        {
            Print = C_name + " → " + A_name + " " + inputComma(innum: RESULT_A) + " 원 송금\n"
                    + C_name + " → " + B_name + " " + inputComma(innum: RESULT_B) + " 원 송금\n"
                    + C_name + " → " + D_name + " " + inputComma(innum: RESULT_D) + " 원 송금\n"
                    + C_name + " → " + E_name + " " + inputComma(innum: RESULT_E) + " 원 송금"
        }
        else if RESULT_D < 0
        {
            Print = D_name + " → " + A_name + " " + inputComma(innum: RESULT_A) + " 원 송금\n"
                    + D_name + " → " + B_name + " " + inputComma(innum: RESULT_B) + " 원 송금\n"
                    + D_name + " → " + C_name + " " + inputComma(innum: RESULT_C) + " 원 송금\n"
                    + D_name + " → " + E_name + " " + inputComma(innum: RESULT_E) + " 원 송금"
        }
        else if RESULT_E < 0
        {
            Print = E_name + " → " + A_name + " " + inputComma(innum: RESULT_A) + " 원 송금\n"
                    + E_name + " → " + B_name + " " + inputComma(innum: RESULT_B) + " 원 송금\n"
                    + E_name + " → " + C_name + " " + inputComma(innum: RESULT_C) + " 원 송금\n"
                    + E_name + " → " + D_name + " " + inputComma(innum: RESULT_D) + " 원 송금"
        }
    }
    
    func find()
    {
        array_before.append(RESULT_A)
        array_before.append(RESULT_B)
        array_before.append(RESULT_C)
        array_before.append(RESULT_D)
        array_before.append(RESULT_E)
        array_after = array_before.sorted(by: >)
        //ver1.1 정렬문제 해결
        var use_A: Bool = true
        var use_B: Bool = true
        var use_C: Bool = true
        var use_D: Bool = true
        var use_E: Bool = true
        var find: Bool = true
        
        for i in stride(from:0, to: 5, by: 1)
        {
            var num = i+1
            if array_after[i] == RESULT_A
            {
                if(find && use_A)
                {
                    print("in A")
                    switch num {
                    case 1:
                        ONE = A_name
                        use_A = false
                        find = false
                    case 2:
                        TWO = A_name
                        use_A = false
                        find = false
                    case 3:
                        THREE = A_name
                        use_A = false
                        find = false
                    case 4:
                        FOUR = A_name
                        use_A = false
                        find = false
                    case 5:
                        FIVE = A_name
                        use_A = false
                        find = false
                    default:
                        Print = "Error"
                    }
                }
            }
            if array_after[i] == RESULT_B
            {
                if(find && use_B)
                {
                    print("in B")
                    switch num {
                    case 1:
                        ONE = B_name
                        use_B = false
                        find = false
                    case 2:
                        TWO = B_name
                        use_B = false
                        find = false
                    case 3:
                        THREE = B_name
                        use_B = false
                        find = false
                    case 4:
                        FOUR = B_name
                        use_B = false
                        find = false
                    case 5:
                        FIVE = B_name
                        use_B = false
                        find = false
                    default:
                        Print = "Error"
                    }
                }
            }
            if array_after[i] == RESULT_C
            {
                if(find && use_C)
                {
                    print("in C")
                    switch num {
                    case 1:
                        ONE = C_name
                        use_C = false
                        find = false
                    case 2:
                        TWO = C_name
                        use_C = false
                        find = false
                    case 3:
                        THREE = C_name
                        use_C = false
                        find = false
                    case 4:
                        FOUR = C_name
                        use_C = false
                        find = false
                    case 5:
                        FIVE = C_name
                        use_C = false
                        find = false
                    default:
                        Print = "Error"
                    }
                }
            }
            if array_after[i] == RESULT_D
            {
                if(find && use_D)
                {
                    print("in D")
                    switch num {
                    case 1:
                        ONE = D_name
                        use_D = false
                        find = false
                    case 2:
                        TWO = D_name
                        use_D = false
                        find = false
                    case 3:
                        THREE = D_name
                        use_D = false
                        find = false
                    case 4:
                        FOUR = D_name
                        use_D = false
                        find = false
                    case 5:
                        FIVE = D_name
                        use_D = false
                        find = false
                    default:
                        Print = "Error"
                    }
                }
            }
            if array_after[i] == RESULT_E
            {
                if(find && use_E)
                {
                    print("in E")
                    switch num {
                    case 1:
                        ONE = E_name
                        use_E = false
                        find = false
                    case 2:
                        TWO = E_name
                        use_E = false
                        find = false
                    case 3:
                        THREE = E_name
                        use_E = false
                        find = false
                    case 4:
                        FOUR = E_name
                        use_E = false
                        find = false
                    case 5:
                        FIVE = E_name
                        use_E = false
                        find = false
                    default:
                        Print = "Error"
                    }
                }
            }
            find = true
        }
    }
    
    //ver1.1 콤마 추가
    func inputComma(innum: Int) -> String
    {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        let RESULT_COMMA: String = numberFormatter.string(from:NSNumber(value: innum))!
        return RESULT_COMMA
    }

}