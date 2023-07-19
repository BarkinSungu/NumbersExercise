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
    
    let numbersByDigit = ["1","2","3"]
    let numbersInWriting = ["one", "two", "three"]
    var correctAnsver = ""
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        askQuestion()
    }
    
    func askQuestion(){
        var switchNumber = Int.random(in: 1..<3)
        var questionNumber = Int.random(in: 0..<3)
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

