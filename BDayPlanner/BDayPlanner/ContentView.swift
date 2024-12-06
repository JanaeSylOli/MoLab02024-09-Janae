//
//  ContentView.swift
//  BDayPlanner
//
//  Created by Janae  Sylvester Oliver on 12/5/24.
//
import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationWrapper {
            VStack {
                Text("Welcome to BDay Planner!")
                    .font(.largeTitle)
                    .padding()
            }
        }
    }
}





#Preview {
    ContentView()
}
