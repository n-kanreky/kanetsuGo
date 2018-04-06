//
//  WT4ViewController.swift
//  KanetsuGo
//
//  Created by n.kanreky on 2018/02/01.
//  Copyright © 2018年 NC. All rights reserved.
//

import UIKit

class WT4ViewController: UIViewController {
    //ローカライズ設定
    @IBOutlet weak var IfNotSure: UILabel!
    @IBOutlet weak var PressHint: UILabel!
    @IBOutlet weak var Listen: UILabel!
    @IBOutlet weak var SkipQ: UILabel!
    @IBOutlet weak var RevisionList: UILabel!
    
    @IBAction func PageDot(_ sender: UIPageControl) {
    }
    @IBAction func skip(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    IfNotSure.text = "\(NSLocalizedString("IfNotSure", comment: ""))"
    PressHint.text = "\(NSLocalizedString("PressHint", comment: ""))"
    Listen.text = "\(NSLocalizedString("Listen", comment: ""))"
    SkipQ.text = "\(NSLocalizedString("SkipQ", comment: ""))"
    RevisionList.text = "\(NSLocalizedString("RevisionList", comment: ""))"
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
