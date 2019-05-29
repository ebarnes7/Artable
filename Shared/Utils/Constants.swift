//
//  Constants.swift
//  Artable
//
//  Created by Eric Barnes on 5/29/19.
//  Copyright © 2019 Eric Barnes. All rights reserved.
//

import Foundation
import UIKit

// static keyword means that the var/constant will be "shared" among all instances of a particular object

struct Storyboards {
    static let LoginStoryboard = "LoginStoryboard"
    static let Main = "Main"
}

struct StoryboardIDs {
    static let LoginVC = "loginVC"
}

struct AppImages {
    static let RedCheck = "red_check"
    static let GreenCheck = "green_check"
}

struct AppColors {
    static let Blue = #colorLiteral(red: 0.2914361954, green: 0.3395442367, blue: 0.4364506006, alpha: 1)
    static let Red = #colorLiteral(red: 0.8739202619, green: 0.4776076674, blue: 0.385545969, alpha: 1)
    static let OffWhite = #colorLiteral(red: 0.9626371264, green: 0.959995091, blue: 0.9751287103, alpha: 1)
}
