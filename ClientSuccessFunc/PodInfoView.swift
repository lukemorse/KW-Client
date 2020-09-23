//
//  PodInfoView.swift
//  ClientSuccessFunc
//
//  Created by Luke Morse on 9/22/20.
//  Copyright © 2020 Luke Morse. All rights reserved.
//

import SwiftUI

struct PodInfoView: View {
    var image = Image("podInfo")
    var podNumber = 15
    var activeSinceDate = "4/13/19"
    var batteryPerc = "98%"
    
    var body: some View {
        VStack {
            image
                .padding(25)
            Text("Pod # \(podNumber)")
                .font(.title)
                .fontWeight(.heavy)
                .padding()
            Text("Active since: " + activeSinceDate)
                .padding()
            Text("Battery life: " + batteryPerc)
                .padding()
            Text("WiFi")
                .padding()
        }
        .background(Color.blue)
    }
}

struct PodInfoView_Previews: PreviewProvider {
    static var previews: some View {
        PodInfoView()
    }
}
