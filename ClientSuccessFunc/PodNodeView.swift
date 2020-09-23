//
//  PodNodeView.swift
//  ClientSuccessFunc
//
//  Created by Luke Morse on 9/22/20.
//  Copyright © 2020 Luke Morse. All rights reserved.
//

import SwiftUI

struct PodNodeView: Identifiable, Hashable, Equatable, View {
    
    var id: Int { hashValue }
    var pod: Pod
    
    @State private var position = CGSize.zero
    
    static func == (lhs: PodNodeView, rhs: PodNodeView) -> Bool {
        return lhs.pod == rhs.pod && lhs.pod == rhs.pod
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(pod.position.x)
        hasher.combine(pod.position.y)
        hasher.combine(pod.podType)
    }
    
    var body: some View {
        Image(podImageDict[self.pod.podType] ?? "")
            .resizable()
            .scaledToFit()
            .frame(
                width: self.pod.podType == .horizontal_hallway ? 12.5 : 7.5,
                height: self.pod.podType == .vertical_hallway ? 12.5 : 7.5)
            .position(pod.position)
            .colorMultiply(Color.red)
    }
}

enum PodType: Int, Codable, CaseIterable, Hashable, Identifiable {
    var id: Int { hashValue }
    
    case outdoor, corner, horizontal_hallway, vertical_hallway
    
    var description: String {
        switch self {
        case .outdoor:
            return "outdoor"
        case .corner:
            return "corner"
        case .horizontal_hallway:
            return "hallway"
        case .vertical_hallway:
            return "vertical hallway"
        }
    }
}


let podImageDict: [PodType : String] = [
    .outdoor : "outdoor pod",
    .corner : "corner pod",
    .horizontal_hallway : "horizontal hallway pod",
    .vertical_hallway : "vertical hallway pod"
]

struct Pod: Encodable, Hashable, Identifiable {
    var id: Int { hashValue }
    let podType: PodType
    var position: CGPoint
    var isComplete = false
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(podType)
        hasher.combine(position.x)
        hasher.combine(position.y)
    }
    
    private enum CodingKeys: String, CodingKey {
        case id
        case podType
        case position
        case isComplete
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(podType, forKey: .podType)
        try container.encode(position, forKey: .position)
        try container.encode(isComplete, forKey: .isComplete)
    }
}

extension Pod: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        podType = try container.decode(PodType.self, forKey: .podType)
        position = try container.decode(CGPoint.self, forKey: .position)
        isComplete = try container.decode(Bool.self, forKey: .isComplete)
    }
}


struct PodNodeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PodNodeView(pod: Pod(podType: .corner, position: CGPoint(x: 100, y: 100)))
        }
        
    }
}
