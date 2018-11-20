//
//  ViewController.swift
//  KanetsuGo
//
//  Created by n.kanreky on 2017/10/22.
//  Copyright © 2017年 NC. All rights reserved.
//

import UIKit
import Speech
import AVFoundation
import RealmSwift

var flag = "QSelection" //通常(QSelection)の問題か、復習(Review)リストの問題かを判別するフラグ
class ViewController: UIViewController,SFSpeechRecognizerDelegate,AVAudioPlayerDelegate {
    //問題グループごとに内容の説明を入れるため、VC（問題）の上にContainerを載せる
    @IBOutlet weak var questionIntroContainer: UIView!
    //ローカライズ
    @IBOutlet weak var PronunciationExamples: UILabel!
    @IBOutlet weak var hintWord: UILabel!
    //PressStartViewControllerをOUtlet接続する
    @IBOutlet weak var PressStart: UIView!
    
    //DelegateのSFSpeechRecognizerDelegateとAVAudioPlayerDelegateは、SpeechとAVFoundationのフレームワークの中の機能を使うためにプロトコルを宣言
    var hiddenFlag = false
    var questions = [""]
    var katakana = [""]
    var vietnamese = [""]
    var pronunciationJ = [""] //ここまでは配列
    var reibunJ1 = [[""]] //これは２次元配列
    var reibunJ2 = [[""]]
    var reibunV1 = [[""]]
    var reibunV2 = [[""]]
//    var reibunJ1 = [""] //これは２次元配列
//    var reibunJ2 = [""]
//    var reibunV1 = [""]
//    var reibunV2 = [""]
    
    
    
    var questionNumber = 0
    var player:AVAudioPlayer!
    var count = 0
    var original = ""
    
    var skipCount = 0
    var correctFlag = false
    var cellNumber = 0
    //問題が通常のリストから、あるいは復習リストから来ているかを見極めるフラグ　VCの名前を入れる
    var pickQList = ""
    //review class のインスタンス
    var review: Review! = Review()
    var reviewArray = try! Realm().objects(Review.self).sorted(byKeyPath: "id", ascending: true)
    var reviewQuestionNumber = 0
    // "ja-JP"を指定して日本語に設定
    //このクラス内でしか使えない変数・定数をprivateとして設定
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
   
    //オートレイアウトをiPhoneのサイズによって調整
    @IBOutlet weak var defaulConst: NSLayoutConstraint!
    @IBOutlet weak var XConst: NSLayoutConstraint!
    
    // ここからRealmSwift 関連のコード　＊＊＊＊＊＊＊
    // Realmインスタンスを取得する
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//復習リストでグループ解説が出ないようにする＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊
        if hiddenFlag == false{
        hiddenView2()
        }
//Groupごとの説明文を入れる　非同期処理************************************************************************************
        //もし"HIDDEN"という連絡がきたらhiddenViewというメソッドを呼ぶようにという設定
        //そのメソッドは　Line95以下の　@objc func hiddenView(notification: NSNotification)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.hiddenView),
                                               name: Notification.Name("HIDDEN"),
                                               object: nil)
//********************************************************************************************************************
//  問題を設定する
    setQuestions(Int: questionNumber)
        
    // ”ヒントはここをタップ”のhintWordをローカライズ
    kWord.text = "\(NSLocalizedString("hintWord", comment: ""))"
    //「発音と用例」ボタンをローカライズ
    PronunciationExamples.text = "\(NSLocalizedString("PronunciationExamples", comment: ""))"
    
    //正解が３回になったら、リセットする　　c330 NotificationCenter.default.post(notification)に対応
    NotificationCenter.default.addObserver(
        self,
        selector: #selector( ViewController.resetCount(_:)),
        name: NSNotification.Name(rawValue: "RESETCOUNT"),
        object: nil)
    startButton.isEnabled = false
        
    }
