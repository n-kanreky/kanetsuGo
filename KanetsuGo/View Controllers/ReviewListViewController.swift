//
//  ReviewListViewController.swift
//  KanetsuGo
//
//  Created by n.kanreky on 2017/10/22.
//  Copyright © 2017年 NC. All rights reserved.
//

import UIKit
import RealmSwift

@available(iOS 10.0, *) //iOS 10.0以上に対応
class ReviewListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var ReviewList: UILabel! //ローカライズ
    @IBOutlet weak var ToSelectQuestions: UIButton! //ローカライズ　ボタン
    
    var questionCount = 0
    var correctAnswer = 0
    var skipCount = 0
    var review: Review! = Review() //復習リストに追加したインスタンス
    var question = ""
    var katakana = ""
    var vietnamese = ""
    var reibunJ = ""
    var pronunciationJ = ""
    
    var reviewArray = Array(try! Realm().objects(Review.self).sorted(byKeyPath: "id", ascending: true))
    let realm = try! Realm()
    
    @IBOutlet weak var reviewView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ReviewList.text = "\(NSLocalizedString("ReviewList", comment: ""))" //ローカライズ
        ToSelectQuestions.setTitle("\(NSLocalizedString("ToSelectQuestions", comment: ""))", for:UIControlState.normal) //ボタンのローカライズ
        reviewView.dataSource = self //TableViewのセルにデータを反映させるメソッドを利用可能にする
        reviewView.delegate = self //delegateメソッド　TableViewの動的処理（タップなど）のメソッドを利用可能にする
    }
   
    override func viewWillAppear(_ animated: Bool) { //画面が現れたら、以下のメソッドを実行する
        super.viewWillAppear(true)
        reviewArray = Array(try! Realm().objects(Review.self).sorted(byKeyPath: "id", ascending: true))
        self.reviewView.reloadData() //table view (reviewView)の更新
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reviewArray.count // N個のデータがあるという意味 変数questionsの中の値（カンマ区切り）を数える
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // 再利用可能な cell を得る
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath as IndexPath)
        // 文字色変更
        cell.textLabel?.textColor = UIColor.init(red: 64/255, green: 131/255, blue: 174/255, alpha: 1)
        
        //文字の大きさを変える
        let height = UIScreen.main.bounds.size.height
        
        cell.textLabel!.font = UIFont.boldSystemFont(ofSize: 20)
        //iPhone の文字の大きさ設定
        if height <= 812 {
            cell.textLabel!.font = UIFont.boldSystemFont(ofSize: 20)
            //iPad の文字の大きさ設定
        }else{
            cell.textLabel!.font = UIFont.boldSystemFont(ofSize: 30)
            
        }
        
        // 値を設定する.
        cell.textLabel!.text = reviewArray[indexPath.row].questions
        return cell
    }
    // 各セルを選択した時に実行されるメソッド
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
       performSegue(withIdentifier: "reviewSegue",sender: indexPath.row)
        
    }
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {

        let deleteButton: UITableViewRowAction = UITableViewRowAction(style: .normal, title: "\(NSLocalizedString("Delete", comment: ""))") { (action, index) -> Void in
            // 削除されたタスクを取得する
            let review = self.reviewArray[indexPath.row]

            // データベースから削除する
            try! self.realm.write { //transaction＝　DBとの通信　を行うメソッドを走らせる
                self.realm.delete(review)
                self.reviewArray = Array(try! Realm().objects(Review.self).sorted(byKeyPath: "id", ascending: true))
                self.reviewView.deleteRows(at: [indexPath], with: .fade)
            }
          
        }
        deleteButton.backgroundColor = UIColor.red
        
      
        return [deleteButton] //return ＝　返り値　line69のfunctionに対して、値を返す
        
    }
    
    @IBAction func returnToQSelection(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         //   var questions = [reviewArray[sender as!Int]]
            if(segue.identifier == "reviewSegue"){
                let viewController:ViewController = (segue.destination as! ViewController)
                let review = reviewArray[sender as!Int]
//               以下で正解したReview Questionを削除する準備をする
                viewController.reviewQuestionNumber = sender as!Int
//
                viewController.questions = [review.questions]
                viewController.katakana = [review.katakana]
                viewController.vietnamese = [review.vietnamese]
                viewController.pronunciationJ = [review.pronunciationJ]
                viewController.reibunJ = [[review.reibunJ]]
               flag = "ReviewList"
                
         }
     }
}


