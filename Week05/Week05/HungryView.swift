import SwiftUI

struct HungryView: View {
    var body: some View {
        VStack {
            Text("Hungry")
                .font(.largeTitle)
                .padding(.bottom, 20)

            Image("hungry_food")
                .resizable()
                .frame(width: 200, height: 200)
                .padding()

            Text("Enjoy your meal!")
                .font(.title2)
                .padding(.top, 20)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.yellow.opacity(0.5))
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    HungryView()
}
