//
//  ContentView.swift
//  hygor_Costa_Final
//
//  Created by Hygor Costa on 2022-11-30.


import SwiftUI
import Alamofire

struct ContentView: View {
  @State var aboutViewIsPresented = false
  @State var settingsViewIsPresented = false
   
  @State var userList = [User]()
   
    // Add SEARCH Bar
    // Create Search Button
    // Creat "search Var" to Catch Input to SEARCH
    // Pass "search Var" into Fetch Func
    // Creat Navigation for UserSearchResultsView
    
//     Search Screen - Git Hub
    
    
    
  var body: some View {
    NavigationStack{
      VStack {
        Image(systemName: "globe")
          .imageScale(.large)
          .foregroundColor(.accentColor)
        Text("Hello, world!")
      }.toolbar(content: {
        ToolbarItem(placement: .navigationBarTrailing, content: {
          Button(action: {
            print("Settings Button")
            settingsViewIsPresented.toggle()
             
          }, label: {
            Image(systemName: "gearshape.2" )
              .font(.system(size: 25))
          } )
        })
        ToolbarItem(placement: .navigationBarLeading, content: {
          Button(action: {
            debugPrint("About Button")
            aboutViewIsPresented.toggle()
          }, label: {
            Image(systemName: "person.crop.circle.fill.badge.questionmark" )
              .font(.system(size: 25))
          } )
        })
      })
      .navigationDestination(isPresented: $settingsViewIsPresented, destination: {
        AppSettingsView()
      })
      .navigationDestination(isPresented: $aboutViewIsPresented, destination: {
        AboutView()
      })
      .onAppear{searchGitHub()}
        
      .padding()
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}


extension ContentView {
  func searchGitHub() {
    let myUrl = "https://api.github.com/search/users?q=ios"
    AF.request(myUrl).responseDecodable(of: UserSearchResponseModel.self) {response in
     if let data = response.value {
      self.userList = data.users
      debugPrint(userList)
     }
    }
   }
}

extension Color {
    static let darkGray = Color(red: 22 / 255, green: 22 / 255, blue: 24 / 255)
    static let lightPink = Color(red: 251 / 255, green: 234 / 255, blue: 235 / 255)
    static let lightGreen = Color(red: 2 / 255, green: 139 / 255, blue: 139 / 255)
//    static let backGroudColor = Color(red: 102 / 255, green: 102 / 255, blue: 102 / 255)
}
