//
//  CommentObject.swift
//  FBhelper
//
//  Created by Taco on 2018/7/18.
//  Copyright © 2018年 Taco. All rights reserved.
//

import Foundation
class CommentObject  {
    
    var name : String?
    var picture:String?
    var message : String?
    var star:Int?
    var updateTime:String?
    
    
    init(from dic: Dictionary<String, Any>) {
        
        let msg:String? = dic["msg"] as? String
        
        let msgArray:Array? = msg?.components(separatedBy: "`!`")
        
        if let msgArray = msgArray
        {
            message = msgArray[2]
            
            name = msgArray[0]
            
            picture = "https://graph.facebook.com/\(msgArray[1])/picture"
            
            star = Int(msgArray[5])
            
            updateTime =  msgArray[3]
            
        }
        
        
        
        
    }
}
