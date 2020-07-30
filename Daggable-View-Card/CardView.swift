//
//  CardView.swift
//  Daggable-View-Card
//
//  Created by Nelson Gonzalez on 7/30/20.
//  Copyright © 2020 Nelson Gonzalez. All rights reserved.
//

import SwiftUI

struct CardView: View {
    var body: some View {
        ZStack {
            Color(.orange)
            VStack {
                Text("Hi there!").font(.system(size: 30)).bold()
                Text("Welcome to the bottom view.")
            }
        }.clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
