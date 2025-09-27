import SwiftUI

struct ContentView: View {
    @State private var questions = [
        "What is 7 + 7?",
        "What is the capital of Vermont?",
        "Who created the Swift language?",
        "What year did the first iPhone launch?",
        "What is 9 × 9?"
    ]

    @State private var answers = [
        "14",
        "Montpelier",
        "Apple",
        "2007",
        "81"
    ]

    @State private var currentIndex = 0
    @State private var showAnswer = false

    var body: some View {
        VStack(spacing: 24) {
            Text("Quiz App")
                .font(.largeTitle).bold()
                .padding(.top, 8)

            QuizView(
                questions: questions,
                answers: answers,
                currentIndex: $currentIndex,
                showAnswer: $showAnswer
            )

            Spacer(minLength: 0)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}