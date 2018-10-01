//the code below introduces an array variable which holds the randomised trivia and a function to pick questions out of the array

var quizQuestions = QuizQuestions()
var randomTrivia : [questionData] = quizQuestions.shuffleTrivia()

func randomiseTriviaAgain() -> [questionData] {
    randomTrivia = quizQuestions.shuffleTrivia()
    return randomTrivia
}


