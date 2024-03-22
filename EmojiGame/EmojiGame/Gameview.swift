//
//  Gameview.swift
//  EmojiGame
//
//  Created by StudentAM on 3/13/24.
//

import SwiftUI

struct Gameview: View {
    @State var count : Int = 0
//-1 so it can start befre the array because if you set it equal to 2
     @State var card1 : Int = -1
     @State var card2 : Int = -1
//        array is going to help us keep count of the cards flipped
     @State var cardsFlipped: [Bool] = Array(repeating: false, count: 16)
     var column : [GridItem] = [
//            spacing at 50
         GridItem(.fixed(50),spacing:35 , alignment: nil),
         GridItem(.fixed(50),spacing:35 , alignment: nil),
         GridItem(.fixed(50),spacing:35 , alignment: nil),
         GridItem(.fixed(50),spacing:35 , alignment: nil)
     ]
     @State var emojis: [String] = [
         "🎀","🌸","👛","🎟️",
         "💗","🩷","🩰","🛍️",
         "🎟️","🩷","🎀","💗",
         "👛","🌸","🛍️","🩰"
     ].shuffled()
     @State var gameFinished: Bool = false

    var body: some View {

        NavigationView{
            
            ZStack{
                Image("backgroundpink")
                    .resizable()
                    .frame(width: 900, height:900)
                VStack{
                    Text("Current Score: \(count)")
                        .font(.system(size:40))
                    Spacer()
                    //                .frame creates a certain amount or size of spacinmg
                        .frame(height : 30)
                    //                    ZStack{
                    
                    LazyVGrid(columns: column){
                            ForEach(emojis.indices, id:\.self){ index in
//                                making them buttons
                                Button(action: {cardTapped(index:index)}, label: {
                                    circleView(emoji: "\(emojis[index])", isFlipped: cardsFlipped[index])
                                })
                                
                            }
                        
                        }
                        Spacer()
                            .frame(height : 40)
//                    if they finish the game then show the buttons
                    if gameFinished == true{
//                        if the game ends shuffle the array
//                        emojis.shuffle()
                        HStack{
//    navigationview barbackbuttonhidden hides the back button
//          creating a link so it takes  the player to the next page
//        in this case it would be the finishpage file
                            NavigationLink(destination:finishPage().navigationBarBackButtonHidden(true), label: {
                                Text("Next")
                                    .frame(width: 100, height: 80)
                                    .background(Color.pink.opacity(0.7))
                                    .foregroundColor(.white)
                                    .font(.system(size:30))
                                    .cornerRadius(10)
                            })
                            //    navigationview barbackbuttonhidden hides the back button
                            //          creating a link so it takes  the player to the next page
                            //        in this case it would be the gameview file so the player can play again 
                            NavigationLink(destination:Gameview().navigationBarBackButtonHidden(true), label: {
                                Text("Retry")
                                    .frame(width: 100, height: 80)
                                    .background(Color.pink.opacity(0.7))
                                    .foregroundColor(.white)
                                    .font(.system(size:30))
                                    .cornerRadius(10)
                            })
                        }
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
          }
        }
//    creating a function for the button to work and change the index to true if its clicked
    func cardTapped(index:Int){
//        changes the index of the array of false statements to true
//        cards flipped is an array with 16 false statements
//        pick 1 and pick 2 are going to be equal to the card picked
//        if either are -1 then go into the if statement and check which one is -1
            if card1 == -1 || card2 == -1{
                if card1 == -1{
                    card1 = index
                    cardsFlipped[card1] = true
                }else{
                    card2 = index
                    cardsFlipped[card2] = true
                    //            the cards store a number which holds the number of the index
                    //            if the emojis are the same, add one to the count
                    //            if this code runs its because the count is greater than 1 so the cards are flipped
                    if emojis[card1] == emojis[card2]{
//                        cardsFlipped[card1] = true
//                        cardsFlipped[card2] = true
                        count += 1
                        card1 = -1
                        card2 = -1
                        if count == 8{
                            gameFinished = true
                        }
                    }else{
//                        this code gives seconds for the cards to freeaze, it this case it will be 0.8
                        DispatchQueue.main.asyncAfter(deadline: .now()+0.8){
                            cardsFlipped[card1] = false
                            cardsFlipped[card2] = false
                            card1 = -1
                            card2 = -1
                        }
                     }
                }
            }
    }
    

    
}

//}
#Preview {
    Gameview()
}
