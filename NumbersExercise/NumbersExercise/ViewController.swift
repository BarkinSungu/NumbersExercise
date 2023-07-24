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
    @IBOutlet weak var levelSelectPopUpButton: UIButton!
    
    var numbersByDigit = [String]()
    var numbersInWriting = [String]()
    var correctAnsver = ""
    var score = 0
    var switchNumber = 0
    var questionLevel = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let numbers: Numbers = Numbers()
        numbersByDigit = numbers.numbersByDigit
        numbersInWriting = numbers.numbersInWriting
        setLevelSelectPopUpButton()
        askQuestion()
    }
    
    func askQuestion(){
    //    var switchNumber = Int.random(in: 0..<3)
        let questionNumber = Int.random(in: 0..<questionLevel)
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
    
    func setLevelSelectPopUpButton(){
        let optionClosure = {(action: UIAction) in print(action.title)
            self.score = self.score - 1 //askQuestion score u artırır soru çözülmeden artmasını engelemek için
            if action.title == "0 to 10"{
                self.questionLevel = 10
            }else if action.title == "0 to 100"{
                self.questionLevel = 100
            }else if action.title == "0 to 1000"{
                self.questionLevel = 1000
            }else if action.title == "0 to 10000"{
                self.questionLevel = 10000
            }
            self.askQuestion()
        }
        
        levelSelectPopUpButton.menu = UIMenu(children:[
            UIAction(title: "0 to 10", state: .on, handler: optionClosure),
            UIAction(title: "0 to 100", state: .on, handler: optionClosure),
            UIAction(title: "0 to 1000", state: .on, handler: optionClosure),
            UIAction(title: "0 to 10000", state: .on, handler: optionClosure)
        ])
        
        levelSelectPopUpButton.showsMenuAsPrimaryAction = true
        levelSelectPopUpButton.changesSelectionAsPrimaryAction = true
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

