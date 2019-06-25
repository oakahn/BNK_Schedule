//
//  TotalService.swift
//  BNK_APP
//
//  Created by Chayawat Suntornrak on 22/6/2562 BE.
//  Copyright © 2562 Chayawat Suntornrak. All rights reserved.
//

import Foundation
import ObjectMapper

class GetScheduleService {
    
    func call(completion: @escaping([ScheduleModel]) -> ()) {
        let api = BaseApi<ScheduleModel>()
        let data = GetScheduleConfig()
        api.apiArray(
            data.url,
            method: data.method,
            parameters: data.parameter,
            headers: data.headers
        ) { (response) in
            completion(response)
        }
    }
}
