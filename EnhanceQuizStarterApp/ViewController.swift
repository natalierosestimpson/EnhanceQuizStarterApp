//
//  ViewController.swift
//  EnhanceQuizStarter
//
//  Created by Pasan Premaratne on 3/12/18.
//  Copyright © 2018 Treehouse. All rights reserved.
//

import UIKit
import GameKit
import AudioToolbox
import AVFoundation

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    let questionsPerRound = 4
    var questionsAsked = 0
    var correctQuestions = 0
 
    var gameSound: SystemSoundID = 0
    
    // MARK: - Outlets
    
    @IBOutlet weak var questionField: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var buttonThree: UIButton!
    @IBOutlet weak var buttonFour: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadGameStartSound()
        playGameStartSound()
        displayQuestion()
    }
    
    // MARK: - Helpers
    
    func loadGameStartSound() {
        let path = Bundle.main.path(forResource: "GameSound", ofType: "wav")
        let soundUrl = URL(fileURLWithPath: path!)
       AudioServicesCreateSystemSoundID(soundUrl as CFURL, &gameSound)
    }
    
    func playGameStartSound() {
       AudioServicesPlaySystemSound(gameSound)
    }
 
   func displayQuestion() {
        let currentQuestion = randomTrivia[questionsAsked]
        questionField.text = currentQuestion.question
        trueButton.setTitle(currentQuestion.optionOne, for: UIControl.State.normal)
        falseButton.setTitle(currentQuestion.optionTwo, for: UIControl.State.normal)
        buttonThree.setTitle(currentQuestion.optionThree, for: UIControl.State.normal)
        buttonFour.setTitle(currentQuestion.optionFour, for: UIControl.State.normal)
    
        playAgainButton.isHidden = true
    }
 
    func displayScore() {
        // Hide the answer buttons
        trueButton.isHidden = true
        falseButton.isHidden = true
        buttonThree.isHidden = true
        buttonFour.isHidden = true
        
        // Display play again button
        playAgainButton.isHidden = false
        
        questionField.text = "Way to go! \n You got \(correctQuestions) out of \(questionsPerRound) correct!"

    }
    
    func nextRound() {
        if questionsAsked == questionsPerRound {
            // Game is over
            displayScore()
        } else {
            // Continue game
            displayQuestion()
        }
    }
    
    func loadNextRound(delay seconds: Int) {
        // Converts a delay in seconds to nanoseconds as signed 64 bit integer
        let delay = Int64(NSEC_PER_SEC * UInt64(seconds))
        // Calculates a time value to execute the method given current time and delay
        let dispatchTime = DispatchTime.now() + Double(delay) / Double(NSEC_PER_SEC)
        
        // Executes the nextRound method at the dispatch time on the main queue
        DispatchQueue.main.asyncAfter(deadline: dispatchTime) {
            self.nextRound()
        }
    }
    
    
    // MARK: - Actions
    
    @IBAction func checkAnswer(_ sender: UIButton) {
        // Increment the questions asked counter
    
        let correctAnswer : Int = randomTrivia[questionsAsked].answer
        
        if (sender === trueButton &&  correctAnswer == 1) || (sender === falseButton && correctAnswer == 2) || (sender === buttonThree && correctAnswer == 3) || (sender === buttonFour && correctAnswer == 4) {
            correctQuestions += 1
            questionField.text = "Correct!"
        }
        
        else {
            
        
            if randomTrivia[questionsAsked].answer == 1 { questionField.text = "Sorry, wrong answer! \n the correct answer is: \(randomTrivia[questionsAsked].optionOne)" }
            
            else if randomTrivia[questionsAsked].answer == 2 { questionField.text = "Sorry, wrong answer! \n the correct answer is: \(randomTrivia[questionsAsked].optionTwo)" }
            
            else if
                randomTrivia[questionsAsked].answer == 3 { questionField.text = "Sorry, wrong answer! \n the correct answer is: \(randomTrivia[questionsAsked].optionThree)" }
            
            else { questionField.text = "Sorry, wrong answer! \n the correct answer is: \(randomTrivia[questionsAsked].optionFour)" }
        
        }
        questionsAsked += 1
        loadNextRound(delay: 2)
    }
    
    
    @IBAction func playAgain(_ sender: UIButton) {
        // Show the answer buttons
        trueButton.isHidden = false
        falseButton.isHidden = false
        buttonThree.isHidden = false
        buttonFour.isHidden = false
        
        randomiseTriviaAgain()
        questionsAsked = 0
        correctQuestions = 0
        nextRound()
    }
    

}

