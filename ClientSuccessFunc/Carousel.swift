//
//  Carousel.swift
//  ClientSuccessFunc
//
//  Created by Luke Morse on 9/14/20.
//  Copyright © 2020 Luke Morse. All rights reserved.
//

import SwiftUI

struct Carousel: View {
    
    @State private var show = false
    
    var body: some View {
        CarouselScroller(showDetail: $show)
        NavigationLink(
            destination: Text("Destination"),
            isActive: $show,
            label: {
                EmptyView()
            })
    }
}

struct CarouselScroller: View {
    
    @Binding var showDetail: Bool
    var items: [Image] = [
        Image(systemName: "trash"),
        Image(systemName: "pencil"),
        Image(systemName: "trash"),
        Image(systemName: "pencil"),
        Image(systemName: "trash"),
        Image(systemName: "pencil"),
        Image(systemName: "trash"),
        Image(systemName: "pencil"),
        Image(systemName: "trash"),
        Image(systemName: "pencil")
    ]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: true) {
            HStack {
                ForEach(0..<items.count, id: \.self) { index in
                    CarouselCardView(showDetail: $showDetail, image: items[index])
                }
            }
        }
        .onTapGesture {
            if self.showDetail {
                print("Show")
                self.showDetail.toggle()
            }
        }
        // This is where you could put an onTapGesture for your scroll view to set the individual card boolean back to false (see below)
    }
}

struct CarouselCardView: View {
    @Binding var showDetail: Bool
    let image: Image
    
    var body: some View {
        // All my Card view code here
        image
            .resizable()
            .frame(width: 300, height: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .onTapGesture {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    print("show")
                    self.showDetail.toggle()
                }
            }
    }
}
//
//struct Carousel: View {
//
//    struct Item: Identifiable {
//        let id = NSUUID()
//        var image: Image
//        static let width: CGFloat = 200
//        var onSelect: () -> () = {}
//    }
//
//    @Binding var items: [Item]
//
//    @State private var anchor: CGFloat = 0
//
//    @GestureState private var translation: CGFloat?
//
//    private var offset: CGFloat { anchor + (translation ?? 0) }
//
//    private var stackWidth: CGFloat { CGFloat(items.count) * Item.width }
//
//    private func nearestIndex(to offset: CGFloat) -> Int {
//        var index = (-offset/Item.width).rounded()
//        index = max(index, 0)
//        index = min(index, CGFloat(items.count - 1))
//        return Int(index)
//    }
//
//    func select(index: Int) {
//        let offset = CGFloat(index) * Item.width
//        withAnimation(.easeInOut(duration: 0.2)) {
//            anchor = -offset
//        }
//
//    }
//
//    var body: some View {
//        GeometryReader() { geometry in
//            HStack(alignment: .center, spacing: 0) {
//                ForEach(self.items.indices) { i in
//                    NavigationLink(destination: self.items[i].image) {
//                        self.items[i].image
//                            .resizable()
//                            .frame(width: Item.width, height: Item.width)
////                            .onTapGesture {
////                                self.select(index: i)
////                        }
//                    }
//                }
//            }
//            .offset(x: self.offset)
//            .gesture(
//                DragGesture().updating(self.$translation) { value, state, transaction in
//                    state = value.translation.width
//                }
//                .onEnded { value in
//                    self.anchor += value.translation.width
//
//                    let index = self.nearestIndex(to: self.anchor)
//
//                    self.select(index: index)
//                }
//            )
//                .position(x: geometry.size.width/2 + self.stackWidth/2 - Item.width/2, y: geometry.size.height/2)
//        }
//    }
//
//}
//
//struct Carousel_Previews: PreviewProvider {
//    static var previews: some View {
//        Carousel(items: .constant([Carousel.Item(image: Image("hi")),Carousel.Item(image: Image("hi"))]))
//    }
//}

struct Carousel_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Carousel()
        }
        
    }
}
