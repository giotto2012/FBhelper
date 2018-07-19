//
//  FBLiveAPI.swift
//  FBLiveAPI
//
//  Created by LeeSunhyoup on 2016. 9. 17..
//  Copyright © 2016년 Lee Sun-Hyoup. All rights reserved.
//

import Foundation
import FBSDKCoreKit

enum FBLivePrivacy: StringLiteralType {
    case closed = "SELF"
    case everyone = "EVERYONE"
    case allFriends = "ALL_FRIENDS"
    case friendsOfFriends = "FRIENDS_OF_FRIENDS"
//    case custom = "CUSTOM"
}

class FBLiveAPI {
    typealias CallbackBlock = ((Any) -> Void)
    typealias ErrorCallbackBlock = ((Any) -> Void)
    var liveVideoId: String?
    
    static let shared = FBLiveAPI()
    
    func startLive(privacy: FBLivePrivacy, callback: @escaping CallbackBlock) {
        DispatchQueue.main.async {
            if FBSDKAccessToken.current().hasGranted("publish_video") {
                let path = "/me/live_videos"
                let params = [
                    "privacy": "{\"value\":\"\(privacy.rawValue)\"}"
                ]
                let request = FBSDKGraphRequest(
                    graphPath: path,
                    parameters: params,
                    httpMethod: "POST"
                )
                
                _ = request?.start { (_, result, error) in
                    if error == nil {
                        self.liveVideoId = (result as? NSDictionary)?.value(forKey: "id") as? String
                        callback(result as Any)
                        
                        
                        
                    }
                }
            }
        }
    }
    
    func endLive(callback: @escaping CallbackBlock) {
        DispatchQueue.main.async {
            if FBSDKAccessToken.current().hasGranted("publish_video") {
                guard let id = self.liveVideoId else { return }
                let path = "/\(id)"
                
                let request = FBSDKGraphRequest(
                    graphPath: path,
                    parameters: ["end_live_video": true],
                    httpMethod: "POST"
                )
                
                _ = request?.start { (_, result, error) in
                    if error == nil {
                        callback(result as Any)
                    }
                }
            }
        }
    }
    
    func loadLiveComment(callback: @escaping CallbackBlock,errorCallback: @escaping ErrorCallbackBlock) {
        DispatchQueue.main.async {
            if FBSDKAccessToken.current().hasGranted("publish_video") {
                let path = "/\(self.liveVideoId ?? "")/comments"
                
                let request = FBSDKGraphRequest(
                    graphPath: path,
                    parameters: nil,
                    httpMethod: "GET"
                )
                
                _ = request?.start { (_, result, error) in
                    
                    if error == nil {
                        
                        let jsonData = self.functionToJSON(object: result!)
                        
                        let decoder = JSONDecoder()
                        decoder.dateDecodingStrategy = .iso8601
                        
                        print("test:\(jsonData)")
                        
                        if let songResults = try?
                            decoder.decode(FBCommentSwiftBase.self, from: jsonData)
                        {
                             callback(songResults)

                        } else {
                            
                            let localError = NSError(domain: "", code: 500, userInfo: nil)
                            errorCallback(localError as Any)
                        }
                        
                    }
                    else
                    {
                        errorCallback(error as Any)
                    }
                }
            }
        }
    }
    func functionToJSON(object:Any) -> Data {
        /**
         先判断是否可以转换
         */
        if !JSONSerialization.isValidJSONObject(object) {
            return Data.init()
        }
        /**
         开始转换
         JSONSerialization.WritingOptions.prettyPrinted 是输出JSON时的格式更容易查看。
         */
        return try! JSONSerialization.data(withJSONObject: object, options: .prettyPrinted)
    }
}
