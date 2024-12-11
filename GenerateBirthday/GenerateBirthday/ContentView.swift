//
//  ContentView.swift
//  GenerateBirthday
//
//  Created by Janae  Sylvester Oliver on 12/11/24.

import SwiftUI

struct ContentView: View {
    @ObservedObject var savedPlansViewModel = SavedPlansViewModel()

    var body: some View {
        NavigationView {
            Sidebar()
            HomeView(viewModel: savedPlansViewModel) // Default view on load
        }
    }
}

struct Sidebar: View {
    @ObservedObject var savedPlansViewModel = SavedPlansViewModel()

    var body: some View {
        List {
            NavigationLink(destination: HomeView(viewModel: savedPlansViewModel)) {
                Label("Home", systemImage: "house")
            }
            NavigationLink(destination: BirthdayPlanGeneratorView(viewModel: savedPlansViewModel)) {
                Label("Plan Generator", systemImage: "calendar")
            }
            NavigationLink(destination: SavedPlansView(viewModel: savedPlansViewModel)) {
                Label("Saved Plans", systemImage: "folder")
            }
        }
        .listStyle(SidebarListStyle())
        .navigationTitle("Menu")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



#Preview {
    ContentView()
}
