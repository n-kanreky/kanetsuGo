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
    //ローカライズ
    @IBOutlet weak var TapListen: UILabel!
    
    var player:AVAudioPlayer!
    var questionWord = ""
    var pronunciation = ""
    var reibun = [""]
    
    
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var pronunciationJ: UILabel!
    @IBOutlet weak var reibunJ: UILabel!
    //   @IBOutlet weak var reibun2J: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad() // overrideで上書きしたが、もともとあるものも使いたい場合
    TapListen.text = "\(NSLocalizedString("TapListen", comment: ""))"
        // Do any additional setup after loading the view.
    }
    

    override func viewWillAppear(_ animated: Bool) {
        
        reibunJ.text = reibun[0]
        question.text = questionWord
        //端末の中の音声ファイルを指定して取り出す
        let soundFilePath : String = Bundle.main.path(forResource: "\(pronunciation)", ofType: "mp3")!
        //ファイルのURLを指定して、do 処理
        let fileURL : URL = URL(fileURLWithPath: soundFilePath);
        do { //do = 例外処理
            //try = error handling 例外処理の補足処理　nilであっても落ちない
            try player = AVAudioPlayer(contentsOf:fileURL) //playerの起動
            //発音モデルをバッファに読み込んでおく
            player.prepareToPlay()
            let audioSession:AVAudioSession = AVAudioSession.sharedInstance()
            try! audioSession.setCategory(AVAudioSessionCategoryPlayback) //try! 例外（エラー）を強制的に無視する
            
        } catch {
            //例外（エラー）が起きた時にコンソールに表示
        }
        
    }
    
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
    
}

