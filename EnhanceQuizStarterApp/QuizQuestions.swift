//
//  QuizQuestions.swift
//  EnhanceQuizStarterApp
//
//  Created by James Devlin on 26/09/2018.
//  Copyright © 2018 Natalie Stimpson. All rights reserved.
//

import GameKit

var quizManager = QuizManager()
let viewController = ViewController()

//The struct below sets out the questions for the game and introduces a function to randomlly select a question

var indexOfSelectedQuestion = 0
var conditionSatistied = 0


struct questionData {
    var question: String
    var optionOne: String
    var optionTwo: String
    var optionThree: String
    var optionFour: String
    var answer: Int
}

struct QuizQuestions {
    var trivia = [
    
    questionData(question : "This was the only US President to serve more than two consecutive terms.", optionOne : "George Washington", optionTwo : "Franklin D. Roosevelt", optionThree: "Woodrow Wilson", optionFour: "Andrew Jackson", answer : 2),
    
    questionData(question: "Which of the following countries has the most residents?", optionOne : "Nigeria", optionTwo : "Russia", optionThree: "Iran", optionFour: "Vietnam", answer : 1),
    
    questionData(question: "In what year was the United Nations founded?", optionOne: "1918", optionTwo: "1919", optionThree: "1945", optionFour: "1954", answer: 3),
    
    questionData(question: "The Titanic departed from the United Kingdom, where was it supposed to arrive?", optionOne: "Paris", optionTwo: "Washington D.C.", optionThree: "New York City", optionFour: "Boston", answer: 3),
    
    questionData(question: "Which nation produces the most oil?", optionOne: "Iran", optionTwo: "Iraq", optionThree: "Brazil", optionFour: "Canada", answer: 4),
    
    questionData(question: "Which country has most recently won consecutive World Cups in Soccer?", optionOne: "Italy", optionTwo: "Brazil", optionThree: "Argentina", optionFour: "Spain", answer: 2),
    
    questionData(question: "Which of the following rivers is longest?", optionOne: "Yangtze", optionTwo: "Mississippi", optionThree: "Congo", optionFour: "Mekong", answer: 2),
    
    questionData(question: "Which city is the oldest?", optionOne: "Mexico City", optionTwo: "Cape Town", optionThree: "San Juan", optionFour: "Sydney", answer: 1),
    
    questionData(question: "Which country was the first to allow women to vote in national elections?", optionOne: "Poland", optionTwo: "United States", optionThree: "Sweden", optionFour: "Senegal", answer: 1),
    
    questionData(question: "Which of these countries won the most medals in the 2012 Summer Games?", optionOne: "France", optionTwo: "Germany", optionThree: "Japan", optionFour: "Great Britain", answer: 4)
        
    ]
    
  
    
    func randomQuestion() -> questionData {
       
        
        if viewController.questionsAsked == 0 {
            indexOfSelectedQuestion = GKRandomSource.sharedRandom().nextInt(upperBound: trivia.count)
        }
        
        else { while conditionSatistied < viewController.questionsAsked {
        indexOfSelectedQuestion = GKRandomSource.sharedRandom().nextInt(upperBound: trivia.count)
         
            for questionNumber in 0..<viewController.questionsAsked {
               
                if indexOfSelectedQuestion == quizManager.questionsAskedAlready[questionNumber] {conditionSatistied += 0}
                else {conditionSatistied += 1}
                
                }
             }
            }
    
        conditionSatistied = 0
        quizManager.markQuestionAsAlreadyUsed(index :
        indexOfSelectedQuestion)
 
    
        
        return trivia[indexOfSelectedQuestion]
        
    }
}
    

