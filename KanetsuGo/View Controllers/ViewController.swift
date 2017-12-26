//
//  ViewController.swift
//  KanetsuGo
//
//  Created by クロス尚美 on 2017/10/22.
//  Copyright © 2017年 NC. All rights reserved.
//

import UIKit
import Speech
import AVFoundation
import RealmSwift
var flag = "QSelection"
class ViewController: UIViewController,SFSpeechRecognizerDelegate,AVAudioPlayerDelegate {
    var questions = [""]
    var katakana = [""]
    var vietnamese = [""]
    var pronunciationJ = [""]
    var reibunJ = [[""]]
    
    var questionNumber = 0
    var player:AVAudioPlayer!
    var count = 0
    var original = ""
    
    var skipCount = 0
    var correctFlag = false
    //問題が通常のリストから、あるいは復習リストから来ているかを見極めるフラグ　VCの名前を入れる
    var pickQList = ""
    //review class のインスタンス
    var review: Review! = Review()
    var reviewArray = try! Realm().objects(Review.self).sorted(byKeyPath: "id", ascending: true)
    // "ja-JP"を指定して日本語に設定
    private let speechRecognizer = SFSpeechRecognizer(locale: Locale(identifier: "ja-JP"))!
    private var recognitionRequest: SFSpeechAudioBufferRecognitionRequest?
    private var recognitionTask: SFSpeechRecognitionTask?
    private let audioEngine = AVAudioEngine()
    
    
    @IBOutlet weak var qNumber: UILabel!
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var vWord: UILabel!
    @IBOutlet weak var kWord: UILabel!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var correct1: UIImageView!
    @IBOutlet weak var correct2: UIImageView!
    @IBOutlet weak var correct3: UIImageView!
    // ここからRealmSwift 関連のコード　＊＊＊＊＊＊＊
    // Realmインスタンスを取得する
    let realm = try! Realm()
    
    // DB内の復習項目が格納されるリスト。
    
    
    
    // 復習項目を削除するには、テーブル行を左にスワイプして削除ボタンを表示しタップします。
    //    try! realm.write {
    //    self.realm.delete(self.reviewArray[indexPath.row])
    //    tableView.deleteRows(at: [indexPath as IndexPath], with: UITableViewRowAnimation.fade)
    //    }
    //
    // ここまでRealmSwift 関連のコード　＊＊＊＊＊＊＊
    
    override func viewDidLoad() {
        super.viewDidLoad()
    //  問題を設定する
        setQuestions(Int: questionNumber)
        kWord.text = "ヒントはここをタップ"
        
    NotificationCenter.default.addObserver(
        self,
        selector: #selector( ViewController.resetCount(_:)),
        name: NSNotification.Name(rawValue: "RESETCOUNT"),
        object: nil)
        startButton.isEnabled = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        
        print(reviewArray)
        label.text = ""
        print(flag)
        
    }
    func setQuestions(Int:Int){
        
        if Int < self.questions.count {
            // print("VC：Intをチェック")
            // print (Int)
            
            qNumber.text = "第 \(Int + 1) 問"
            question.text = questions[Int]
            vWord.text = vietnamese[Int]
            kWord.text = katakana[Int]
        }
    }
    func stopAudio(){
        if audioEngine.isRunning {
            //print("Engine stop")
            audioEngine.stop()
            recognitionRequest?.endAudio()
        }
    }
    // 音声認識を開始/停止

    @IBAction func startButtonTapped(_ sender: Any) {
        if audioEngine.isRunning {
            // print("Engine 停止")
            audioEngine.stop()
            recognitionRequest?.endAudio()
            startButton.isEnabled = false
            startButton.setTitle("停止中", for: .disabled)
        } else {
            try! startRecording()
            startButton.setTitle("STOP", for: [])
        }
        
    }
    //Swift4で、@objc が必要になった
    @objc func resetCount(_ center:Notification?) {
        self.original = ""
        self.count=0
        self.correct1.image = UIImage(named:"unfilledCircle")
        self.correct2.image = UIImage(named:"unfilledCircle")
        self.correct3.image = UIImage(named:"unfilledCircle")
    }
    
    
    @IBAction func hintButton(_ sender: Any) {
        setQuestions(Int: questionNumber)
    }
    
