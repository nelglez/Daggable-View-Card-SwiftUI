//
//  ContentView.swift
//  Daggable-View-Card
//
//  Created by Nelson Gonzalez on 7/30/20.
//  Copyright © 2020 Nelson Gonzalez. All rights reserved.
//https://medium.com/better-programming/how-to-create-a-draggable-card-in-swiftui-86387397071d

import SwiftUI

struct ContentView: View {
    //I have the variable height as the screen height multiplied by 0.9. This will offset our view to be at the bottom 10% of our screen.
    @State private var offset = CGSize(width: 0, height: UIScreen.main.bounds.height * 0.9)
    
    var body: some View {
        GeometryReader { geometry in
            Color(.yellow).edgesIgnoringSafeArea(.all)
            
            CardView().offset(self.offset).animation(.spring()).gesture(DragGesture().onChanged { gesture in
                //Inside .onChanged, assign the offset height to the gesture translation height. This will allow our card to be dragged up and down and not to the sides
                self.offset.height = gesture.translation.height
                
                //If the view covers 85 % of it leave it where it is, dont go beyond that.
                if self.offset.height == geometry.size.height * 15 {
                    self.offset.height = geometry.size.height * 0.15
                } else {
                
                    self.offset.height = geometry.size.height * 0.15
                }
                }.onEnded {
                    //check if the gesture translation is at the bottom 50% of the view or the top 50% of the view using the GeometryReader proxy values. If the gesture is at the bottom 50%, then offset the card to cover 85% of the view by multiplying the geometry size height by 0.15. Otherwise, return the view to the bottom by multiplying the geometry size height by 0.9 to make the view once again cover only 10%.
                    
                    if $0.translation.height < geometry.size.height * 0.5 {
                    self.offset.height = geometry.size.height * 0.15
                    } else {
                    self.offset.height = geometry.size.height * 0.9
                    }
                    
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
