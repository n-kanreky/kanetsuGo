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
    @IBOutlet weak var deleteAndReturn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // startのローカリゼーション
        
        deleteAndReturn.setTitle("\(NSLocalizedString("deleteAndReturn", comment: ""))", for:UIControlState.normal)
       
        // 一番上のquestionの行間の変更(正確には行自体の高さを変更している。)
        let lineHeight1:CGFloat = 40.0
        let paragraphStyle1 = NSMutableParagraphStyle()
        paragraphStyle1.minimumLineHeight = lineHeight1
        paragraphStyle1.maximumLineHeight = lineHeight1
        let attributedText1 = NSMutableAttributedString(string: question.text!)
        attributedText1.addAttribute(NSAttributedStringKey.paragraphStyle, value: paragraphStyle1, range: NSMakeRange(0, attributedText1.length))
        question.attributedText = attributedText1
        question.textAlignment = NSTextAlignment.center //ここで、ローカライズしたあともcenterになるように設定
        
        
        // 行間の変更(正確には行自体の高さを変更している。)
        let lineHeight:CGFloat = 40.0
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.minimumLineHeight = lineHeight
        paragraphStyle.maximumLineHeight = lineHeight
        let attributedText = NSMutableAttributedString(string: Questions.text!)
        attributedText.addAttribute(NSAttributedStringKey.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attributedText.length))
        Questions.attributedText = attributedText
        Questions.textAlignment = NSTextAlignment.center //ここで、ローカライズしたあともcenterになるように設定
        
       
        
        
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

            question.text = "Group \(cellNumber + 1) \(NSLocalizedString("QSG1", comment: ""))"
            
        case 1:
            GroupExp.text = "\(NSLocalizedString("Group2", comment: ""))"

            question.text = "Group \(cellNumber + 1) \(NSLocalizedString("QSG2", comment: ""))"
            
        case 2:
            GroupExp.text = "\(NSLocalizedString("Group3", comment: ""))"
            
            question.text = "Group \(cellNumber + 1) \(NSLocalizedString("QSG3L", comment: ""))"
            
        case 3:
            GroupExp.text = "\(NSLocalizedString("Group4", comment: ""))"
            
            question.text = "Group \(cellNumber + 1) \(NSLocalizedString("QSG4", comment: ""))"
        case 4:
            GroupExp.text = "\(NSLocalizedString("Group5", comment: ""))"
            
            question.text = "Group \(cellNumber + 1) \(NSLocalizedString("QSG5", comment: ""))"
        case 5:
            GroupExp.text = "\(NSLocalizedString("Group6", comment: ""))"
            
            question.text = "Group \(cellNumber + 1) \(NSLocalizedString("QSG6", comment: ""))"
        case 6:
            GroupExp.text = "\(NSLocalizedString("Group7", comment: ""))"
            
            question.text = "Group \(cellNumber + 1) \(NSLocalizedString("QSG7", comment: ""))"
        case 7:
            GroupExp.text = "\(NSLocalizedString("Group8", comment: ""))"
            
            question.text = "Group \(cellNumber + 1) \(NSLocalizedString("QSG8", comment: ""))"
        case 8:
            GroupExp.text = "\(NSLocalizedString("Group9", comment: ""))"
            
            question.text = "Group \(cellNumber + 1) \(NSLocalizedString("QSG9", comment: ""))"
        case 9:
            GroupExp.text = "\(NSLocalizedString("Group10", comment: ""))"
            
            question.text = "Group \(cellNumber + 1) \(NSLocalizedString("QSG10", comment: ""))"
     
        default:
            break
            
        }
        //三つ目の行間設定　（２で設定）
        let lineHeight2:CGFloat = 40.0
        let paragraphStyle2 = NSMutableParagraphStyle()
        paragraphStyle2.minimumLineHeight = lineHeight2
        paragraphStyle2.maximumLineHeight = lineHeight2
        let attributedText2 = NSMutableAttributedString(string: GroupExp.text!)
        attributedText2.addAttribute(NSAttributedStringKey.paragraphStyle, value: paragraphStyle2, range: NSMakeRange(0, attributedText2.length))
        GroupExp.attributedText = attributedText2
        
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
    
}

