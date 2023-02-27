//
//  RatingView.swift
//  VENDme
//
//  Created by Mark Strijdom on 15/02/2023.
//

import SwiftUI

struct RatingView: View {
    @Binding var rating: Int
    @Binding var numberOfRatings: Int
    @Binding var userHasLeftRating: Bool
    
    var label = ""
    var maximumRating = 5
    var offImage = Image(systemName: "star")
    var onImage = Image(systemName: "star.fill")
    
    var body: some View {
        HStack {
            if label.isEmpty == false {
                Text(label)
            }
            
            ForEach(1..<maximumRating + 1, id: \.self) { number in
                image(for: number)
                    .onTapGesture {
                        rating = number
                        numberOfRatings += 1
                        userHasLeftRating = true
                }
            }
        }
    }
    
    func image (for number: Int) -> Image {
        if number > rating {
            return offImage
        } else {
            return onImage
        }
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: .constant(4), numberOfRatings: .constant(1), userHasLeftRating: .constant(true))
    }
}
