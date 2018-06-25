//
//  IntroGroupViewController.swift
//  KanetsuGo
//
//  Created by クロス尚美 on 2018/05/13.
//  Copyright © 2018年 NC. All rights reserved.


import UIKit


class IntroGroupViewController: UIViewController {
    var cellNumber = 0
    var questions:[String] = [""]
    var questionStrings = ""
    
    @IBOutlet weak var GroupExp: UILabel!
    @IBOutlet weak var Questions: UILabel!
    @IBOutlet weak var question: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var count = 0
        for questionString in questions {
            if count == 0 {
                questionStrings = questionStrings + questionString
                
            }else{
                questionStrings = questionStrings + ",  " + questionString
                
            }
            count = count + 1
        }
        Questions.text = questionStrings
        switch cellNumber {
        case 0:
            GroupExp.text = "\(NSLocalizedString("Group1", comment: ""))"
            print("Group1")
            question.text = "Group \(cellNumber + 1)     音が似ている漢語"
        case 1:
            GroupExp.text = "\(NSLocalizedString("Group2", comment: ""))"
            question.text = "Group \(cellNumber + 1)   週  を含む漢語"
        case 2:
            GroupExp.text = "\(NSLocalizedString("Group3", comment: ""))"
            question.text = "Group \(cellNumber + 1)   出  を含む漢語"
        case 3:
            GroupExp.text = "\(NSLocalizedString("Group4", comment: ""))"
            question.text = "Group \(cellNumber + 1)   上  を含む漢語"
        case 4:
            GroupExp.text = "\(NSLocalizedString("Group5", comment: ""))"
            question.text = "Group \(cellNumber + 1)   通  を含む漢語"
        case 5:
            GroupExp.text = "\(NSLocalizedString("Group6", comment: ""))"
            question.text = "Group \(cellNumber + 1)   生  を含む漢語"
        case 6:
            GroupExp.text = "\(NSLocalizedString("Group7", comment: ""))"
            question.text = "Group \(cellNumber + 1)   同形同義"
        case 7:
            GroupExp.text = "\(NSLocalizedString("Group8", comment: ""))"
            question.text = "Group \(cellNumber + 1)   同形異議"
        case 8:
            GroupExp.text = "\(NSLocalizedString("Group9", comment: ""))"
            question.text = "Group \(cellNumber + 1)   配列が逆の語"
        case 9:
            GroupExp.text = "\(NSLocalizedString("Group10", comment: ""))"
            question.text = "Group \(cellNumber + 1)   和製漢語"
        default:
            break
            
        }
        
        // Do any additional setup after loading the view.
    }
   
    @IBAction func returnToQuestion(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    override func viewWillAppear(_ animated: Bool){
        
    }
    
    
    @IBAction func deleteAndReturn(_ sender: Any) {
        NotificationCenter.default.post(
            Notification(name:Notification.Name("HIDDEN")))
        
        //self.dismiss(animated: true, completion: nil) //これがなくてもVCに戻るので、コメントアウト
        
        
        
        
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

