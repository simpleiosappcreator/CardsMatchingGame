//
//  CardView.swift
//  CardsMatching
//
//  Created by HAHA on 29/8/2021.
//

import SwiftUI

struct CardView: View {
    @EnvironmentObject var vm: ViewModel
    let cardWidth: CGFloat = (UIScreen.main.bounds.size.width - 50) / 4
    let cardHeight1: CGFloat = (UIScreen.main.bounds.size.height - 160) / 3
    let cardHeight2: CGFloat = (UIScreen.main.bounds.size.height - 160) / 4
    let model: CardModel
    let color = Color.theme
    
    var body: some View {
        ZStack{
            if model.isCompleted{
                ZStack{
                    Color.gray
                    
                    VStack(spacing: nil){
                        Text("C")
                        Text("o")
                        Text("m")
                        Text("p")
                        Text("l")
                        Text("e")
                        Text("t")
                        Text("e")
                        Text("d")
                    }
                    .font(.system(size: vm.cardsModel1IsChosen ? 15 : 11))
                    .foregroundColor(.white)
                }
                .opacity(0)
            }else{
                if !model.isFirstCard && !model.isSecondCard{
                    Color(#colorLiteral(red: 0.6679978967, green: 0.4751212597, blue: 0.2586010993, alpha: 1))
                        .onTapGesture {
                            vm.addOpenCard(model: model)
                        }
                }else{
                    ZStack{
                        model.backgroundColor
                        
                        Image(systemName: model.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                    .onTapGesture {
                        vm.untapped(model: model)
                    }
                }
            }
        }
        .frame(width: cardWidth, height: vm.cardsModel1IsChosen ? cardHeight1 : cardHeight2)
        .cornerRadius(15)
        .shadow(color: model.isFirstCard ? .red : color.background, radius: 15)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(model: CardModel(cardName: "moon", imageName: "moon", backgroundColor: Color(#colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)), isFirstCard: false, isSecondCard: false, isCompleting: false, isCompleted: false))
    }
}
