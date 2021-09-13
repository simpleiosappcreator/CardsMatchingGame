//
//  ViewModel.swift
//  CardsMatching
//
//  Created by HAHA on 29/8/2021.
//

import Foundation
import SwiftUI

class ViewModel: ObservableObject{
    @Published var cardsModel1: [CardModel] = [
        CardModel(cardName: "pencil", imageName: "pencil", backgroundColor: Color(#colorLiteral(red: 0, green: 0.9914394021, blue: 1, alpha: 1)), isFirstCard: false, isSecondCard: false, isCompleting: false, isCompleted: false),
        CardModel(cardName: "pencil", imageName: "pencil", backgroundColor: Color(#colorLiteral(red: 0, green: 0.9914394021, blue: 1, alpha: 1)), isFirstCard: false, isSecondCard: false, isCompleting: false, isCompleted: false),
        CardModel(cardName: "heart", imageName: "heart", backgroundColor: Color.orange, isFirstCard: false, isSecondCard: false, isCompleting: false, isCompleted: false),
        CardModel(cardName: "heart", imageName: "heart", backgroundColor: Color.orange, isFirstCard: false, isSecondCard: false, isCompleting: false, isCompleted: false),
        CardModel(cardName: "clock", imageName: "clock", backgroundColor: Color.yellow, isFirstCard: false, isSecondCard: false, isCompleting: false, isCompleted: false),
        CardModel(cardName: "clock", imageName: "clock", backgroundColor: Color.yellow, isFirstCard: false, isSecondCard: false, isCompleting: false, isCompleted: false),
        CardModel(cardName: "cart", imageName: "cart", backgroundColor: Color.green, isFirstCard: false, isSecondCard: false, isCompleting: false, isCompleted: false),
        CardModel(cardName: "cart", imageName: "cart", backgroundColor: Color.green, isFirstCard: false, isSecondCard: false, isCompleting: false, isCompleted: false),
        CardModel(cardName: "tortoise", imageName: "tortoise", backgroundColor: Color(#colorLiteral(red: 1, green: 0.2527923882, blue: 1, alpha: 1)), isFirstCard: false, isSecondCard: false, isCompleting: false, isCompleted: false),
        CardModel(cardName: "tortoise", imageName: "tortoise", backgroundColor: Color(#colorLiteral(red: 1, green: 0.2527923882, blue: 1, alpha: 1)), isFirstCard: false, isSecondCard: false, isCompleting: false, isCompleted: false),
        CardModel(cardName: "person", imageName: "person", backgroundColor: Color.purple, isFirstCard: false, isSecondCard: false, isCompleting: false, isCompleted: false),
        CardModel(cardName: "person", imageName: "person", backgroundColor: Color.purple, isFirstCard: false, isSecondCard: false, isCompleting: false, isCompleted: false)
    ]
    @Published var cardsModel2: [CardModel] = [
        CardModel(cardName: "pencil", imageName: "pencil", backgroundColor: Color(#colorLiteral(red: 0, green: 0.9914394021, blue: 1, alpha: 1)), isFirstCard: false, isSecondCard: false, isCompleting: false, isCompleted: false),
        CardModel(cardName: "pencil", imageName: "pencil", backgroundColor: Color(#colorLiteral(red: 0, green: 0.9914394021, blue: 1, alpha: 1)), isFirstCard: false, isSecondCard: false, isCompleting: false, isCompleted: false),
        CardModel(cardName: "heart", imageName: "heart", backgroundColor: Color.orange, isFirstCard: false, isSecondCard: false, isCompleting: false, isCompleted: false),
        CardModel(cardName: "heart", imageName: "heart", backgroundColor: Color.orange, isFirstCard: false, isSecondCard: false, isCompleting: false, isCompleted: false),
        CardModel(cardName: "clock", imageName: "clock", backgroundColor: Color.yellow, isFirstCard: false, isSecondCard: false, isCompleting: false, isCompleted: false),
        CardModel(cardName: "clock", imageName: "clock", backgroundColor: Color.yellow, isFirstCard: false, isSecondCard: false, isCompleting: false, isCompleted: false),
        CardModel(cardName: "cart", imageName: "cart", backgroundColor: Color.green, isFirstCard: false, isSecondCard: false, isCompleting: false, isCompleted: false),
        CardModel(cardName: "cart", imageName: "cart", backgroundColor: Color.green, isFirstCard: false, isSecondCard: false, isCompleting: false, isCompleted: false),
        CardModel(cardName: "tortoise", imageName: "tortoise", backgroundColor: Color(#colorLiteral(red: 1, green: 0.2527923882, blue: 1, alpha: 1)), isFirstCard: false, isSecondCard: false, isCompleting: false, isCompleted: false),
        CardModel(cardName: "tortoise", imageName: "tortoise", backgroundColor: Color(#colorLiteral(red: 1, green: 0.2527923882, blue: 1, alpha: 1)), isFirstCard: false, isSecondCard: false, isCompleting: false, isCompleted: false),
        CardModel(cardName: "person", imageName: "person", backgroundColor: Color.purple, isFirstCard: false, isSecondCard: false, isCompleting: false, isCompleted: false),
        CardModel(cardName: "person", imageName: "person", backgroundColor: Color.purple, isFirstCard: false, isSecondCard: false, isCompleting: false, isCompleted: false),
        CardModel(cardName: "house", imageName: "house", backgroundColor: Color.pink, isFirstCard: false, isSecondCard: false, isCompleting: false, isCompleted: false),
        CardModel(cardName: "house", imageName: "house", backgroundColor: Color.pink, isFirstCard: false, isSecondCard: false, isCompleting: false, isCompleted: false),
        CardModel(cardName: "moon", imageName: "moon", backgroundColor: Color(#colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)), isFirstCard: false, isSecondCard: false, isCompleting: false, isCompleted: false),
        CardModel(cardName: "moon", imageName: "moon", backgroundColor: Color(#colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)), isFirstCard: false, isSecondCard: false, isCompleting: false, isCompleted: false),
    ]
    @Published var cardsModel1IsChosen: Bool = false
    @Published var firstCardOpened: Bool = false
    @Published var secondCardOpened: Bool = false
    @Published var pairCards: [CardModel] = []
    @Published var waitingForCompletion: Bool = false
    @Published var accumulativeFinishedPairCardsCount: Int = 0
    @Published var gameCompleted: Bool = false
    @Published var reset: Bool = false
    @Published var modelIndex: Int = 0
    let hapticService = HapticManger.instance
    
    init(){
        shuffleCardsModel1()
        shuffleCardsModel2()
        gameReset()
    }
    
    func shuffleCardsModel1(){
        cardsModel1.shuffle()
    }
    
    func shuffleCardsModel2(){
        cardsModel2.shuffle()
    }
    
    func addOpenCard(model: CardModel){
        if !waitingForCompletion{
            if !firstCardOpened{
                withAnimation(.spring()) {
                    updateFirstCardIsOpened(model: model)
                    pairCards.append(cardsModel1IsChosen ? cardsModel1[modelIndex] : cardsModel2[modelIndex])
                    firstCardOpened = true
                }
            }else if firstCardOpened && !secondCardOpened{
                withAnimation(.spring()) {
                    updateSecondCardIsOpened(model: model)
                    pairCards.append(cardsModel1IsChosen ? cardsModel1[modelIndex] : cardsModel2[modelIndex])
                    secondCardOpened = true
                    checkPairCradsMatchResult()
                }
            }
        }
    }
    
    func checkPairCradsMatchResult(){
        if pairCards[0].cardName == pairCards[1].cardName{
            if self.cardsModel1IsChosen{
                guard let index1 = self.cardsModel1.firstIndex(where: {$0.id == self.pairCards[0].id}),
                      let index2 = self.cardsModel1.firstIndex(where: {$0.id == self.pairCards[1].id}) else{return}
                self.cardsModel1[index1] = self.pairCards[0].updateIsCompleting()
                self.cardsModel1[index2] = self.pairCards[1].updateIsCompleting()
                self.waitingForCompletion = true
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {[weak self] in
                    guard let self = self else{return}
                    withAnimation(.spring()) {
                        self.cardsModel1[index1] = self.cardsModel1[index1].updateIsCompleting()
                        self.cardsModel1[index2] = self.cardsModel1[index2].updateIsCompleting()
                        self.cardsModel1[index1] = self.cardsModel1[index1].updateIsCompleted()
                        self.cardsModel1[index2] = self.cardsModel1[index2].updateIsCompleted()
                        self.waitingForCompletion = false
                    }
                }
            }else{
                guard let index1 = self.cardsModel2.firstIndex(where: {$0.id == self.pairCards[0].id}),
                      let index2 = self.cardsModel2.firstIndex(where: {$0.id == self.pairCards[1].id}) else{return}
                self.cardsModel2[index1] = self.pairCards[0].updateIsCompleting()
                self.cardsModel2[index2] = self.pairCards[1].updateIsCompleting()
                self.waitingForCompletion = true
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {[weak self] in
                    guard let self = self else{return}
                    withAnimation(.spring()) {
                        self.cardsModel2[index1] = self.cardsModel2[index1].updateIsCompleting()
                        self.cardsModel2[index2] = self.cardsModel2[index2].updateIsCompleting()
                        self.cardsModel2[index1] = self.cardsModel2[index1].updateIsCompleted()
                        self.cardsModel2[index2] = self.cardsModel2[index2].updateIsCompleted()
                        self.waitingForCompletion = false
                    }
                }
            }
            
            withAnimation(.spring()) {
                self.firstCardOpened = false
                self.secondCardOpened = false
            }
            
            self.hapticService.notification(type: .success)
            self.accumulativeFinishedPairCardsCount += 2
            self.pairCards = []
            self.gameCompleted = self.cardsModel1IsChosen ? (self.accumulativeFinishedPairCardsCount == 12 ? true : false) : (self.accumulativeFinishedPairCardsCount == 16 ? true : false)
        }else{
            hapticService.notification(type: .warning)
        }
    }
    
    func untapped(model: CardModel){
        //case: going to untap the first card of pair when second card is not tapped
        if model.isFirstCard && !secondCardOpened{
            withAnimation(.spring()) {
                updateFirstCardIsOpened(model: model)
                firstCardOpened = false
                pairCards = []
            }
        }//case: going to uptap the second card of pair
        else if firstCardOpened && model.isSecondCard{
            withAnimation(.spring()) {
                updateSecondCardIsOpened(model: model)
                secondCardOpened = false
                pairCards.remove(at: 1)
            }
        }
    }
    
    func gameReset(){
        withAnimation(.spring()) {
            reset = true
            firstCardOpened = false
            secondCardOpened = false
            pairCards = []
            accumulativeFinishedPairCardsCount = 0
            if cardsModel1IsChosen{
                for i in 0..<cardsModel1.count{
                    cardsModel1[i] = CardModel(cardName: cardsModel1[i].cardName, imageName: cardsModel1[i].imageName, backgroundColor: cardsModel1[i].backgroundColor, isFirstCard: false, isSecondCard: false, isCompleting: false, isCompleted: false)
                }
                shuffleCardsModel1()
            }else{
                for i in 0..<cardsModel2.count{
                    cardsModel2[i] = CardModel(cardName: cardsModel2[i].cardName, imageName: cardsModel2[i].imageName, backgroundColor: cardsModel2[i].backgroundColor, isFirstCard: false, isSecondCard: false, isCompleting: false, isCompleted: false)
                }
                shuffleCardsModel2()
            }
        }
        reset = false
    }
    
    func updateFirstCardIsOpened(model: CardModel){
        if cardsModel1IsChosen{
            guard let index = cardsModel1.firstIndex(where: {$0.id == model.id}) else{return}
            modelIndex = index
            cardsModel1[index] = model.updateIsFirstCard()
        }else{
            guard let index = cardsModel2.firstIndex(where: {$0.id == model.id}) else{return}
            modelIndex = index
            cardsModel2[index] = model.updateIsFirstCard()
        }
    }
    
    func updateSecondCardIsOpened(model: CardModel){
        if cardsModel1IsChosen{
            guard let index = cardsModel1.firstIndex(where: {$0.id == model.id}) else{return}
            modelIndex = index
            cardsModel1[index] = model.updateIsSecondCard()
        }else{
            guard let index = cardsModel2.firstIndex(where: {$0.id == model.id}) else{return}
            modelIndex = index
            cardsModel2[index] = model.updateIsSecondCard()
        }
    }
    
    func updateCardsAreCompleted(model: CardModel){
        if cardsModel1IsChosen{
            guard let index = cardsModel1.firstIndex(where: {$0.id == model.id}) else{return}
            modelIndex = index
            cardsModel1[index] = model.updateIsCompleted()
        }else{
            guard let index = cardsModel2.firstIndex(where: {$0.id == model.id}) else{return}
            modelIndex = index
            cardsModel2[index] = model.updateIsCompleted()
        }
    }
}
