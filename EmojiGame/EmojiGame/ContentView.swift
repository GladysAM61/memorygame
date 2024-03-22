//
//  ContentView.swift
//  EmojiGame
//
//  Created by StudentAM on 3/12/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            ZStack{
                Image("pink")
                VStack {
                    //                making the emojimatch text a button to get like a border
                    Text("Emoji Match")
                        .frame(width: 350, height: 100)
                        .font(.system(size:60))
                        .foregroundColor(.white)
//                    .opactity makes the color kind of transperant 
                        .background(Color.pink.opacity(0.5))
                        .cornerRadius(10)
                    
                    Spacer()
                    //                .frame creates a certain amount or size of spacing
                        .frame(height : 280)
//                    creating a link so it takes  the player to the next page
//                    in this case it would be the gameview file
                    NavigationLink(destination: Gameview().navigationBarBackButtonHidden(true), label: {
                        Text("Start")
                            .frame(width: 100, height: 80)
                            .background(Color.pink.opacity(0.7))
                            .foregroundColor(.white)
                            .font(.system(size:30))
                            .cornerRadius(10)
                    })
                    
                }
                .padding()
            }
        }
    }
}

#Preview {
    ContentView()
}
