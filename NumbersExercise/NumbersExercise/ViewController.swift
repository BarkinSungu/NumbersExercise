//
//  ViewController.swift
//  NumbersExercise
//
//  Created by Barkın Süngü on 19.07.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerTextField: UITextField!
    @IBOutlet weak var acceptButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    let numbersByDigit = [
        "1", "2", "3", "4", "5", "6", "7", "8", "9", "10",
        "11", "12", "13", "14", "15", "16", "17", "18", "19", "20",
        "21", "22", "23", "24", "25", "26", "27", "28", "29", "30",
        "31", "32", "33", "34", "35", "36", "37", "38", "39", "40",
        "41", "42", "43", "44", "45", "46", "47", "48", "49", "50",
        "51", "52", "53", "54", "55", "56", "57", "58", "59", "60",
        "61", "62", "63", "64", "65", "66", "67", "68", "69", "70",
        "71", "72", "73", "74", "75", "76", "77", "78", "79", "80",
        "81", "82", "83", "84", "85", "86", "87", "88", "89", "90",
        "91", "92", "93", "94", "95", "96", "97", "98", "99", "100"]
    let numbersInWriting = [
        "one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten",
        "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen", "twenty",
        "twenty one", "twenty two", "twenty three", "twenty four", "twenty five", "twenty six", "twenty seven", "twenty eight", "twenty nine", "thirty",
        "thirty one", "thirty two", "thirty three", "thirty four", "thirty five", "thirty six", "thirty seven", "thirty eight", "thirty nine", "forty",
        "forty one", "forty two", "forty three", "forty four", "forty five", "forty six", "forty seven", "forty eight", "forty nine", "fifty",
        "fifty one", "fifty two", "fifty three", "fifty four", "fifty five", "fifty six", "fifty seven", "fifty eight", "fifty nine", "sixty",
        "sixty one", "sixty two", "sixty three", "sixty four", "sixty five", "sixty six", "sixty seven", "sixty eight", "sixty nine", "seventy",
        "seventy one", "seventy two", "seventy three", "seventy four", "seventy five", "seventy six", "seventy seven", "seventy eight", "seventy nine", "eighty",
        "eighty one", "eighty two", "eighty three", "eighty four", "eighty five", "eighty six", "eighty seven", "eighty eight", "eighty nine", "ninety",
        "ninety one", "ninety two", "ninety three", "ninety four", "ninety five", "ninety six", "ninety seven", "ninety eight", "ninety nine", "one hundred"]
    var correctAnsver = ""
    var score = 0
    var switchNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        askQuestion()
    }
    
    func askQuestion(){
    //    var switchNumber = Int.random(in: 0..<3)
        var questionNumber = Int.random(in: 0..<100)
        var questionArray = [String]()
        var answerArray = [String]()
        
        if switchNumber == 1{
            questionArray = numbersByDigit
            answerArray = numbersInWriting
        }else{
            questionArray = numbersInWriting
            answerArray = numbersByDigit
        }
        
        scoreLabel.text = "Score: " + String(score)
        print("Score: " + String(score))
        answerTextField.text = ""
        questionLabel.text = questionArray[questionNumber]
        correctAnsver = answerArray[questionNumber]
        score = score+1
        
    }

    @IBAction func acceptButtonTapped(_ sender: Any) {
        if answerTextField.text == correctAnsver{
            trueAnswer()
        }else{
            wrongAnswer()
        }
    }
    
    @IBAction func DigitToTextSwitch(_ sender: UISwitch) {
        score = score - 1 //askQuestion score u artırır soru çözülmeden artmasını engelemek için
        if sender.isOn{
            switchNumber = 0
            askQuestion()
        }else{
            switchNumber = 1
            askQuestion()
        }
    }
    
    func trueAnswer(){
        self.view.backgroundColor = UIColor.green
        
        let seconds = 1.0
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            // Put your code which should be executed with a delay here
            self.view.backgroundColor = UIColor.systemBackground
        }
        askQuestion()
    }
    
    func wrongAnswer(){
        self.view.backgroundColor = UIColor.red
        
        let seconds = 1.0
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            // Put your code which should be executed with a delay here
            self.view.backgroundColor = UIColor.systemBackground
        }
    }
    

}

