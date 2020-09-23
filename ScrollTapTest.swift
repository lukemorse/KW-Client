//
//  ScrollTapTest.swift
//  ClientSuccessFunc
//
//  Created by Luke Morse on 9/21/20.
//  Copyright © 2020 Luke Morse. All rights reserved.
//

import SwiftUI

struct ScrollTapTest: View {
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(0..<5) { _ in
                    Rectangle()
                        .fill(Color.red)
                        .frame(width: 200, height: 200)
                        .onTapGesture {
                            print("Rectangle onTapGesture")
                        }
                }
            }
        }
    }
}

struct ScrollTapTest_Previews: PreviewProvider {
    static var previews: some View {
        ScrollTapTest()
    }
}
