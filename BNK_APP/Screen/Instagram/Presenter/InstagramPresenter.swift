//
//  InstagramPresenter.swift
//  BNK_APP
//
//  Created by Chayawat Suntornrak on 25/6/2562 BE.
//  Copyright © 2562 Chayawat Suntornrak. All rights reserved.
//

import Foundation

protocol InstagramPresenterProtocol {
    
}

class InstagramPresenter {
    
    let view: InstagramVCProtocol?
    
    init(_ view: InstagramVCProtocol) {
        self.view = view
    }
}

extension InstagramVC: InstagramPresenterProtocol {
    
}
