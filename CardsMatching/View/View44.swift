//
//  44View.swift
//  CardsMatching
//
//  Created by HAHA on 29/8/2021.
//

import SwiftUI

struct View44: View {
    @EnvironmentObject var vm: ViewModel
    let columns: [GridItem] = [GridItem(.flexible(), spacing: nil), GridItem(.flexible(), spacing: nil), GridItem(.flexible(), spacing: nil), GridItem(.flexible())]
    @Environment(\.presentationMode) var presentationMode
    let width: CGFloat = UIScreen.main.bounds.size.width / 3
    let color = Color.theme
    
    var body: some View {
        ZStack{
            color.background.ignoresSafeArea()
            
            VStack {
                HStack{
                    Button(action: {
                        vm.gameReset()
                    }, label: {
                        Image(systemName: "arrow.clockwise")
                            .font(.title2)
                            .padding()
                    })
                    
                    Spacer()
                    
                    VStack{
                        Text("4x4")
                            .font(.headline)
                            .fontWeight(.bold)
                        Image(systemName: "circle.grid.cross")
                    }
                    .foregroundColor(.white)
                    
                    Spacer()
                    
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "xmark")
                            .font(.title2)
                            .padding()
                    })
                }
                
                LazyVGrid(columns: columns, content: {
                    ForEach(vm.cardsModel2) { model in
                        CardView(model: model)
                    }
                })
                .padding(.all, 10)
            }
        }
        .alert(isPresented: $vm.gameCompleted, content: {
            Alert(title: Text("All cards are matched!"), primaryButton: .cancel(), secondaryButton: .default(Text("Play again"), action: {
                vm.gameReset()
            }))
        })
        .navigationBarItems(trailing: Button(action: {
            vm.shuffleCardsModel2()
        }, label: {
            Image(systemName: "arrow.clockwise")
                .font(.title2)
        }))
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct View44_Previews: PreviewProvider {
    static var previews: some View {
        View44()
    }
}
