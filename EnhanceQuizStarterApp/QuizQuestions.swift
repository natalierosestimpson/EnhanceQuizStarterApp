//
//  QuizQuestions.swift
//  EnhanceQuizStarterApp
//
//  Created by James Devlin on 26/09/2018.
//  Copyright © 2018 Natalie Stimpson. All rights reserved.
//

import GameKit

//The struct below sets out the questions for the game and introduces a function to randomlly select a question

 var indexOfSelectedQuestion = 0

struct QuizQuestions {
    
    let trivia : [[String:String]] = [
        ["Question": "Only female koalas can whistle", "Answer": "False"],
        ["Question": "Blue whales are technically whales", "Answer": "True"],
        ["Question": "Camels are cannibalistic", "Answer": "False"],
        ["Question": "All ducks are birds", "Answer": "True"]]
    
    
    func randomQuestion() -> [String : String] {
        indexOfSelectedQuestion = GKRandomSource.sharedRandom().nextInt(upperBound: trivia.count)
        return trivia[indexOfSelectedQuestion]
        }

}
