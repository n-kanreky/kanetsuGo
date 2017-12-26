//
//  ReviewListViewController.swift
//  KanetsuGo
//
//  Created by クロス尚美 on 2017/10/22.
//  Copyright © 2017年 NC. All rights reserved.
//

import UIKit
import RealmSwift

@available(iOS 10.0, *)
class ReviewListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var questionCount = 0
    var correctAnswer = 0
    var skipCount = 0
    var review: Review! = Review()
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
        reviewView.dataSource = self
        reviewView.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        let realm = try! Realm()
        reviewArray = Array(try! Realm().objects(Review.self).sorted(byKeyPath: "id", ascending: true))
        self.reviewView.reloadData() //table view (reviewView)の更新
        print("viewWilAppearの中")
        print(self.reviewArray)
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
        cell.textLabel!.font = UIFont.boldSystemFont(ofSize: 20)
        // 値を設定する.
        
        cell.textLabel!.text = reviewArray[indexPath.row].questions
        return cell
    }
    // 各セルを選択した時に実行されるメソッド
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    
        performSegue(withIdentifier: "reviewSegue",sender: indexPath.row)
        
    }
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let deleteButton: UITableViewRowAction = UITableViewRowAction(style: .normal, title: "削除") { (action, index) -> Void in
           self.reviewArray.remove(at: indexPath.row)
          tableView.deleteRows(at: [indexPath as IndexPath], with: UITableViewRowAnimation.fade)
        }
        deleteButton.backgroundColor = UIColor.red
        // 削除されたタスクを取得する
        let review = self.reviewArray[indexPath.row]
        // データベースから削除する
        try! realm.write {
            self.realm.delete(review)
            
        }
        return [deleteButton]
    }
    @IBAction func returnToQSelection(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         //   var questions = [reviewArray[sender as!Int]]
            if(segue.identifier == "reviewSegue"){
    
                    let viewController:ViewController = (segue.destination as! ViewController)
                
                    // Fallback on earlier versions
    
                let review = reviewArray[sender as!Int]
    
                viewController.questions = [review.questions]
    
   
                // Fallback on earlier versions ViewController.
                viewController.katakana = [review.katakana]
                viewController.vietnamese = [review.vietnamese]
                viewController.pronunciationJ = [review.pronunciationJ]
                viewController.reibunJ = [[review.reibunJ]]
               flag = "ReviewList"
                
            }
    
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

