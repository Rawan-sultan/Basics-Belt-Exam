//
//  ViewController.swift
//  IOS Quiz
//
//  Created by 라완 💕 on 24/04/1444 AH.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var answerA: UIButton!
    @IBOutlet weak var answerB: UIButton!
    @IBOutlet weak var answerC: UIButton!
    @IBOutlet weak var answerD: UIButton!
    
    var sscore: Int = 0
    var qIndx: Int = 0
    var selectedAnswer: Int = 0
    
    @IBOutlet weak var correctAnswerView: UIView!
    @IBOutlet weak var correct: UILabel!
    @IBOutlet weak var theAnswer: UILabel!
    @IBOutlet weak var scoreNum: UILabel!
    
    @IBOutlet weak var wrongAnswerView: UIView!
    @IBOutlet weak var wrongLabel: UILabel!
    
    
    @IBAction func buttonAnswers(_ sender: UIButton) {
        if sender.tag == selectedAnswer {
            print("O")
            sscore += 1
            correct.text = "Correct"
            if selectedAnswer == QuizData.data[0].correctAnswer {
                theAnswer.text = "\(QuizData.data[qIndx].answerB)"
            }else if selectedAnswer == QuizData.data[1].correctAnswer &&  selectedAnswer == QuizData.data[2].correctAnswer{
                theAnswer.text = "\(QuizData.data[qIndx].answerA)"
            }else if selectedAnswer == QuizData.data[3].correctAnswer {
                theAnswer.text = "\(QuizData.data[qIndx].answerC)"
            }else{
                theAnswer.text = "\(QuizData.data[qIndx].answerD)"
            }
            scoreNum.text = String("score: \(sscore)")
            correctAnswerView.isHidden = false
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0){
                self.correctAnswerView.isHidden = true
            }
            qIndx += 1
        }else{
            print("x")
            wrongLabel.text = "Not Quite"
            wrongAnswerView.isHidden = false
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0){
                self.wrongAnswerView.isHidden = true
            }
            
        }
        updateQuastion()
        
    }
    
    func updateQuastion(){
        if qIndx <= QuizData.data.count - 1 {
            questionLabel.text = QuizData.data[qIndx].question
            answerA.setTitle( QuizData.data[qIndx].answerA, for: .normal)
            answerB.setTitle( QuizData.data[qIndx].answerB, for: .normal)
            answerC.setTitle( QuizData.data[qIndx].answerC, for: .normal)
            answerD.setTitle( QuizData.data[qIndx].answerD, for: .normal)
            selectedAnswer = QuizData.data[qIndx].correctAnswer
        }else{
            self.present(UIAlertController(title:"quiz ended", message: "your score is : \(sscore)", preferredStyle: .alert), animated: true, completion: nil)
        }
        updateProgress()
    }

     func updateProgress() {
        progressView.progress = Float(qIndx) / Float(QuizData.data.count)
    }
    
    struct Dataset {
        var question = String()
        var correctAnswer = Int()
        var answerA = String()
        var answerB = String()
        var answerC = String()
        var answerD = String()
    }
    
    struct QuizBank {
        var quizzes = [QuizData]()
    }
    
    struct QuizData {
        static var data = [
            Dataset(question: "who was one of the creators of the Swift language?",
                    correctAnswer: 1,
                    answerA: "Steve Jobs",
                    answerB: "Chris Lattner",
                    answerC: "Steve Woznika",
                    answerD: "Ronald Wayne"),
            
            Dataset(question: "Apple was created in what year?",
                    correctAnswer: 0,
                    answerA: "1976",
                    answerB: "1989",
                    answerC: "1990",
                    answerD: "2002"),
            
            Dataset(question: "The first iPhone was released on what day?",
                    correctAnswer: 0,
                    answerA: "June 2007",
                    answerB: "October 2010",
                    answerC: "May 2011",
                    answerD: "June 2011"),
            
            Dataset(question: "The current iPhone has 6GB RAM. The first iPhone has how much RAM?",
                    correctAnswer: 2,
                    answerA: "1 GB",
                    answerB: "2 GB",
                    answerC: "128 MB",
                    answerD: "It had one RAM"),
            
            Dataset(question: "When was Objective-C Created?",
                    correctAnswer: 3,
                    answerA: "1961",
                    answerB: "1976",
                    answerC: "1980",
                    answerD: "1984"),
        ]
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateProgress()
        updateQuastion()
        wrongAnswerView.isHidden = true
        correctAnswerView.isHidden = true
        // Do any additional setup after loading the view.
    }


}

