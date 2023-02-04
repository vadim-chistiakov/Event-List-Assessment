//
//  Endpoint.swift
//  EventsList
//
//  Created by Vadim Chistiakov on 12.01.2023.
//

import EasyNetwork

extension Endpoint {

    var host: String {
        "technical-interview.excels.io"
    }
    
    //TODO: - положить в конфиг
    var header: [String: String]? {
        [
            "secret" : "c8242f09751a2a5e9968a5e66b9259ca2ede3d92b0742a0ecfcab6b45adbb16ac9ebb2ebd073f3bd17d09538d97582cf7ea7c1dbbb9e1e8bf80db7262dc0923c205a0f9e626c5e37bc4e4ae99fa2e18434679631a72a497b89385095ea1e68031f543644ca579bf4f1473c71ad5dce50581e125637c72406fe5bfb437843225a847e644e3026f68764127397e86fe4ccaf33836cbbe2f46d32061388b33d18bc"
        ]
    }
}
