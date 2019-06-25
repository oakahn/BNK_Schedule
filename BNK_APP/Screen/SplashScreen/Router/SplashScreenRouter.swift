//
//  SplashScreenRouter.swift
//  BNK_APP
//
//  Created by Chayawat Suntornrak on 24/6/2562 BE.
//  Copyright © 2562 Chayawat Suntornrak. All rights reserved.
//

import Foundation


class SplashScreenRouter: BaseRouter {
    
    func redirectToHomePage() {
        redirectTo(name: self.home)
    }
}
