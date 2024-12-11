//
//  NavigationWrapper.swift
//  BirthdayPlanGenerator
//
//  Created by Janae  Sylvester Oliver on 12/10/24.
//
import SwiftUI

struct NavigationWrapper<Content: View>: View {
    @State private var isMenuOpen = false
    let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        NavigationView {
            ZStack {
                content
                    .navigationBarItems(leading: Button(action: {
                        self.isMenuOpen.toggle()
                    }) {
                        Image(systemName: "line.horizontal.3")
                    })
                if isMenuOpen {
                    MenuView(isMenuOpen: $isMenuOpen)
                        .transition(.move(edge: .leading))
                }
            }
        }
    }
}

