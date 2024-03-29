//
//  View_nomal_ViewController.swift
//  Calculator Plus
//
//  Created by Min_MacBook Pro on 2020/03/26.
//  Copyright © 2020 FreeDeveloper. All rights reserved.
//

import UIKit

class CalculaterViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var Button_AC: UIButton!
    @IBOutlet var Button_DEL: UIButton!
    @IBOutlet var Button_div: UIButton!
    @IBOutlet var Button_mul: UIButton!
    
    @IBOutlet var Button_7: UIButton!
    @IBOutlet var Button_8: UIButton!
    @IBOutlet var Button_9: UIButton!
    @IBOutlet var Button_min: UIButton!
    
    @IBOutlet var Button_4: UIButton!
    @IBOutlet var Button_5: UIButton!
    @IBOutlet var Button_6: UIButton!
    @IBOutlet var Button_plus: UIButton!
    
    @IBOutlet var Button_1: UIButton!
    @IBOutlet var Button_2: UIButton!
    @IBOutlet var Button_3: UIButton!
    @IBOutlet var Button_0: UIButton!
    @IBOutlet var Button_dot: UIButton!
    @IBOutlet var Button_Result: UIButton!
    
    @IBOutlet var Text_result_1: UILabel!
    @IBOutlet var Text_result_2: UILabel!
    @IBOutlet weak var View_line1: UIView!
    @IBOutlet weak var View_line2: UIView!
    @IBOutlet var View_View: UIView!
    
    var type: String = ""
    var count: Int = 0
    var PLUS: Int = 0
    var MINUS: Int = 1
    var MUL: Int = 2
    var DIV: Int = 3
    var sum: Double = 0
    var RESULT: Double = 0
    var history: String = ""
    var number: String = ""
    var NUMBER: Double = 0
    var sum_int: Int = 0
    var sum_str: String = ""
    
    let GRAY = UIColor(named: "ColorGray_light")
    let REVERSE = UIColor(named: "Dynamic_reverse")
    let BUTTON = UIColor(named: "button")
    
    var Commpa: Bool = false
    var temp: Int = 0
    var inputCount: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showAnimation()
        setRadius()
        setAlpha()
    }
    //숫자 버튼 입력
    @IBAction func button(sender: UIButton) {
        let digit = sender.currentTitle!
        algoOfNumbers(digit: digit)
    }
    //엔터 버튼 입력
    @IBAction func ENTER(_ sender: UIButton) {
        algoOfEnter()
    }
    //더하기 버튼 입력
    @IBAction func PLUS(_ sender: UIButton) {
        algoOfPlus()
    }
    //빼기 버튼 입력
    @IBAction func MINUS(_ sender: UIButton) {
        algoOfMinus()
    }
    //곱하기 버튼 입력
    @IBAction func MULTIPLE(_ sender: UIButton) {
        algoOfMultiple()
    }
    //나누기 버튼 입력
    @IBAction func DIV(_ sender: UIButton) {
        algoOfDiv()
    }
    //끝글자 제거 버튼
    @IBAction func DEL(_ sender: UIButton) {
        algoOfDel()
    }
    //초기화 버튼
    @IBAction func AC(_ sender: UIButton) {
        algoOfAC()
    }
}




extension CalculaterViewController {
    func showAnimation() {
        self.View_View.alpha = 0
        UIView.animate(withDuration: 0.5, animations: {
            self.View_View.alpha = 1
        })
    }
    
    func setRadius() {
        Button_AC.layer.cornerRadius = 4
        Button_DEL.layer.cornerRadius = 4
        Button_div.layer.cornerRadius = 4
        Button_mul.layer.cornerRadius = 4
        
        Button_7.layer.cornerRadius = 4
        Button_8.layer.cornerRadius = 4
        Button_9.layer.cornerRadius = 4
        Button_min.layer.cornerRadius = 4
        
        Button_4.layer.cornerRadius = 4
        Button_5.layer.cornerRadius = 4
        Button_6.layer.cornerRadius = 4
        Button_plus.layer.cornerRadius = 4
        
        Button_1.layer.cornerRadius = 4
        Button_2.layer.cornerRadius = 4
        Button_3.layer.cornerRadius = 4
        Button_0.layer.cornerRadius = 4
        Button_dot.layer.cornerRadius = 4
        Button_Result.layer.cornerRadius = 4
    }
    
    func setAlpha() {
        self.View_line1.alpha = 0
        self.View_line2.alpha = 0
    }
    