    var reviewCorrectFlag = false
    var gCount =  0
    private func startRecording() throws {
        refreshTask()
        
        let audioSession = AVAudioSession.sharedInstance()
        // 録音用のカテゴリをセット
        try audioSession.setCategory(AVAudioSessionCategoryPlayAndRecord)
        try audioSession.setMode(AVAudioSessionModeDefault)
        try audioSession.setActive(true, with: .notifyOthersOnDeactivation)
        recognitionRequest = SFSpeechAudioBufferRecognitionRequest()
        
        guard let inputNode:AVAudioInputNode = audioEngine.inputNode else { fatalError("Audio engine has no input node") }
        guard let recognitionRequest = recognitionRequest else { fatalError("Unable to create a SFSpeechAudioBufferRecognitionRequest object") }
        
        // 録音が完了する前のリクエストを作るかどうかのフラグ。
        // trueだと現在-1回目のリクエスト結果が返ってくる模様。falseだとボタンをオフにしたときに音声認識の結果が返ってくる設定。
        recognitionRequest.shouldReportPartialResults = true
        recognitionTask = speechRecognizer.recognitionTask(with: recognitionRequest) { [weak self] result, error in
            guard let `self` = self else { return }
            
            var isFinal = false
            
            if let result = result {
                isFinal = result.isFinal
                if self.questionNumber < self.questions.count{
                    let str = result.bestTranscription.formattedString
                    //                検索する文字列
                    let word = self.questions[self.questionNumber] //＊＊＊　var を　let　に変えてみた　"Variable "word" was never mutated"　黄色エラーが消えた
                    //var word = self.questions[self.questionNumber]
                    self.count = 0
                    // print(str)
                    
                    var nextRange = str.startIndex..<str.endIndex //最初は文字列全体から探す
                    
                    while let range = str.range(of: word, options: .caseInsensitive, range: nextRange) {
                        //.caseInsensitiveで探す方が、lowercaseStringを作ってから探すより普通は早い
                        self.count += 1
                        if self.gCount < self.count {
                            self.correctFlag = true
                            self.gCount = self.count
                        }else{
                            self.correctFlag = false
                        }
                        self.label.text = self.question.text!
                        nextRange = range.upperBound..<str.endIndex //見つけた単語の次(range.upperBound)から元の文字列の最後までの範囲で次を探す
                        
                    }
                    // print("self.correctFlagは以下の通り")
                    // print(self.correctFlag)
                    
                    if self.correctFlag == false {
                        self.label.text = "もう一度！"
                        self.gCount = self.count
                    }
                    
                    self.correctFlag = false
                    
                }
                
                if self.count == 1 {
                    
                    print("self.count ==１回目")
                    self.correct1.image = UIImage(named:"tick_orange")
                    self.correct2.image = UIImage(named:"unfilledCircle")
                    self.correct3.image = UIImage(named:"unfilledCircle")
                    
                }else if self.count == 2{
                    
                    print("self.count ==2 ２回目")
                    self.correct1.image = UIImage(named:"tick_orange")
                    self.correct2.image = UIImage(named:"tick_orange")
                    self.correct3.image = UIImage(named:"unfilledCircle")
                }else if self.count == 3 {
                    
                    print("self.count ==3 ３回目")
                    self.correct1.image = UIImage(named:"tick_orange")
                    self.correct2.image = UIImage(named:"tick_orange")
                    self.correct3.image = UIImage(named:"tick_orange")
                    self.reviewCorrectFlag = true
                    if self.questionNumber == self.questions.count {//最後の問題の時は
                        
                        
                    }else{
                        self.stopAudio()
                        self.label.text = ""
                        self.questionNumber += 1
                        self.setQuestions(Int: self.questionNumber)
                        
                        self.kWord.text = "ヒントはここをタップ" //ヒントをクリアして、初期状態に戻している
                    }
                    self.performSegue(withIdentifier:"modal", sender:nil)
                    //ここでprepare(for segueを呼び出す
                }
                isFinal = result.isFinal
            }
            
            // エラーがある、もしくは最後の認識結果だった場合の処理
            if error != nil || isFinal {
                //                self.audioEngine.stop()
                inputNode.removeTap(onBus: 0)
                
                self.recognitionRequest = nil
                self.recognitionTask = nil
                self.startButton.isEnabled = true
                self.startButton.setTitle("START", for: [])
            }
        }
        
        // マイクから取得した音声バッファをリクエストに渡す
        let recordingFormat = inputNode.outputFormat(forBus: 0)
        inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { (buffer: AVAudioPCMBuffer, when: AVAudioTime) in
            self.recognitionRequest?.append(buffer)
        }
        try startAudioEngine()
    }
    
    private func refreshTask() {
        if let recognitionTask = recognitionTask {
            recognitionTask.cancel()
            self.recognitionTask = nil
        }
    }
    
