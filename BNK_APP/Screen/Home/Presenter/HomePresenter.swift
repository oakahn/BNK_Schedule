//
//  HomePresenter.swift
//  BNK_APP
//
//  Created by Chayawat Suntornrak on 25/6/2562 BE.
//  Copyright © 2562 Chayawat Suntornrak. All rights reserved.
//

import Foundation

protocol HomePresenterProtocol {

}

class HomePresenter {

    let view: HomeVCProtocol?
    
    init(_ view: HomeVCProtocol) {
        self.view = view
    }
}

extension HomePresenter: HomePresenterProtocol {

}
