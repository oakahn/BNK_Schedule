//
//  TotalService.swift
//  BNK_APP
//
//  Created by Chayawat Suntornrak on 22/6/2562 BE.
//  Copyright © 2562 Chayawat Suntornrak. All rights reserved.
//

import Foundation
import ObjectMapper

class GetScheduleService<Response: BaseMappable> {
    
    func call(completion: @escaping([Response]) -> ()) {
        let api = BaseApi<Response>()
        let data = GetScheduleConfig()
        api.postApiArray(
            data.url,
            parameters: data.parameter,
            headers: data.headers
        ) { (response) in
            completion(response)
        }
    }
}
