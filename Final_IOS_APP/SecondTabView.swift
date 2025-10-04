import SwiftUI

struct SecondTabView: View {
    @State private var input = ""

    var body: some View {
        VStack(spacing: 20) {
            Text("Info Tab")
                .font(.largeTitle).bold()

            Text("Chapter 6 Bronze — Disallow Alphabetic Characters")
                .multilineTextAlignment(.center)

            VStack(alignment: .leading, spacing: 8) {
                Text("Enter a number:")
                    .font(.headline)

                TextField("e.g. 98.6", text: $input)
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.decimalPad)
                    .onChange(of: input) { old, newValue in
                        input = filterNumericInput(newValue)
                    }

                Text("Accepted: digits and one locale decimal separator")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
            .padding()

            Spacer()
        }
        .padding()
    }

    // digits + single locale decimal separator; letters dropped
    private func filterNumericInput(_ text: String) -> String {
        let sep = Locale.current.decimalSeparator ?? "."
        var result = ""
        var sawSeparator = false

        for scalar in text.unicodeScalars {
            if CharacterSet.decimalDigits.contains(scalar) {
                result.unicodeScalars.append(scalar)
            } else if String(scalar) == sep {
                if !sawSeparator {
                    if result.isEmpty { result = "0" }  // ".5" -> "0.5"
                    result += sep
                    sawSeparator = true
                }
            }
            // ignore everything else (letters, spaces, symbols)
        }
        return result
    }
}

#Preview {
    SecondTabView()
}
