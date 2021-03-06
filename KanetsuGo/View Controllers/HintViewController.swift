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
    var reibun_J1 = [""]
    var reibun_J2 = [""]
    var reibun_V1 = [""]
    var reibun_V2 = [""]
    var furigana_1 = [""]
    var furigana_2 = [""]
    
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var pronunciationJ: UILabel!
    @IBOutlet weak var reibunJ1: UILabel!
    @IBOutlet weak var reibunV1: UILabel!
    @IBOutlet weak var reibunJ2: UILabel!
    @IBOutlet weak var reibunV2: UILabel!
    @IBOutlet weak var furigana1: UILabel!
    @IBOutlet weak var furigana2: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 行間の変更(正確には行自体の高さを変更している。)
        let height = UIScreen.main.bounds.size.height
        var lineHeight:CGFloat = 18.0
        //iPhone の行間設定
        if height <= 812 {
            lineHeight = 20.0
        //iPad の行間設定
        }else{
            lineHeight = 50.0
        }
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.minimumLineHeight = lineHeight
        paragraphStyle.maximumLineHeight = lineHeight
        let attributedText1 = NSMutableAttributedString(string: reibunJ1.text!)
        let attributedText2 = NSMutableAttributedString(string: reibunJ2.text!)
        let attributedText3 = NSMutableAttributedString(string: reibunV1.text!)
        let attributedText4 = NSMutableAttributedString(string: reibunV2.text!)
        let attributedText5 = NSMutableAttributedString(string: furigana1.text!)
        let attributedText6 = NSMutableAttributedString(string: furigana2.text!)
        
        attributedText1.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attributedText1.length))
        attributedText2.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attributedText2.length))
        attributedText3.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attributedText3.length))
        attributedText4.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attributedText4.length))
        
        reibunJ1.attributedText = attributedText1
        reibunJ2.attributedText = attributedText2
        reibunV1.attributedText = attributedText3
        reibunV2.attributedText = attributedText4
        furigana1.attributedText = attributedText5
        furigana2.attributedText = attributedText6
        // overrideで上書きしたが、もともとあるものも使いたい場合
    TapListen.text = "\(NSLocalizedString("TapListen", comment: ""))"
        // Do any additional setup after loading the view.
    }
    

    override func viewWillAppear(_ animated: Bool) {
        
        reibunJ1.text = reibun_J1[0]
        reibunJ2.text = reibun_J2[0]
        reibunV1.text = reibun_V1[0]
        reibunV2.text = reibun_V2[0]
        furigana1.text = furigana_1[0]
        furigana2.text = furigana_2[0]
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
            try! audioSession.setCategory(AVAudioSession.Category(rawValue: convertFromAVAudioSessionCategory(AVAudioSession.Category.playback)), mode: .default)
            
            //try! 例外（エラー）を強制的に無視する
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


// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromAVAudioSessionCategory(_ input: AVAudioSession.Category) -> String {
	return input.rawValue
}