//NotificationCenterで設定したアラートに対応するメソッド：以下で各問題グループの先頭の解説文（Container)を消し、問題が始められるようにする***********
    @objc func hiddenView(notification: NSNotification) {
        //問題グループ解説のページを非表示にする
        questionIntroContainer.isHidden = true
    }
//********************************************************************************************************************
    //復習リストでグループ解説が出てこないようにするためのメソッド***********
  func hiddenView2() {
        //問題グループ解説のページを非表示にする
        questionIntroContainer.isHidden = true
    }
//********************************************************************************************************************


    override func viewWillLayoutSubviews(){
        super.viewWillLayoutSubviews()
//iPhoneサイズによる画面調整
        //print(self.view.frame.height) //これで高さをプリントした
        //以下で、PlusとX（サイズ　736.6以上）の場合、Constraintsの選択でXの場合が稼働し、トップから150ポイント下げる設定をした
//        if self.view.frame.height >= 736.0 {
//        NSLayoutConstraint.deactivate([defaulConst]) //サイズのデフォルト値を選択
//        NSLayoutConstraint.activate([XConst]) //サイズのX値を選択
//        }
    }


    override func viewWillAppear(_ animated: Bool) {
        
        label.text = ""
        //setAudio()
        //上記で、このビュウが画面に表示sされるときにラベルが空にされる
        //何度でも呼ばれる
        //[「STARTボタンを押す」]のページを表示する
        PressStart.isHidden = false
    }
    // 以下で問題の設定　Intはゼロから始まる
    func setQuestions(Int:Int){
        
        if Int < self.questions.count {
            qNumber.text = "第 \(Int + 1) 問"
            question.text = questions[Int]
            vWord.text = vietnamese[Int]
            kWord.text = katakana[Int]
        }
    }
    // 以下で、AudioEngineは問題提示時にSTOP状態
    func stopAudio(){
        if audioEngine.isRunning {
            audioEngine.stop()
            recognitionRequest?.endAudio()
        }
    }
    //Startボタンを押さずに初期設定が録音開始状態とする関数
