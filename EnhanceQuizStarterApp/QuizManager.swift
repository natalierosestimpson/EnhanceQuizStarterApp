//
//  QuizManager.swift
//  EnhanceQuizStarterApp
//
//  Created by James Devlin on 26/09/2018.
//  Copyright © 2018 Natalie Stimpson. All rights reserved.
//

var quizQuestions = QuizQuestions()

class QuizManager {
    var questionsAskedAlready : [Int]
    
    init(){
        self.questionsAskedAlready = []
    }
    
    func markQuestionAsAlreadyUsed(index : Int) {
        questionsAskedAlready.append(index)
    }
}

