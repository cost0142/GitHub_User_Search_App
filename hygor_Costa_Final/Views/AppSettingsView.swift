//
//  AppSettingsView.swift
//  hygor_Costa_Final
//
//  Created by Hygor Costa on 2022-11-30.
//

import SwiftUI

struct AppSettingsView: View {
    @AppStorage("resultsPerPAge") var resultsPerPage: Int = 25
    
    
    var body: some View {
        Stepper(value: $resultsPerPage, in: 1...50, step: 1, label: {
            Text("\(resultsPerPage)")
                .background(.red)
              
        
        })
        .padding()
    }
}

struct AppSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        AppSettingsView()
    }
}
