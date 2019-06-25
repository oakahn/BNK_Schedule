//
//  SplashScreenVC.swift
//  BNK_APP
//
//  Created by Chayawat Suntornrak on 24/6/2562 BE.
//  Copyright © 2562 Chayawat Suntornrak. All rights reserved.
//

import Foundation

class SplashScreenVC: BaseVC {
    
    var timer = Timer()
    var second = 2
    
    lazy var router = SplashScreenRouter(self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        runTimer()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        second -= 1
        setup()
    }
    
    func setup() {
        if second == 0 {
            hideLoading()
            router.redirectToHomePage()
        }
    }
}
