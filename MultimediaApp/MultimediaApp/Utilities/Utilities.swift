//
//  Utilities.swift
//  MultimediaApp
//
//  Created by Doan Minh Hoang on 2/19/20.
//  Copyright © 2020 Doan Minh Hoang. All rights reserved.
//

import Foundation
import UIKit

enum Utilities {
    static func getViewController(from storyBoardName: String, viewControllerId: String) -> UIViewController? {
        let storyboard = UIStoryboard(name: storyBoardName, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: viewControllerId)
    }
    
    static func isIPad() -> Bool {
        return UIDevice.current.userInterfaceIdiom == .pad
    }
}
