//
//  TestScroll.swift
//  ClientSuccessFunc
//
//  Created by Luke Morse on 9/21/20.
//  Copyright © 2020 Luke Morse. All rights reserved.
//

import SwiftUI

struct TestScroll: View {
    
    @State private var show = false
    
    var body: some View {
        MyScrollView(showDetail: $show)
    }
}

struct MyScrollView: View {
    
    @Binding var showDetail: Bool
    
    var items: [Image] = [
        Image("SROVideoFeed"),
        Image("SROVideoFeed"),
        Image("SROVideoFeed"),
        Image("SROVideoFeed"),
        Image("SROVideoFeed"),
        Image("SROVideoFeed"),
        Image("SROVideoFeed"),
        Image("SROVideoFeed"),
        Image("SROVideoFeed"),
    ]
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(0..<items.count, id: \.self) { index in
                    NavigationLink(destination: Image("FullScreenSRO")) {
                        CategoryCardView(showDetail: $showDetail, image: items[index])
                    }.buttonStyle(PlainButtonStyle())
                }
            }
        }
    }
}

struct CategoryCardView: View {
    @Binding var showDetail: Bool
    let image: Image
    
    var body: some View {
        image
//            .resizable()
    }
}

struct TestScroll_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TestScroll()
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
}

