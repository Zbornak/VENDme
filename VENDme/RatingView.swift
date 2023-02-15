//
//  RatingView.swift
//  VENDme
//
//  Created by Mark Strijdom on 15/02/2023.
//

import SwiftUI

struct RatingView: View {
    @Binding var rating: Double
    var label = ""
    var maximumRating = 5.0
    var offImage = Image(systemName: "star")
    var halfImage = Image(systemName: "star.leadinghalf.filled")
    var onImage = Image(systemName: "star.fill")
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: .constant(4.0))
    }
}
