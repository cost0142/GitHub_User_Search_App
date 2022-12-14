//
//  UserSearchResultsView.swift
//  hygor_Costa_Final
//
//  Created by Hygor Costa on 2022-11-30.
//


import SwiftUI

struct UserSearchResultsView: View {
    var users = [User]()
    
    var body: some View {
        NavigationStack{
            List(users) {user in
                NavigationLink(destination: UserDetailsView(url: user.userUrl), label: {
                    ListItemView(user: user)
                })
            }
        }
    }
}
struct UserSearchResultsView_Previews: PreviewProvider {
    static var previews: some View {
        UserSearchResultsView()
    }
}
