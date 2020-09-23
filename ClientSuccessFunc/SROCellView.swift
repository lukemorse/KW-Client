//
//  SROCellView.swift
//  ClientSuccessFunc
//
//  Created by Luke Morse on 9/14/20.
//  Copyright © 2020 Luke Morse. All rights reserved.
//

import SwiftUI

struct SROCellView: View {
    let name: String
    let assignedSchools: [String]
    
    var body: some View {
        HStack {
            nameLabel
            Spacer()
            assignedSchoolsLabel
            Spacer()
            userHistoryButton
        }
        .padding()
        .background(Color.green)
        
    }
    
    var nameLabel: some View {
        Text(name)
            .font(.headline)
            .fontWeight(.bold)
            .padding(.leading)
    }
    
    var assignedSchoolsLabel: Text {
        var schools = ""
        for school in assignedSchools {
            schools += "\(school) "
        }
        return Text("Assigned Schools: \(schools)")
            .fontWeight(.bold)
    }
    
    var userHistoryButton: some View {
        Button(action: {}) {
            Text("USER HISTORY")
                .fontWeight(.bold)
                .foregroundColor(Color.black)
                .padding()
                .background(Color.blue)
                .cornerRadius(10)
        }
    }
}

struct SROCellView_Previews: PreviewProvider {
    static var previews: some View {
        SROCellView(name: "OFFICER COLES", assignedSchools: ["KW MS", "DNS MS"]).previewLayout(.fixed(width: 2436 / 3.0, height: 1125 / 3.0))
    }
}
