//
//  UserDetailsView.swift
//  hygor_Costa_Final
//
//  Created by Hygor Costa on 2022-11-30.
//

import SwiftUI
import Alamofire

struct UserDetailsView: View {
    @State var user: UserDetails?
    @State var isDataLoaded = false
    @State var url: String
    
    var body: some View {
        VStack { if isDataLoaded {
            if let user{
                AsyncImage(url: URL(string: user.avatarUrl)!){ image in
                    image.resizable()
                        .frame(width: 250, height: 250)
                } placeholder: {
                    // Placeholder Image
                    Image(systemName: "icloud.and.arrow.down.fill")
                        .font(.system(size: 60))
                }
                
                Link(user.userUrl, destination: URL(string: user.userUrl)!)
                    .padding(1)
                
                if let name = user.username{
                    Text("Name: \(name)")
                        .padding(1)
                } else {
                    Text("No username provided")
                }
                
                if let location = user.location{
                    Text("Location: \(location)")
                        .padding(1)
                } else {
                    Text("No location provided")
                }
                
                if let company = user.company{
                    Text("Company: \(company)")
                        .padding(1)
                } else {
                    Text("No company provided")
                }
                Text("Followers: \(String(user.followers))")
                    .padding(1)
                
                Text("Public repos: \(String(user.repos))")
                    .padding(1)
                
                Text("Public gists: \(String(user.gists))")
                    .padding(1)
                
                Text("Last update: \(user.lastUpdated)")
                    .padding(1)
                
                Text("Account created: \(user.createdAt)")
                    .padding(1)
            }
        }
        }.onAppear(perform: {
            getUserData()
        })
    }
}

extension UserDetailsView {
    func getUserData() {
        AF.request(url)
            .validate(statusCode : 200..<300)
            .responseDecodable(of: UserDetails.self) {
                response in
                switch response.result {
                case .failure(let error):
                    debugPrint(error)
                    
                    if let msg = error.errorDescription {
                        print(msg)
                    } else {
                        print("no clue what happened")
                    }
                case.success(let user):
                    self.user = user
                    isDataLoaded.toggle()
                }
            }
    }}
