//
//  BackToViewController.swift
//  KanetsuGo
//
//  Created by クロス尚美 on 2018/05/23.
//  Copyright © 2018年 NC. All rights reserved.
//

import UIKit

class BackToViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backToViewController(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func hideIntro(_ sender: Any) {
        NotificationCenter.default.post(
            Notification(name:Notification.Name("HIDDEN"))
        )
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
