//
//  reflection.swift
//  EmojiGame
//
//  Created by StudentAM on 3/21/24.
//

import SwiftUI

struct reflection: View {
    var body: some View {
        ZStack{
            
            VStack{
        Text("🎀 Reflection: 🎀")
            .font(.system(size:40))
            .frame(width: 600, height: 100)
            .cornerRadius(9)
                
         Spacer()
            .frame(height:120)
                
        Text("This assisgnment was very difficult and had many challenges. One of the challenges was flipping the button. I had created a circle and then tried to flip it. This ended up just complicating things so i just turned the circles into buttons. This solved my issue. Another problem i had was the count to actually increase if there was a matching pair. This issue took me a white to fix, however, i was able to update the count accordingly.")
           }
            .padding()
        }
        .background(Color.pink.opacity(0.08))
    }
}

#Preview {
    reflection()
}
