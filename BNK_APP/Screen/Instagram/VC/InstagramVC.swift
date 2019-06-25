//
//  InstagramVC.swift
//  BNK_APP
//
//  Created by Chayawat Suntornrak on 25/6/2562 BE.
//  Copyright © 2562 Chayawat Suntornrak. All rights reserved.
//

import Foundation

protocol InstagramVCProtocol: BaseVCProtocol {
    
}

class InstagramVC: BaseVC {
    
    lazy var presenter = InstagramPresenter(self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension InstagramVC: InstagramVCProtocol {
    
}
