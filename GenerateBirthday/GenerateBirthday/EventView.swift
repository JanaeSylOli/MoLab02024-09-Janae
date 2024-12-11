//
//  EventView.swift
//  GenerateBirthday
//
//  Created by Janae  Sylvester Oliver on 12/11/24.
//

import SwiftUI

struct EventView: View {
    let event: Event

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(event.name)
                .font(.largeTitle)
                .bold()

            Text(event.description)
                .font(.title2)

            Text("Starts: \(event.start, formatter: Date.formatter)")
                .font(.title2)

            Text("Ends: \(event.end, formatter: Date.formatter)")
                .font(.title2)

            if let url = URL(string: event.url) {
                Link("Event Website", destination: url)
                    .font(.title2)
                    .foregroundColor(.blue)
            }

            Spacer()
        }
        .padding()
        .navigationTitle("Event Details")
    }
}
