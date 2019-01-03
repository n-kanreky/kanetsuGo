//
//  PopupViewController.swift
//  KanetsuGo
//
//  Created by n.kanreky on 2017/10/22.
//  Copyright © 2017年 NC. All rights reserved.
//

import UIKit
import RealmSwift


class PopupViewController: UIViewController {
    
    @IBOutlet weak var popUpLabel: UILabel!
    @IBOutlet weak var nextLevelButton: UIButton!
    @IBOutlet weak var correctCountLabel: UILabel!
    @IBOutlet weak var addReviewButton: UIButton!
    
    
    var questionCount = 0
    var correctAnswer = 0
    var skipCount = 0
    //review class のインスタンス
    var review: Review! = Review()
    var question = ""
    var katakana = ""
    var vietnamese = ""
    var reibunJ1 = ""
    var reibunJ2 = ""
    var reibunV1 = ""
    var reibunV2 = ""
    var furigana1 = ""
    var furigana2 = ""
    var pronunciationJ = ""
    var pickQList = "" //ここにQリスト（通常、復習）を入れる
    var totalQuestions = 0
    var reviewCorrectFlag = false
    let realm = try! Realm()
    var reviewArray = try! Realm().objects(Review.self).sorted(byKeyPath: "id", ascending: true)
    //復習リストの問題をVCで正解した時のため
    var reviewQuestionNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //復習リストのボタンを以下に置き換えて、ローカライズ
        popUpLabel.text = "\(NSLocalizedString("", comment: ""))"
        addReviewButton.setTitle("\(NSLocalizedString("AddToReviewList", comment: ""))", for: UIControl.State.normal)
        nextLevelButton.setTitle("\(NSLocalizedString("NextLevelButton", comment: ""))", for:UIControl.State.normal)
        
        //以下でボタンの文字列を複数行にして表示可能とした
        nextLevelButton.titleLabel!.lineBreakMode = NSLineBreakMode.byWordWrapping
        nextLevelButton.titleLabel!.numberOfLines = 2
        nextLevelButton.titleLabel!.textAlignment = NSTextAlignment.center
        // Do any additional setup after loading the view.
        
       // print(NSLocale.preferredLanguages)// ["ja-JP", "en-GB", "en-JP"]    }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
    
        if  pickQList == "QSelection" {
            if reviewArray.count != 0 {
                self.review.id = reviewArray.max(ofProperty: "id")! + 1
            }
            if questionCount == self.totalQuestions {
                if skipCount == 0 {
                    
                    popUpLabel.text = "\(NSLocalizedString("AllCorrect", comment: ""))"
                    addReviewButton.isHidden = true
                    correctCountLabel.text = "\(questionCount)/\(questionCount-skipCount)"
                    nextLevelButton.setTitle("\(NSLocalizedString("LetsGoOnToNextLevel", comment: ""))", for: UIControl.State.normal)
                }else{
                
                    popUpLabel.text = "\(NSLocalizedString("YouCanDoIt", comment: ""))"
                    correctCountLabel.text = "\(questionCount-skipCount)/\(questionCount)"

            //設定言語の先頭にある言語でローカライズ する　["vi-US" 越語, "ja-US", "en-GB", "fr-US", "en", "ja-JP 日本語"]
                    if (NSLocale.preferredLanguages.first == "ja-JP"){ // "ja-JP"
                        print("ja-JP 日本語")
                        correctCountLabel.text = "\(questionCount)問中\(questionCount-skipCount)問正解"
                    }else if
                        (NSLocale.preferredLanguages.first == "vi-US"){
                        correctCountLabel.text = "\(questionCount-skipCount) trong số \(questionCount)câu hỏi Câu trả lời đúng"
                        print("ベトナム語")
                }else if
                       (NSLocale.preferredLanguages.first == "en"){
                        correctCountLabel.text = "Of \(questionCount) question(s)\(questionCount-skipCount) were questios correct"
                print("en")
                }else if
                        (NSLocale.preferredLanguages.first == "en-GB"){
                        correctCountLabel.text = "Of \(questionCount) question(s)\(questionCount-skipCount) were questios correct"
                print("en-GB")
                }else{
                        correctCountLabel.text = "\(questionCount)問中\(questionCount-skipCount)問正解"
                print("失敗")
                }
        //***************ローカライズ はここから上まで＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊
                    nextLevelButton.setTitle("\(NSLocalizedString("ReturnToQuestionList", comment: ""))", for: UIControl.State.normal)
                    addReviewButton.isHidden = true
                }
                
            }
        }else if pickQList == "ReviewList"{
            self.presentingViewController?.presentingViewController?.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
            if questionCount == self.totalQuestions {
                if skipCount == 0 {
                
                //正解の場合、以下でReviewリストから削除
                let reviewArray = Array(try! Realm().objects(Review.self).sorted(byKeyPath: "id", ascending: true))
                    // 削除されたタスクを取得する
                    let review = reviewArray[self.reviewQuestionNumber]
                    
                    // データベースから削除する
                    try! realm.write { //transaction＝　DBとの通信　を行うメソッドを走らせる
                        self.realm.delete(review)
                    }
                //以下でローカライズ
                popUpLabel.text = "\(NSLocalizedString("CorrectAnswer", comment: ""))"
                correctCountLabel.text = " "
                nextLevelButton.setTitle("\(NSLocalizedString("LetsReturnToReviewList", comment: ""))", for: UIControl.State.normal)
                //nextLevelButton.setTitle("\(NSLocalizedString("AddedToReviewList", comment: ""))", for: UIControlState.normal)
                    
//ここにReviewListから削除のコードを持って来て、正解した問題は復習リストから外す　indexPath.rawを出力して、VCに移し、またPopUpVCに持ってくる
                    
                    
                    
            }else{
                popUpLabel.text = "\(NSLocalizedString("YouCanDoIt", comment: ""))"
                addReviewButton.isHidden = true
                nextLevelButton.setTitle("\(NSLocalizedString("LetsReturnToReviewList", comment: ""))", for: UIControl.State.normal)
                //Reviewリストに戻る　popup VCとVC画面を消してReviewに戻る
                }
               
            }
        }
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // dismissを発火する
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        for touch: UITouch in touches {
            let tag = touch.view!.tag
            print(tag)
            if tag == 1 {
                dismiss(animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func addReview(_ sender: Any) {
        try! realm.write {
            
            //　問題
            self.review.questions = self.question
            
            // カタカナによる発音ヒント
            self.review.katakana = self.katakana
            
            // ベトナム語
            self.review.vietnamese = self.vietnamese
            
            /// 日越の例文
            self.review.reibunJ1 = self.reibunJ1
            self.review.reibunV2 = self.reibunV1
            self.review.reibunJ2 = self.reibunJ2
            self.review.reibunV2 = self.reibunV2
            self.review.furigana1 = self.furigana1
            self.review.furigana2 = self.furigana2
            // 音声ファイル
            self.review.pronunciationJ = self.pronunciationJ
            
            // 書き込み処理
            self.realm.add(self.review, update: true)
            //
            
            // 書き込み処理が終わったらNEXTボタンを押して次の問題に進む
            self.nextButton(UIButton())
            
        }
        
    }
    
    @IBAction func nextButton(_ sender: Any) {
        if questionCount == totalQuestions{
            
            self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
            
        }else{
            let notification: Notification = Notification(name: Notification.Name(rawValue: "RESETCOUNT"), object: nil, userInfo: nil)
            
            NotificationCenter.default.post(notification)
            
            dismiss(animated: true, completion: nil)
            
        }

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

