import SwiftUI

struct RandomView: View {
    // Array to hold randomly generated numbers
    let numberArray = (0..<20).map { _ in "\(Int.random(in: 1...100))" }

    var body: some View {
        NavigationView {
            List {
                ForEach(numberArray.indices, id: \.self) { index in
                    let item = numberArray[index]
                    NavigationLink(destination: NumberView(number: item, index: index)) {
                        HStack {
                            Text(item)
                                .font(.system(size: 40, weight: .bold))
                                .padding()
                            Spacer()
                            Text("Item #\(index + 1)")
                                .font(.headline)
                                .foregroundColor(.secondary)
                        }
                        .padding(.vertical, 10)
                    }
                }
            }
            .navigationTitle("Random Numbers")
        }
    }
}

struct NumberView: View {
    let number: String
    let index: Int

    var body: some View {
        VStack {
            Text("Details for Random Number")
                .font(.title)
                .padding(.bottom, 20)
            
            Text(number)
                .font(.system(size: 80, weight: .bold))
                .padding()
            
            Text("This is item number \(index + 1) in the list.")
                .font(.headline)
                .padding(.top, 10)

            Spacer()
        }
        .navigationTitle("Number \(index + 1)")
        .padding()
    }
}
struct SimpleView_Previews: PreviewProvider {
    static var previews: some View {
        RandomView()
    }
}


