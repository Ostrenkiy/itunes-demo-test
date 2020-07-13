//
//  TracksAPI.swift
//  itunes-demo-test
//
//  Created by Ostrenkiy on 12.07.2020.
//  Copyright © 2020 Ostrenkiy. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

typealias CancellationToken = () -> Void

class TracksAPI {
    let url = "https://itunes.apple.com/search"
    var isCancelled = false

    func getTracks(query: String, completion: @escaping ([Track]) -> Void) -> CancellationToken {
        print("entered getTracks")
        let params: Parameters = [
            "term": query,
            "media": "music"
        ]

        isCancelled = false
        let request = AF.request(
            url,
            method: .get,
            parameters: params,
            encoding: URLEncoding.default,
            headers: nil,
            interceptor: nil,
            requestModifier: nil
        ).responseDecodable(of: TracksResponse.self) { [weak self] response in
            guard let self = self, !self.isCancelled else {
                return
            }
            
            switch response.result {
            case .failure(let error):
                print(error)
            case .success(let tracks):
                print("success on request")
                completion(tracks.results)
            }
        }

        return {
            print("cancelled request \(request)")
            self.isCancelled = true
            request.cancel()
        }
    }
}
