//
//  WT3ViewController.swift
//  KanetsuGo
//
//  Created by n.kanreky on 2018/02/01.
//  Copyright © 2018年 NC. All rights reserved.
//

import UIKit

class WT3ViewController: UIViewController {
    @IBAction func PageDot(_ sender: UIPageControl) {
    }
    @IBAction func skip(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

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
