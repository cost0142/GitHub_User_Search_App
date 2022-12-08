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
    
    @State var userSerachResultsViewIsPresented = false
    @State var searchTerm = ""
    
    @State var userList = [User]()
    

    
    // Add SEARCH Bar
    // Create Search Button
    // Creat "search Var" to Catch Input to SEARCH
    // Pass "search Var" into Fetch Func
    // Creat Navigation for UserSearchResultsView
    
    //     Search Screen - Git Hub
    
    
    
    var body: some View {
        NavigationStack {
            VStack (alignment: .leading){
                // Name
                HStack (spacing: 66){
                    Text("Name : ")
                    TextField("Search name", text: $searchTerm)
                        .frame(width: 150)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .foregroundColor(Color.darkGray)
                        .fixedSize()
                }
                .padding()
                
                Button("Search"){
                    print(" button Working")
                                            searchGitHub()

                    }
                .buttonStyle(.bordered)
                                  .tint(Color.lightGreen)
                                  .controlSize(.large)
                                  .padding(.top)
                }.toolbar(content: {
                    ToolbarItem(placement: .navigationBarTrailing, content: {
                        Button(action: {
                            settingsViewIsPresented.toggle()
                            
                        }, label: {
                            Image(systemName: "gearshape.2" )
                                .font(.system(size: 25))
                        })
                    })
                    ToolbarItem(placement: .navigationBarLeading, content: {
                        Button(action: {
                            debugPrint("About Button")
                            aboutViewIsPresented.toggle()
                        }, label: {
                            Image(systemName: "person.crop.circle.fill.badge.questionmark" )
                                .font(.system(size: 25))
                        })
                    })
                })
                .navigationDestination(isPresented: $settingsViewIsPresented, destination: {
                    AppSettingsView()
                })
                .navigationDestination(isPresented: $aboutViewIsPresented, destination: {
                    AboutView()
                })
                .navigationDestination(isPresented: $userSerachResultsViewIsPresented, destination: {
                    UserSearchResultsView(users: userList)
                })
                .onAppear{

                }
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
            //    let myUrl = "https://api.github.com/search/users?q=ios"
            
           
            @AppStorage("resultsPerPage") var resultsPerPage: Int = 25
            @AppStorage("minNumberOfRepos") var minNumberOfRepos: Int = 10
            @AppStorage("minNumberOfFollowers") var minNumberOfFollowers: Int = 10
            
            

            
            var myUrlComponents = URLComponents(string: "https://api.github.com")!
            
            myUrlComponents.path = "/search/users"
            
            let searchTermQuery = URLQueryItem(name: "q", value: searchTerm)
            let perPageQuery = URLQueryItem(name: "per_page", value: String (resultsPerPage))
            let repoQuery = URLQueryItem(name: "repos", value: String (minNumberOfRepos ))
            let followeQuery = URLQueryItem(name: "followers", value: String (minNumberOfFollowers))
        
                   myUrlComponents.queryItems = [
                    searchTermQuery, perPageQuery, repoQuery, followeQuery
                   ]
            
            
            AF.request(myUrlComponents)
                .validate(statusCode: 200..<300)
                .responseDecodable(of: UserSearchResponseModel.self) {
                    response in
                    
                    switch response.result {

                    case .failure(let error):

                        debugPrint(error)
                        
                        if let msg = error.errorDescription {
                            print(msg)
                        } else {
                            print("dunno wtf happened brol!!")
                        }
                        
                    case .success(let value):
                        
                        if value.users.count != 0 {
                            self.userList = value.users
                            
                            DispatchQueue.main.async {
                                userSerachResultsViewIsPresented.toggle()
                            }
                        } else {
                            print("No results founf. ")
                        }
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
