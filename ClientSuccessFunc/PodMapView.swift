//
//  PodMapView.swift
//  ClientSuccessFunc
//
//  Created by Luke Morse on 9/22/20.
//  Copyright © 2020 Luke Morse. All rights reserved.
//

import SwiftUI

struct PodMapView: View {
//    var viewModel: InstallationViewModel
    var floorPlanIndex: Int = 0
    
    @State private var showImagePicker: Bool = false
    @State private var image: Image?
    @State private var isShowingAlert = false
    @State private var isLoading = false
    @State private var showingActionSheet = false
    
    @State private var showPodInfo = false
    
    @State private var pods: [Pod] = [Pod(podType: .corner, position: CGPoint(x: 250, y: 250))]
    
    @State private var position = CGSize.zero
    @State private var scale: CGFloat = 1.0
    @State private var newScaleValue: CGFloat = 1.0
    @State private var lastScaleValue: CGFloat = 1.0
    @State private var dragSize: CGSize = CGSize.zero
    
    @State private var currentAmount: CGFloat = 0
    @State private var finalAmount: CGFloat = 1
    
    @GestureState private var dragOffset = CGSize.zero
    
    var body: some View {
        VStack {
            ZStack {
                Image("floorplan")
                    .resizable()
                self.podGroup
            }
            .scaleEffect(finalAmount + currentAmount)
            .gesture(
                MagnificationGesture()
                    .onChanged { amount in
                        self.currentAmount = amount - 1
                    }
                    .onEnded { amount in
                        self.finalAmount += self.currentAmount
                        self.currentAmount = 0
                    }
            )
//            .coordinateSpace(name: "custom")
            .scaledToFit()
            .animation(.none)
//            .scaleEffect(self.scale)
            .offset(self.dragSize)
            Spacer()
//            moveAndScaleButtons
//            actionSheetButton
        }
        .sheet(isPresented: $showPodInfo, content: {
            PodInfoView()
        })
        
    }
    
    
    var podGroup: some View {
        if pods.count > 0 {
            return AnyView(
                Group {
                    ForEach(0..<pods.count, id: \.self) { index in
                        PodNodeView(pod: self.pods[index])
                            .onTapGesture {
                                print("on tap")
                                self.showPodInfo = true
                        }
                    }
                }
            )
        }
        else {
            return AnyView(EmptyView())
        }
    }
    
}

extension PodMapView {
    
    var moveAndScaleButtons: some View {
        HStack {
            VStack(spacing: 50) {
                button_scaleUp
                button_scaleDown
            }
            Spacer()
            VStack {
                button_moveUp
                HStack {
                    button_moveLeft
                    button_moveRight
                }
                button_moveDown
            }
        }
    }
    
    func getButton(imageName: String, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Image(systemName: imageName)
                .foregroundColor(Color.white)
                .font(.headline)
                .padding()
                .foregroundColor(Color.black)
                .background(Color.blue)
                .cornerRadius(15)
                .shadow(radius: 10)
                .padding(EdgeInsets(top: 5, leading: 30, bottom: 5, trailing: 30))
        }
    }
    
    var button_moveUp: some View {
        getButton(imageName: "arrow.up", action: {
            self.dragSize.height += 40 / self.scale
        })
    }
    var button_moveDown: some View {
        getButton(imageName: "arrow.down", action: {
            self.dragSize.height -= 40 / self.scale
        })
    }
    var button_moveLeft: some View {
        getButton(imageName: "arrow.left", action: {
            self.dragSize.width += 80 / self.scale
        })
    }
    var button_moveRight: some View {
        getButton(imageName: "arrow.right", action: {
            self.dragSize.width -= 80 / self.scale
        })
    }
    
    var button_scaleUp: some View {
        getButton(imageName: "plus", action: {
            self.scale += 0.2
        })
    }
    var button_scaleDown: some View {
        getButton(imageName: "minus", action: {
            self.scale -= 0.2
        })
    }
}


struct CreatePodMapView_Previews: PreviewProvider {
    static var previews: some View {
        PodMapView()
    }
}
