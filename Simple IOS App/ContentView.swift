import SwiftUI

struct ContentView: View {
    // MARK: - Model
    
    
    @State private var questions = [
        "What is 2 + 2?",
        "What is the capital of France?",
        "Who created the Swift language?"
    ]
    
    @State private var answers = [
        "4",
        "Paris",
        "Apple"
    ]
    
    @State private var currentIndex = 0
    @State private var showAnswer = false
    
    var body: some View {
        VStack(spacing: 24) {
            Text(questions[currentIndex])
                .font(.title)
                .multilineTextAlignment(.center)
                .padding()
                Text("Simple App")
                .font(.largeTitle)
                .bold()

            
            
            
            if showAnswer {
                Text(answers[currentIndex])
                    .font(.title2)
                    .foregroundColor(.blue)
            } else {
                Text("???")
                    .font(.title2)
                    .foregroundColor(.gray)
            }
            
            Button("Show Answer") {
                showAnswer = true
            }
            .buttonStyle(.borderedProminent)
            
            Button("Next Question") {
                currentIndex = (currentIndex + 1) % questions.count
                showAnswer = false
            }
            .buttonStyle(.bordered)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
