import SwiftUI

struct NotHungryView: View {
    var body: some View {
        VStack {
            Text("Not Hungry")
                .font(.largeTitle)
                .padding(.bottom, 20)

            Image("not_hungry_food")
                .resizable()
                .frame(width: 200, height: 200)
                .padding()

            Text("Maybe later!")
                .font(.title2)
                .padding(.top, 20)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.green.opacity(0.5))
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    NotHungryView()
}
