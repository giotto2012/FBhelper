//
//  LiveViewController.swift
//  FBhelper
//
//  Created by Taco on 2018/7/11.
//  Copyright © 2018年 Taco. All rights reserved.
//

import UIKit

class LiveViewController: UIViewController,LFLiveSessionDelegate {
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var liveButton: UIButton!
    
    @IBOutlet weak var markView: UIView!
    lazy var session: LFLiveSession = {
        let audioConfiguration = LFLiveAudioConfiguration.default()
        let videoConfiguration = LFLiveVideoConfiguration.defaultConfiguration(for:.low3, outputImageOrientation:.portrait)
        
        let session = LFLiveSession(audioConfiguration: audioConfiguration, videoConfiguration: videoConfiguration)
        
        session?.delegate = self
        session?.preView = self.contentView
        session?.warterMarkView = markView
        return session!
    }()
    
    var timer:DispatchSourceTimer?
    
    //var session: VCSimpleSession!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        liveButton.layer.borderWidth = 0.5
        
        liveButton.layer.borderColor = UIColor.darkGray.cgColor
        
        //session = LFLiveSession
        self.session.running = true
        
        // Do any additional setup after loading the view.
        
        
        timer = DispatchSource.makeTimerSource(flags: [], queue: DispatchQueue.main)
        timer?.schedule(deadline: .now(), repeating: 5)
        
    }

    @IBAction func liveButtonClicked(_ sender: Any) {
        
        
        if session.state == .start
        {
            FBLiveAPI.shared.endLive { _ in
                self.session.stopLive()
            }
        }
        else
        {
            FBLiveAPI.shared.startLive(privacy: .closed) { result in
                
                guard let streamUrlString = (result as? NSDictionary)?.value(forKey: "stream_url") as? String else {
                    return
                }
               
                let stream = LFLiveStreamInfo()
                
                stream.url = streamUrlString
                
                self.session.startLive(stream)
                
                self.timer?.setEventHandler {
                    
                    FBLiveAPI.shared.loadLiveComment(callback: { (result) in
                        
                        
                        print("test2")
                    })
                }
                self.timer?.resume()
                
                


            }
        }
    }
    
    func liveSession(_ session: LFLiveSession?, errorCode: LFLiveSocketErrorCode) {
    
        
        
    }
    
    func liveSession(_ session: LFLiveSession?, liveStateDidChange state: LFLiveState) {
        
        switch state {
        case .pending:
            liveButton.setTitle("連線中", for:.normal)
            liveButton.isEnabled = false
        case .start:
            liveButton.setTitle("結束直播", for:.normal)
            liveButton.isEnabled = true
            
        default:
            liveButton.setTitle("Live", for:.normal)
            liveButton.isEnabled = true
            
        }
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
