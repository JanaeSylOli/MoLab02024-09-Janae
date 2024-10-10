import SwiftUI

struct RandomNumbers: View {
    // Array to hold randomly generated numbers
    let numbers = (1...20).map { _ in Int.random(in: 1...100) }

    var body: some View {
        NavigationView {
            List(numbers, id: \.self) { number in
                NavigationLink(destination: NumberView(number: number)) {
                    Text("Number: \(number)")
                        .font(.title2)
                }
            }
            .navigationTitle("Random Numbers")
        }
    }
}

struct NumberView: View {
    let number: Int

    var body: some View {
        VStack {
            Text("\(number)")
                .font(.system(size: 100, weight: .bold))
                .padding()
            Text("This is number \(number)")
                .font(.headline)
            Spacer()
        }
        .padding()
    }
}

// Preview
#Preview {
    RandomNumbers()
}
