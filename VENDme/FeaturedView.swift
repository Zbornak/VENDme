//
//  FeaturedView.swift
//  VENDme
//
//  Created by Mark Strijdom on 15/02/2023.
//

import SwiftUI

struct FeaturedView: View {
    var body: some View {
        VStack {
            Text("Featured vending machines")
        }
        .navigationTitle("Featured")
    }
}

struct FeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedView()
    }
}