//    func setAudio(){
//        if audioEngine.isRunning {
//            audioEngine.stop()
//            recognitionRequest?.endAudio()
//            startButton.isEnabled = false
//            startButton.setTitle("停止中", for: .disabled)
//        } else {
//            try! startRecording()
//            startButton.setTitle("STOP", for: [])
//        }
//    }
    
    
    // STARTを押して音声認識を開始
    @IBAction func startButtonTapped(_ sender: Any) {
        if audioEngine.isRunning {
            audioEngine.stop()
            recognitionRequest?.endAudio()
            startButton.isEnabled = false
            startButton.setTitle("停止中", for: .disabled)
        } else {
            try! startRecording()
            startButton.setTitle("STOP", for: [])
            //[「STARTボタンを押す」]のページを非表示にする
            PressStart.isHidden = true
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
    //以下のメソッドを呼び出すことで音声録音開始
    private func startRecording() throws {
        refreshTask()
        
        let audioSession = AVAudioSession.sharedInstance()
        // 録音用のカテゴリをセット
        try audioSession.setCategory(AVAudioSession.Category(rawValue: convertFromAVAudioSessionCategory(AVAudioSession.Category.playAndRecord)), mode: .default)
        try audioSession.setMode(AVAudioSession.Mode.default)
        try audioSession.setActive(true, options: .notifyOthersOnDeactivation)
        recognitionRequest = SFSpeechAudioBufferRecognitionRequest()
        let inputNode:AVAudioInputNode = audioEngine.inputNode

        guard let recognitionRequest = recognitionRequest else { fatalError("Unable to create a SFSpeechAudioBufferRecognitionRequest object") }
        
        // 以下がtrueとなっている時、音声認識開始
        recognitionRequest.shouldReportPartialResults = true
        recognitionTask = speechRecognizer.recognitionTask(with: recognitionRequest) { [weak self] result, error in
            guard let `self` = self else { return }
            
            var isFinal = false
            
            if let result = result { //if let 定数＝定数　→ optional bindingであり、右に値があった場合は左側に代入を許す。result はオプショナル型で、変数にnil(false)の代入を許す　＝＞　中に値が入っていれば（true),代入が行われる。nilであれば、処理が行われない/安全に処理が行われる
                
                isFinal = result.isFinal //文字列が最後になったら、ループを抜ける
                if self.questionNumber < self.questions.count{
                    let str = result.bestTranscription.formattedString //strに認識された文字列が入る
                    //                検索する文字列
                    let word = self.questions[self.questionNumber] //＊＊＊　var を　let　に変えてみた　"Variable "word" was never mutated"　黄色エラーが消えた
                    //var word = self.questions[self.questionNumber]
                    self.count = 0 //正解数のカウントを初期化
                    
                    //以下で最大の長さの文字列をとってきて、例「アンシンする」とすると、startIndexは０番で”ア”、endIndexdは”る”で５番という範囲をいれる
                    //startIndex = 0, endIndex = 5となる
                    var nextRange = str.startIndex..<str.endIndex //Index Range
                    
                    // rangeにはインデックス番号が振ってあり、０からはじまる。while let であるためオプショナルバインディング」となり、右辺の判定式がnilでなければ代入を行う。
                    // 上のstr(長い文字列）に含まれていれば、ここで代入する
                    // 以下の右辺に値が入っていれば、左辺のrangeに代入する。　str.rangeに求めるワードが入っていたら、true
                    while let range = str.range(of: word, options: .caseInsensitive, range: nextRange){ //正解判定　（true／false）

                        self.count += 1 //正解判定がtureだった場合、カウントを＋１
                        if self.gCount < self.count { //1回のループが終わった時に、gCountに文字列が入った＝trueにする、そしてself.countがself.gCountより大きい場合
                            self.correctFlag = true
                            self.gCount = self.count
                        }else{
                            self.correctFlag = false
                        }
                        self.label.text = self.question.text! //labelにquestionの値を代入　「正解」の文字列をlabelに入れる
                        nextRange = range.upperBound..<str.endIndex //見つけた単語の次(range.upperBound)から元の文字列の最後までの範囲で次を探す
                        
                    }
                    
                    if self.correctFlag == false { //判定式（＝＝）で、「答え」が間違っていたら、以下を行う
                        self.label.text = "\(NSLocalizedString("again", comment: ""))"
                        self.gCount = self.count
                    }
                    
                    self.correctFlag = false //correctFlagをfalseにする
                }
                
                if self.count == 1 {
                    
                    self.correct1.image = UIImage(named:"tick_orange")
                    self.correct2.image = UIImage(named:"unfilledCircle")
                    self.correct3.image = UIImage(named:"unfilledCircle")
                    
                }else if self.count == 2{
                    
                    
                    self.correct1.image = UIImage(named:"tick_orange")
                    self.correct2.image = UIImage(named:"tick_orange")
                    self.correct3.image = UIImage(named:"unfilledCircle")
                }else if self.count == 3 {
                    
                   
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
                        self.kWord.text = "\(NSLocalizedString("hintWord", comment: ""))"//ヒントをクリアして、初期状態に戻している
                      
                    }
                    sleep(UInt32(0.2)) //０.２秒間処理を遅らせることでエラー回避
                    self.performSegue(withIdentifier:"modal", sender:nil)
                    
                    //ここでprepare for segueを呼び出す
                }
                isFinal = result.isFinal //これがtrueになったら、一旦音声認識のループから外れる。
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
    
    //refreshTaskが呼ばれると、音声認識のリセットがおこおなわれる
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
        //label.text = "発音してください。"
        label.text = "\(NSLocalizedString("ReadOut", comment: ""))"    }
    
    
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
    //ローカライズ設定
    hintWord.text = "\(NSLocalizedString("hintWord", comment: ""))"
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
        
        let reviewArray = try! Realm().objects(Review.self).sorted(byKeyPath: "id", ascending: true)
        if reviewArray.count != 0 {
            self.review.id = reviewArray.max(ofProperty: "id")! + 1
        } else {
            self.review.id = 0
        }
       
        let skippedQuestionNumber = questionNumber
        //アラートの文言をローカライズ
        let alertController = UIAlertController(title: "\(NSLocalizedString("SkipQuestion", comment: ""))", message: "", preferredStyle: UIAlertController.Style.alert)
        
        let action = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler:{
            (action:UIAlertAction!) -> Void in
            // 以降内容をアップデートするとリスト内は自動的に更新される。
            
            self.questionNumber += 1
            self.setQuestions(Int: self.questionNumber)
            self.skipCount += 1
            self.kWord.text = "\(NSLocalizedString("hintWord", comment: ""))"//ヒントをクリアして、初期状態に戻している
            
            let notification: Notification = Notification(name: Notification.Name(rawValue: "RESETCOUNT"), object: nil, userInfo: nil)
            
            NotificationCenter.default.post(notification)
            if self.questionNumber == self.questions.count{
                self.questionNumber = self.questions.count
                self.performSegue(withIdentifier: "modal", sender: nil)
            }
            
            //ここから復習リストへの追加がスタート
            try! self.realm.write {
                
                //　問題
                self.review.questions = self.questions[skippedQuestionNumber]

                // カタカナによる発音ヒント
                self.review.katakana = self.katakana[skippedQuestionNumber]

                // ベトナム語
                self.review.vietnamese = self.vietnamese[skippedQuestionNumber]

                /// 日越の例文 配列が　[[""]]なので、以下のようになる
                self.review.reibunJ1 = self.reibunJ1[skippedQuestionNumber][0]
                self.review.reibunV1 = self.reibunV1[skippedQuestionNumber][0]
                self.review.reibunJ2 = self.reibunJ2[skippedQuestionNumber][0]
                self.review.reibunV2 = self.reibunV2[skippedQuestionNumber][0]
                // 音声ファイル
                self.review.pronunciationJ = self.pronunciationJ[skippedQuestionNumber]
       
                //            // 書き込み処理
                self.realm.add(self.review, update: true)
                //

                
            }
            //「STARTボタンを押す」を再提示
            self.PressStart.isHidden = false
        })
        
        //アラートが出て、キャンセルを行う
        let cancelAction = UIAlertAction(title: "cancel", style: UIAlertAction.Style.cancel, handler:{
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
            popup.reibunJ1 = reibunJ1[self.questionNumber - 1][0]
            popup.reibunV1 = reibunV1[self.questionNumber - 1][0]
            popup.reibunJ2 = reibunJ2[self.questionNumber - 1][0]
            popup.reibunV2 = reibunV2[self.questionNumber - 1][0]
            popup.pronunciationJ = pronunciationJ[self.questionNumber - 1]
            // *******************************************************************************
            
            popup.reviewQuestionNumber = reviewQuestionNumber
            
        }
        
        if(segue.identifier == "GroupExp"){
            let IntroGroup:IntroGroupViewController = (segue.destination as! IntroGroupViewController)
            IntroGroup.cellNumber = self.cellNumber
            //questionsの配列（問題）をIntroGroupに送りたい
            IntroGroup.questions = questions
        }
        
        //以下で、モデル音声と用例のポップアップへ移動
        if(segue.identifier == "toExplanation"){
            let popup:HintViewController = (segue.destination as! HintViewController)
            popup.questionWord = self.question.text!
            popup.pronunciation = self.pronunciationJ[questionNumber]
            popup.reibun_J1 = self.reibunJ1[questionNumber]
            popup.reibun_V1 = self.reibunV1[questionNumber]
            popup.reibun_J2 = self.reibunJ2[questionNumber]
            popup.reibun_V2 = self.reibunV2[questionNumber]
            self.stopAudio()
        }
        
    }
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromAVAudioSessionCategory(_ input: AVAudioSession.Category) -> String {
	return input.rawValue
}
