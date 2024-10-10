import SwiftUI

struct RandomNumbersView: View {
    // Array to hold randomly generated numbers as strings
    let numberArray = (0..<20).map { _ in "\(Int.random(in: 1...100))" }

    var body: some View {
        NavigationView {
            List {
                ForEach(0 ..< numberArray.count, id: \.self) { index in
                    let item = numberArray[index]
                    NavigationLink {
                        VStack {
                            Text(item)
                                .font(.system(size: 100, weight: .bold))
                                .padding()
                            Text("Random Number #\(index + 1)")
                                .font(.headline)
                            Spacer()
                        }
                        .padding()
                    } label: {
                        HStack {
                            Text(item)
                                .font(.system(size: 50, weight: .bold))
                            Text("Random Number #\(index + 1)")
                            Spacer()
                        }
                    }
                }
            }
            .navigationTitle("Random Numbers")
        }
    }
}

// Preview
#Preview {
    RandomNumbersView()
}
