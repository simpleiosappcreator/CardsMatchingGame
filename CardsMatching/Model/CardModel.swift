//
//  CardModel.swift
//  CardsMatching
//
//  Created by HAHA on 29/8/2021.
//

import Foundation
import SwiftUI

struct CardModel: Identifiable{
    var id = UUID().uuidString
    let cardName: String
    let imageName: String
    let backgroundColor: Color
    let isFirstCard: Bool
    let isSecondCard: Bool
    let isCompleting: Bool
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString, cardName: String, imageName: String, backgroundColor: Color, isFirstCard: Bool, isSecondCard: Bool, isCompleting: Bool, isCompleted: Bool){
        self.cardName = cardName
        self.imageName = imageName
        self.backgroundColor = backgroundColor
        self.isFirstCard = isFirstCard
        self.isSecondCard = isSecondCard
        self.isCompleting = isCompleting
        self.isCompleted = isCompleted
    }
    
    func updateIsFirstCard() -> CardModel{
        return CardModel(cardName: cardName, imageName: imageName, backgroundColor: backgroundColor, isFirstCard: !isFirstCard, isSecondCard: isSecondCard, isCompleting: isCompleting, isCompleted: isCompleted)
    }
    
    func updateIsSecondCard() -> CardModel{
        return CardModel(cardName: cardName, imageName: imageName, backgroundColor: backgroundColor, isFirstCard: isFirstCard, isSecondCard: !isSecondCard, isCompleting: isCompleting, isCompleted: isCompleted)
    }
    
    func updateIsCompleting() -> CardModel{
        return CardModel(cardName: cardName, imageName: imageName, backgroundColor: backgroundColor, isFirstCard: isFirstCard, isSecondCard: isSecondCard, isCompleting: !isCompleting, isCompleted: isCompleted)
    }
    
    func updateIsCompleted() -> CardModel{
        return CardModel(cardName: cardName, imageName: imageName, backgroundColor: backgroundColor, isFirstCard: isFirstCard, isSecondCard: isSecondCard, isCompleting: isCompleting, isCompleted: true)
    }
}