    func cal()
    {
        if type == "PLUS" {
            sum += Double(number)!
        }
        else if type == "MINUS" {
            sum -= Double(number)!
        }
        else if type == "MUL" {
            sum *= Double(number)!
        }
        else if type == "DIV" {
            sum /= Double(number)!
        }
    }
    
    func checkDoubleToInt(sum : Double) -> Bool
    {
        sum_int = Int(sum)
        sum_str = String(sum_int) + ".0"
        if(sum_str == String(sum))
        {
            return true
        }
        else
        {
            return false
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
    
    func countSize(num: Int) -> Int
    {
        var number: Int = num
        var count: Int = 0
        while number > 0 {
            number = number/10
            count += 1
        }
        return count
    }
    
    func buttonsEnable()
    {
        Button_1.isUserInteractionEnabled = true
        Button_2.isUserInteractionEnabled = true
        Button_3.isUserInteractionEnabled = true
        Button_4.isUserInteractionEnabled = true
        Button_5.isUserInteractionEnabled = true
        Button_6.isUserInteractionEnabled = true
        Button_7.isUserInteractionEnabled = true
        Button_8.isUserInteractionEnabled = true
        Button_9.isUserInteractionEnabled = true
        Button_0.isUserInteractionEnabled = true
        Button_dot.isUserInteractionEnabled = true
    }
    
    func buttonsDisable()
    {
        Button_1.isUserInteractionEnabled = false
        Button_2.isUserInteractionEnabled = false
        Button_3.isUserInteractionEnabled = false
        Button_4.isUserInteractionEnabled = false
        Button_5.isUserInteractionEnabled = false
        Button_6.isUserInteractionEnabled = false
        Button_7.isUserInteractionEnabled = false
        Button_8.isUserInteractionEnabled = false
        Button_9.isUserInteractionEnabled = false
        Button_0.isUserInteractionEnabled = false
        Button_dot.isUserInteractionEnabled = false
    }
    
    func doubleInputComma(input: Double) -> String
    {
        if(input < 1)
        {
            return String(input)
        }
        //실수를 소수점 앞을 세자리 끊어서, 소수점 뒤는 그냥 붙여서 출력해야 한다
        let decimal: Int = Int(floor(input))
        var printString = inputComma(innum: decimal) //숫자부분만 구하기
        
        var temp = String(input) //소수점 문자열로 변환
        let count: Int = countSize(num: decimal) //숫자부분 개수 구하기
        temp = String(temp.dropFirst(count)) //문자열에서 숫자부분 없애기
        printString += temp
        return printString
    }
    
    func nextAnimation() {
        UIView.animate(withDuration: 0.3, animations: {
            self.View_line2.alpha = 1
            self.View_line2.backgroundColor = self.BUTTON
            self.View_line1.backgroundColor = self.GRAY
        })
    }
    
    func inputClear() {
        inputCount = 0
        Commpa = false
    }
    
    func checkFirstCal() {
        if count == 0 {
            sum = Double(number)!
            count = count + 1
        }
        else {
            cal()
            count = count + 1
        }
    }
    
    func setHistory(oper: String) {
        if (checkDoubleToInt(sum: sum))
        {
            history = inputComma(innum: sum_int) + oper
        } else {
            history = doubleInputComma(input: sum) + oper
        }
        
        Text_result_1.text = history
        Text_result_2.text = ""
    }
}

extension String { /** 숫자형 문자열에 3자리수 마다 콤마 넣기 Double형으로 형변환 되지 않으면 원본을 유지한다. ```swift let stringValue = "10005000.123456789" print(stringValue.insertComma) // 결과 : "10,005,000.123456789" ``` */
    var insertComma: String { let numberFormatter = NumberFormatter();
        numberFormatter.numberStyle = .decimal // 소수점이 있는 경우 처리
        if let _ = self.range(of: ".") {
            var numberArray = self.components(separatedBy: ".")
            if numberArray.count == 1 {
                var numberString = numberArray[0]
                if numberString.isEmpty {
                    numberString = "0"
                }
                guard let doubleValue = Double(numberString) else {
                    return self
                }
                return numberFormatter.string(from: NSNumber(value: doubleValue)) ?? self
            } else if numberArray.count == 2 {
                var numberString = numberArray[0]
                if numberString.isEmpty {
                    numberString = "0"
                }
                guard let doubleValue = Double(numberString) else {
                    return self
                }
                return (numberFormatter.string(from: NSNumber(value: doubleValue)) ?? numberString) + ".\(numberArray[1])"
            }
        } else {
            guard let doubleValue = Double(self) else {
                return self
            }
            return numberFormatter.string(from: NSNumber(value: doubleValue)) ?? self }
        return self
    }
}


extension CalculaterViewController {
    func algoOfNumbers(digit: String) {
        if(inputCount<18)
        {
            inputCount+=1
            var result = Text_result_2.text!
            
            if(String(digit) == ".") {
                Commpa = true
                Button_dot.isUserInteractionEnabled = false
            }
            
            result += String(digit)
            if(Commpa == false) {
                result = result.replacingOccurrences(of: ",", with: "")
                Text_result_2.text = inputComma(innum: Int(result)!)
            } else {
                Text_result_2.text = result
            }
            nextAnimation()
        }
    }
    
    func algoOfEnter() {
        inputClear()
        buttonsDisable()
        if count > 0
        {
            number = Text_result_2.text!.replacingOccurrences(of: ",", with: "")
            
            if(number != "") {
                NUMBER = Double(number)!
                
                if(checkDoubleToInt(sum: NUMBER)) {
                    history = history + inputComma(innum: sum_int)
                } else {
                    history = history + doubleInputComma(input: NUMBER)
                }
                Text_result_1.text = history
                
                if type == "PLUS" {
                    RESULT = sum + NUMBER
                } else if type == "MINUS" {
                    RESULT = sum - NUMBER
                } else if type == "MUL" {
                    RESULT = sum * NUMBER
                } else if type == "DIV" {
                    RESULT = sum / NUMBER
                }
                
                if(checkDoubleToInt(sum: RESULT)) {
                    Text_result_2.text = inputComma(innum: sum_int)
                } else {
                    Text_result_2.text = doubleInputComma(input: RESULT)
                }
                
                sum = 0
                count = 0
                number = ""
                
                UIView.animate(withDuration: 0.3, animations: {
                    self.View_line2.alpha = 1
                    self.View_line2.backgroundColor = self.BUTTON
                    self.View_line1.alpha = 0
                })
            }
            
        }
        else
        {

        }
    }
    
    func algoOfPlus() {
        inputClear()
        buttonsEnable()
        Button_dot.isUserInteractionEnabled = true
        
        if Text_result_2.text == "" {}
        else {
            number = Text_result_2.text!.replacingOccurrences(of: ",", with: "")
            checkFirstCal()
            setHistory(oper: " + ")
            type = "PLUS"
            nextAnimation()
        }
    }
    
    func algoOfMinus() {
        inputClear()
        buttonsEnable()
        Button_dot.isUserInteractionEnabled = true
        
        if Text_result_2.text == "" {}
        else {
            number = Text_result_2.text!.replacingOccurrences(of: ",", with: "")
            checkFirstCal()
            setHistory(oper: " - ")
            type = "MINUS"
            nextAnimation()
        }
    }
    
    func algoOfMultiple() {
        inputClear()
        buttonsEnable()
        Button_dot.isUserInteractionEnabled = true
        
        if Text_result_2.text == "" {}
        else {
            number = Text_result_2.text!.replacingOccurrences(of: ",", with: "")
            checkFirstCal()
            setHistory(oper: " ✕ ")
            type = "MUL"
            nextAnimation()
        }
    }
    
    func algoOfDiv() {
        inputClear()
        buttonsEnable()
        Button_dot.isUserInteractionEnabled = true
        
        if Text_result_2.text == "" {}
        else {
            number = Text_result_2.text!.replacingOccurrences(of: ",", with: "")
            checkFirstCal()
            setHistory(oper: " / ")
            type = "DIV"
            nextAnimation()
        }
    }
    
    func algoOfDel() {
        // 마지막 글자를 확인해서 소수점 아닌경우 그냥 진행
        // 마지막 글자가 소수점인 경우 소수점 버튼 활성화
        if Text_result_2.text != "" {
            let del_number: String = Text_result_2.text!
            let end = del_number[del_number.index(before: del_number.endIndex)]
            if (end == ".")
            {
                Commpa = false
                Button_dot.isUserInteractionEnabled = true
            }
            if(del_number != "")
            {
                inputCount-=1
                let range = del_number.startIndex..<del_number.index(before: del_number.endIndex)
                Text_result_2.text = String(del_number[range])  // Hello, playgroun
            }
        }
    }
    
    func algoOfAC() {
        inputCount = 0
        Commpa = false
        buttonsEnable()
        Text_result_1.text = ""
        Text_result_2.text = ""
        sum = 0
        count = 0
        history = ""
        number = ""
        UIView.animate(withDuration: 0.3, animations: {
            self.View_line1.alpha = 0
            self.View_line2.alpha = 0
        })
    }
}
