//
//  ChatViewController.swift
//  FBhelper
//
//  Created by Taco on 2018/7/18.
//  Copyright © 2018年 Taco. All rights reserved.
//

import UIKit
import Foundation
import SocketIO

class ChatViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{

    var socketManager:SocketManager? = nil
    
    var messageArray:[CommentObject] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func connectButtonClicked(_ sender: UIButton) {
        
        socketManager = SocketManager(socketURL: URL(string: "https://live01.168money.com.tw:10003")!, config: [.log(true), .compress])
        
        let socket = socketManager?.defaultSocket
        
        socket?.on(clientEvent: .connect) {data, ack in
            
            print("socket connected")
            
        }
        
        socket?.on("pushCallAPI") {data, ack in
            
            let array:Array<Any> = data
            
            for dic in array
            {
                let obj:CommentObject = CommentObject(from: dic as! Dictionary<String, Any>)
                
                if obj.message!.count > 0
                {
                    self.messageArray.insert(obj, at: 0)
                    
                    self.tableView.insertRows(at: [NSIndexPath(row: 0, section: 0) as IndexPath], with: .none)
                }

            }
            
        }
        
        socket?.on(clientEvent: .statusChange) {data, ack in
            
            
            
        }
        
        socket?.connect()
        
        sender.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tableView.register(UINib.init(nibName: "TestScoketCommentTableViewCell", bundle: nil), forCellReuseIdentifier: "TestScoketCommentTableViewCell")
        
        tableView.tableFooterView = UIView()
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - TableView
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return messageArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:TestScoketCommentTableViewCell = tableView.dequeueReusableCell(withIdentifier: "TestScoketCommentTableViewCell") as! TestScoketCommentTableViewCell
        
        
        let commentListObj:CommentObject = messageArray[indexPath.row]
        
        cell.updateUI(obj: commentListObj)
        
        return cell
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
