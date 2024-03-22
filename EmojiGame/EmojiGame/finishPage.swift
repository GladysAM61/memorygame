//
//  finishPage.swift
//  EmojiGame
//
//  Created by StudentAM on 3/13/24.
//

import SwiftUI

struct finishPage: View {
    var body: some View {
        NavigationView{
            ZStack{
                Image("background2")
                    .resizable()
                    .frame(height:900)
                VStack{
                    Text("😁")
                        .font(.system(size:190))
                    Text("Great Job!")
                        .font(.system(size:65))
                    HStack{
                        NavigationLink(destination:
                                        //            .navigationBarBackButtonHidden(true) to hide the back button
                                       ContentView().navigationBarBackButtonHidden(true), label: {
                            Text("Home")
                                .frame(width: 150, height: 80)
                                .background(Color.pink.opacity(0.7))
                                .foregroundColor(.white)
                                .font(.system(size:30))
                                .cornerRadius(10)
                        })
                        NavigationLink(destination: Gameview().navigationBarBackButtonHidden(true), label: {
                            Text("Play Again")
                                .frame(width: 170, height: 80)
                                .background(Color.pink.opacity(0.7))
                                .foregroundColor(.white)
                                .font(.system(size:30))
                                .cornerRadius(10)
                        })
                    }
                }
            }
        }
    }
}

#Preview {
    finishPage()
}
