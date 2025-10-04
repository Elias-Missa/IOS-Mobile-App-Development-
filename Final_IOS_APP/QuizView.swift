import SwiftUI

struct QuizView: View {
    let questions: [String]
    let answers: [String]

    @Binding var currentIndex: Int
    @Binding var showAnswer: Bool

    var body: some View {
        VStack(spacing: 24) {
            Text(questions[currentIndex])
                .font(.title)
                .multilineTextAlignment(.center)
                .padding(.horizontal)

            if showAnswer {
                Text(answers[currentIndex])
                    .font(.title2)
                    .bold()
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
    StatefulPreviewWrapper((0, false)) { state in
        QuizView(
            questions: ["What is 2 + 2?", "Capital of France?"],
            answers: ["4", "Paris"],
            currentIndex: state.binding(\.0),
            showAnswer: state.binding(\.1)
        )
    }
}

struct StatefulPreviewWrapper<Value, Content: View>: View {
    @State private var value: Value
    private let content: (Binding<Value>) -> Content

    init(_ initialValue: Value, @ViewBuilder content: @escaping (Binding<Value>) -> Content) {
        self._value = State(initialValue: initialValue)
        self.content = content
    }

    var body: some View {
        content($value)
    }
}

extension Binding {
    func binding<T>(_ keyPath: WritableKeyPath<Value, T>) -> Binding<T> {
        Binding<T>(
            get: { self.wrappedValue[keyPath: keyPath] },
            set: { self.wrappedValue[keyPath: keyPath] = $0 }
        )
    }
}