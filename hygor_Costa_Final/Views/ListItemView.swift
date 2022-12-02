//
//  ListItemView.swift
//  hygor_Costa_Final
//
//  Created by Hygor Costa on 2022-11-30.
//

import SwiftUI

struct ListItemView: View {
    
    let user: User
    
    
    var body: some View {
        HStack {
            // uses URLSession cache
            
            
            
            
            // AsyncImage
            AsyncImage(url: URL(string: user.avatarUrl)) { image in
                
                image.resizable()
                    .frame(width: 60, height: 60)
                
                
            } placeholder: {
                
                //                ProgressView()
                
                
                Image(systemName: "icloud.and.arrow.down.fill")
                    .font(.system(size: 70))
            }
            
            VStack(alignment: .leading) {
                Text(user.username)
                Text(user.type)
                // Username
            }
            Spacer()
        } .border(.red)
    }
}
    
    struct ListItemView_Previews: PreviewProvider {
        static var previews: some View {
            ListItemView(user:testUser)
        }
    }

