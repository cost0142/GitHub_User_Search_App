//
//  AboutView.swift
//  hygor_Costa_Final
//
//  Created by Hygor Costa on 2022-11-30.
//

import SwiftUI

// MARK: Properties ABOUT
struct AboutView: View {
    var body: some View {
        ScrollView{
            VStack{
                HStack{
                    Image("HygorFoto").resizable()
                        .frame(width: 150, height: 150)
                        .mask(Circle())
                        .padding(.top, 60)
                }
                .padding(.horizontal)
                .padding(.bottom,25)
                VStack{
                    Text("GitHub SearchApp")
                        .padding(.bottom, 5)
                    Text("Version : 1.0")
                        .padding(.bottom, 5)
                    Text("Created by Hygor Costa")
                        .padding(.bottom, 5)
                        .multilineTextAlignment(.center)
                    Text("MAD9137")
                        .padding(.bottom, 10)
                    VStack(alignment: .leading){
                        HStack{
                            Image(systemName: "envelope")
                            Link("cost0142@algonquinlive.com", destination: URL(string: "mailto:cost0142@algonquinlive.com")! )
                                .accentColor(.lightGreen)
                                .frame(width: 250)
                                .padding(.bottom, 2)
                        }
                        HStack{
                            Image(systemName: "link")
                            Link("https://github.com/cost0142", destination: URL(string: "https://github.com/cost0142")! )
                                .accentColor(.lightGreen)
                                .frame(width: 250)
                        }
                    }.padding(.bottom, 5)
                }
            }
        }
        //Back Ground Screen AboutView
        //        .frame(maxWidth:.infinity,maxHeight: .infinity)
        //        .background(SwiftUI.Color.backGroudColor.edgesIgnoringSafeArea(.all))
    }
}


struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
