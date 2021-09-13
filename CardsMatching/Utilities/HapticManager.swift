//
//  HapticManager.swift
//  CardsMatching
//
//  Created by HAHA on 29/8/2021.
//

import Foundation
import SwiftUI

class HapticManger{
    static let instance = HapticManger()
    
    func notification(type: UINotificationFeedbackGenerator.FeedbackType){
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }
}
