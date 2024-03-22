//
//  circleView.swift
//  EmojiGame
//
//  Created by StudentAM on 3/15/24.
//

import SwiftUI

struct circleView: View {
    var emoji : String
    var isFlipped: Bool
    
    var body: some View {
      
        ZStack{
//making just one button
            Circle()
//            if the card is not flipped make it gray if it is then make it a clear like color pink 
                .fill(isFlipped == false ? Color(UIColor.lightGray) : Color.pink.opacity(0.1))
                .frame(width: 80, height: 80 )
//            if the card is flipped make the inner text the emoji
            if isFlipped == true{
                Text("\(emoji)")
            }
         }
        }
    }

#Preview {
    circleView(emoji: "🎀", isFlipped: true)
}