    private func startAudioEngine() throws {
        // startの前にリソースを確保しておく。
        audioEngine.prepare()
        try audioEngine.start()
        label.text = "発音してください。"
    }
    
    
    // 音声認識の可否が変更したときに呼ばれるdelegate
    func speechRecognizer(_ speechRecognizer: SFSpeechRecognizer, availabilityDidChange available: Bool) {
        if available {
            startButton.isEnabled = true
            startButton.setTitle("START", for: [])
        } else {
            startButton.isEnabled = false
            startButton.setTitle("STOP", for: .disabled)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        requestRecognizerAuthorization()
    }
    private func requestRecognizerAuthorization() {
        // 認証処理
        SFSpeechRecognizer.requestAuthorization { authStatus in
            // メインスレッドで処理したい内容のため、OperationQueue.main.addOperationを使う
            OperationQueue.main.addOperation { [weak self] in
                guard let `self` = self else { return }
                
                switch authStatus {
                case .authorized:
                    self.startButton.isEnabled = true
                    
                case .denied:
                    self.startButton.isEnabled = false
                    self.startButton.setTitle("音声認識へのアクセスが拒否されています。", for: .disabled)
                    
                case .restricted:
                    self.startButton.isEnabled = false
                    self.startButton.setTitle("この端末で音声認識はできません。", for: .disabled)
                    
                case .notDetermined:
                    self.startButton.isEnabled = false
                    self.startButton.setTitle("音声認識はまだ許可されていません。", for: .disabled)
                }
            }
        }
    }
    
    
    @IBAction func skipQuestion(_ sender: Any) {
        self.review = Review()
        var reviewArray = try! Realm().objects(Review.self).sorted(byKeyPath: "id", ascending: true)
        if reviewArray.count != 0 {
            self.review.id = reviewArray.max(ofProperty: "id")! + 1
        } else {
            self.review.id = 0
        }
        var skippedQuestionNumber = questionNumber
        let alertController = UIAlertController(title: "スキップしますか？", message: "", preferredStyle: UIAlertControllerStyle.alert)
        
        let action = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler:{
            (action:UIAlertAction!) -> Void in
            // 以降内容をアップデートするとリスト内は自動的に更新される。
            
            self.questionNumber += 1
            self.setQuestions(Int: self.questionNumber)
            self.skipCount += 1
            self.kWord.text = "ヒントはここをタップ" //ヒントをクリアして、初期状態に戻している
            let notification: Notification = Notification(name: Notification.Name(rawValue: "RESETCOUNT"), object: nil, userInfo: nil)
            
            NotificationCenter.default.post(notification)
            if self.questionNumber == self.questions.count{
                self.questionNumber = self.questions.count
                self.performSegue(withIdentifier: "modal", sender: nil)
            }
            try! self.realm.write {
                
                //　問題
                self.review.questions = self.questions[skippedQuestionNumber]

                // カタカナによる発音ヒント
                self.review.katakana = self.katakana[skippedQuestionNumber]

                // ベトナム語
                self.review.vietnamese = self.vietnamese[skippedQuestionNumber]

                /// 日越の例文 配列が　[[""]]なので、以下のようになる
                self.review.reibunJ = self.reibunJ[skippedQuestionNumber][0]
                
                // 音声ファイル
                self.review.pronunciationJ = self.pronunciationJ[skippedQuestionNumber]
                
                


                //            // 書き込み処理
                self.realm.add(self.review, update: true)
                //

                
            }
        })
        
        let cancelAction = UIAlertAction(title: "cancel", style: UIAlertActionStyle.cancel, handler:{
            (action:UIAlertAction!) -> Void in
            
            
        }
        )
        
        
        alertController.addAction(action)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func returnToSelection(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "modal"){
            let popup:PopupViewController = (segue.destination as! PopupViewController)
            popup.questionCount = self.questionNumber
            popup.skipCount = self.skipCount
            popup.pickQList = flag
            popup.totalQuestions = self.questions.count
            popup.reviewCorrectFlag = self.reviewCorrectFlag
            
            //　以下で、Realmに保存する情報をまとめる**********************************************
            popup.question = questions[self.questionNumber - 1]
            popup.katakana = katakana[self.questionNumber - 1]
            popup.vietnamese = vietnamese[self.questionNumber - 1]
            popup.reibunJ = reibunJ[self.questionNumber - 1][0]
            popup.pronunciationJ = pronunciationJ[self.questionNumber - 1]
            
            //
            // *******************************************************************************
            
            
            
        }
        if(segue.identifier == "toExplanation"){
            let popup:HintViewController = (segue.destination as! HintViewController)
            popup.questionWord = self.question.text!
            popup.pronunciation = self.pronunciationJ[questionNumber]
            
            popup.reibun = self.reibunJ[questionNumber]
            print(self.pronunciationJ[questionNumber])
            print("VVCからExplanationへ")
            self.stopAudio()
        }
        
    }
}
