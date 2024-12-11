//
//  PlaceView.swift
//  GenerateBirthday
//
//  Created by Janae  Sylvester Oliver on 12/11/24.
//

import SwiftUI

struct PlaceView: View {
    let place: Place

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(place.name)
                .font(.largeTitle)
                .bold()

            Text("Location: \(place.location)")
                .font(.title2)

            Text("Budget: \(place.budget) USD")
                .font(.title2)

            Text("Description: \(place.description)")
                .font(.title2)

            Text("Time: \(place.time)")
                .font(.title2)

            if let website = place.website, let url = URL(string: website) {
                Link("Visit Website", destination: url)
                    .font(.title2)
                    .foregroundColor(.blue)
            }

            Spacer()
        }
        .padding()
        .navigationTitle("Place Details")
    }
}
