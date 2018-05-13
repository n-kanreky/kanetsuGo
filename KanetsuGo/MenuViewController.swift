//
//  MenuViewController.swift
//  KanetsuGo
//
//  Created by クロス尚美 on 2018/04/24.
//  Copyright © 2018年 NC. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    @IBOutlet weak var LetsSelectCourse: UILabel!
    @IBOutlet weak var ForN1: UIButton!
    @IBOutlet weak var ForN2: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //以下でラベルの数だけローカライズ
        LetsSelectCourse.text = "\(NSLocalizedString("LetsSelectCourse", comment: ""))"
        //以下でボタンをローカライズ
        ForN1.setTitle("\(NSLocalizedString("ForN1", comment: ""))", for:UIControlState.normal)
        ForN2.setTitle("\(NSLocalizedString("ForN2", comment: ""))", for:UIControlState.normal)
        
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
