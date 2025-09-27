import SwiftUI

struct SecondTabView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Info Tab")
                .font(.largeTitle).bold()
            Text("This is the second tab (Chapter 4 Bronze Challenge).")
                .multilineTextAlignment(.center)
                .padding()
        }
        .padding()
    }
}

#Preview {
    SecondTabView()
}