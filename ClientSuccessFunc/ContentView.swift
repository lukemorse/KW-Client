//
//  ContentView.swift
//  ClientSuccessFunc
//
//  Created by Luke Morse on 9/14/20.
//  Copyright © 2020 Luke Morse. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
            VStack {
                title
                carousel
                officerList
            }
        }
    
    var title: some View {
        HStack {
            Text("Active SROs")
                .font(.title)
                .multilineTextAlignment(.leading)
            Spacer()
        }.padding(.leading)
    }
    
    var officerList: some View {
        ScrollView {
            SROCellView(name: "OFFICER COLES", assignedSchools: ["KW MS", "DNS MS"])
            SROCellView(name: "OFFICER MORSE", assignedSchools: ["KW MS", "DNS MS"])
            SROCellView(name: "OFFICER BUBAN", assignedSchools: ["KW MS", "DNS MS"])
            SROCellView(name: "OFFICER PARKER", assignedSchools: ["KW MS", "DNS MS"])
            SROCellView(name: "OFFICER COLES", assignedSchools: ["KW MS", "DNS MS"])
        }
    }
    
    var carousel: some View {
        TestScroll()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 2436 / 3.0, height: 1125 / 3.0)).edgesIgnoringSafeArea(.all)
    }
}
