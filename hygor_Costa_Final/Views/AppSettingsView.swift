//
//  AppSettingsView.swift
//  hygor_Costa_Final
//
//  Created by Hygor Costa on 2022-11-30.
//



import SwiftUI

struct AppSettingsView: View {
    @AppStorage("resultsPerPage") var resultsPerPage: Int = 25
    @AppStorage("minNumberOfRepos") var minNumberOfRepos: Int = 10
    @AppStorage("minNumberOfFollowers") var minNumberOfFollowers: Int = 10
    var body: some View {
        VStack{
            Text("App Settings")
                .font(.system(size: 35))
            //MARK: Results stepper
            HStack{
                Text("Number of results: ")
                Stepper(value: $resultsPerPage, in: 1...50, step: 1, label: {
                    Text("\(resultsPerPage)")
                })
            }
            .padding()
            .lineLimit(1)
            
            //MARK: Followers stepper
            HStack{
                Text("Minimum followers: ")
                Stepper(value: $minNumberOfRepos, in: 1...50, step: 1, label: {
                    Text("\(minNumberOfRepos)")
                })
            }
            .padding()
            .lineLimit(1)
            
            //MARK: Repos stepper
            HStack{
                Text("Minimum repos: ")
                Stepper(value: $minNumberOfFollowers, in: 1...50, step: 1, label: {
                    Text("\(minNumberOfFollowers)")
                })
            }
            .padding()
            .lineLimit(1)
            
        }
    }
}

struct AppSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        AppSettingsView()
    }
}
