//
//  UserDetailsView.swift
//  hygor_Costa_Final
//
//  Created by Hygor Costa on 2022-11-30.
//

import SwiftUI
import Alamofire

struct UserDetailsView: View {
    var user: User
    
    @State private var userDetails = UserDetails(id: 0, username: " ", avatarUrl: " ", userUrl: " ", location: " ", company: " ", followers: 0, gists: 0, repos: 0, lastUpdated: " ", createdAt: " ")
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: user.avatarUrl)){ image in
                image.resizable()
                    .frame(width: 250, height: 250)
            } placeholder: {
                // ProgressView()
                // Placeholder Image
                Image(systemName: "icloud.and.arrow.down.fill")
                    .font(.system(size: 60))
            }
            Text(userDetails.userUrl)
                .onTapGesture {
                    let url = URL(string: userDetails.userUrl)!
                    if #available(iOS 10.0, *) {
                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
                    } else {
                        UIApplication.shared.open(url)
                    }
                }
                .foregroundColor(.blue)
            
            

            
            if let name = user.name{
                Text("Name: \(userDetails.username)")
                    .padding(1)
            } else {
                Text( " Name: No data Founf")
            }
            
            
            
            Text("Location: \(userDetails.location ?? "Unknown")")
                .padding(1)
            Text("Company: \(userDetails.company ?? "Swifty Inc")")
                .padding(1)
            Text("Followers: \(String(userDetails.followers))")
                .padding(1)
            Text("Repos: \(String(userDetails.repos))")
                .padding(1)
            Text("LastUp Dated: \(userDetails.lastUpdated)")
                .padding(1)
            Text("Created at: \(userDetails.createdAt)")
                .padding(1)
        }.onAppear(perform: {
            
            getUserData()
        
    })
    }
}

extension UserDetailsView {
    func getUserData() {
        AF.request(user.userUrl)
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
                    self.userDetails = user.self
                    debugPrint(userDetails)
                }
            }
    }}




