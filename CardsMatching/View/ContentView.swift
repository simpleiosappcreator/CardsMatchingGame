//
//  ContentView.swift
//  CardsMatching
//
//  Created by HAHA on 29/8/2021.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm: ViewModel = ViewModel()
    let width: CGFloat = UIScreen.main.bounds.size.width / 3
    @State var show1Sheet: Bool = false
    @State var show2Sheet: Bool = false
    let color = Color.theme
    var body: some View {
        
        NavigationView {
            ZStack{
                color.background.ignoresSafeArea()
                
                VStack {
                    Text("Please choose a layout:")
                        .font(.title)
                        .fontWeight(.semibold)
                    
                    HStack{
                        Button(action: {
                            vm.cardsModel1IsChosen = true
                            show1Sheet.toggle()
                        }, label: {
                            VStack{
                                Text("4x3")
                                    .font(.headline)
                                    .fontWeight(.bold)
                                Image(systemName: "circle.grid.cross.down.fill")
                            }
                            .foregroundColor(.white)
                            .padding(.vertical)
                            .frame(width: width)
                            .background(Color.green.cornerRadius(15))
                            .fullScreenCover(isPresented: $show1Sheet, content: {
                                View43().environmentObject(self.vm)
                            })
                        })
                        .padding()
                        
                        Button(action: {
                            vm.cardsModel1IsChosen = false
                            show2Sheet.toggle()
                        }, label: {
                            VStack{
                                Text("4x4")
                                    .font(.headline)
                                    .fontWeight(.bold)
                                Image(systemName: "circle.grid.cross")
                            }
                            .foregroundColor(.white)
                            .padding(.vertical)
                            .frame(width: width)
                            .background(Color.red.cornerRadius(15))
                            .fullScreenCover(isPresented: $show2Sheet, content: {
                                View44().environmentObject(self.vm)
                            })
                        })
                        .padding()
                    }
                }
            }
            .navigationTitle("Crads matching!")
        }
        .environmentObject(vm)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
