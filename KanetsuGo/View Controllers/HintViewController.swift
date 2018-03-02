//
//  HintViewController.swift
//  KanetsuGo
//
//  Created by n.kanreky on 2017/10/22.
//  Copyright © 2017年 NC. All rights reserved.
//

import UIKit
import AVFoundation

class HintViewController: UIViewController,AVAudioPlayerDelegate {
    
    var player:AVAudioPlayer!
    var questionWord = ""
    var pronunciation = ""
    var reibun = [""]
    
    
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var pronunciationJ: UILabel!
    @IBOutlet weak var reibunJ: UILabel!
    //   @IBOutlet weak var reibun2J: UILabel!
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print(reibun[0])
        print("Rヒントの例文")
        reibunJ.text = reibun[0]
        
        question.text = questionWord
        let soundFilePath : String = Bundle.main.path(forResource: "\(pronunciation)", ofType: "mp3")!
        print(pronunciation)
        print("pronunciationの中身")
        
        let fileURL : URL = URL(fileURLWithPath: soundFilePath);
        do {
            try player = AVAudioPlayer(contentsOf:fileURL)
            
            //発音モデルをバッファに読み込んでおく
            player.prepareToPlay()
            let audioSession:AVAudioSession = AVAudioSession.sharedInstance()
            try! audioSession.setCategory(AVAudioSessionCategoryPlayback)
            
        } catch {
            print(error)
        }
        
    }
    //画像ドラッグ？なぜtouchesBegan/touchesMovedがないのに、いきなりtouchesEnded?
    //背景を押した時に戻るため
    //    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    //        super.touchesEnded(touches, with: event)
    //        for touch: UITouch in touches {
    //            let tag = touch.view!.tag
    //            print(tag)
    //            if tag == 1 {
    //                dismiss(animated: true, completion: nil)
    //            }
    //        }
    //    }
    @IBAction func wordSound(_ sender: Any) {
        player.play()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func returnToQuestion(_ sender: Any) {
        dismiss(animated: true, completion: nil)
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

