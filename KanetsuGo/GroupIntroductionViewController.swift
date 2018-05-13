//
//  GroupIntroductionViewController.swift
//  KanetsuGo
//
//  Created by クロス尚美 on 2018/05/08.
//  Copyright © 2018年 NC. All rights reserved.
//

import UIKit

class GroupIntroductionViewController: UIViewController {
var cellNumber = 0
    
    @IBOutlet weak var lessonTitle: UILabel!
    @IBOutlet weak var lessonExplanation: UITextView!
    @IBAction func startQuestion(_ sender: Any) {
    self.view.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 値を設定する.
        switch cellNumber{
        case 0:
            self.lessonTitle.text = "lessonTitle"
            self.lessonExplanation.text = "\(NSLocalizedString("Group_1", comment: ""))"
            print("lessonTitle")
            print("Group_1")
        case 1:
            self.lessonTitle.text = "lessonTitle"
            self.lessonExplanation.text = "\(NSLocalizedString("Group_1", comment: ""))"
        case 2:
            self.lessonTitle.text = "lessonTitle"
            self.lessonExplanation.text = "\(NSLocalizedString("Group_1", comment: ""))"
        case 3:
            self.lessonTitle.text = "lessonTitle"
            self.lessonExplanation.text = "\(NSLocalizedString("Group_1", comment: ""))"
        case 4:
            self.lessonTitle.text = "lessonTitle"
            self.lessonExplanation.text = "\(NSLocalizedString("Group_1", comment: ""))"
        case 5:
            self.lessonTitle.text = "lessonTitle"
            self.lessonExplanation.text = "\(NSLocalizedString("Group_1", comment: ""))"
        case 6:
            self.lessonTitle.text = "lessonTitle"
            self.lessonExplanation.text = "\(NSLocalizedString("Group_1", comment: ""))"
        case 7:
            self.lessonTitle.text = "lessonTitle"
            self.lessonExplanation.text = "\(NSLocalizedString("Group_1", comment: ""))"
        case 8:
            self.lessonTitle.text = "lessonTitle"
            self.lessonExplanation.text = "\(NSLocalizedString("Group_1", comment: ""))"
            
            
        default:
            break // do nothing
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
