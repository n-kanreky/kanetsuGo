//
//  WT1ViewController.swift
//  KanetsuGo
//
//  Created by n.kanreky on 2018/02/01.
//  Copyright © 2018年 NC. All rights reserved.
//

import UIKit

class WT1ViewController: UIViewController {
    //以下にアウトレット接続して、ラベルに名前をつける
    @IBOutlet weak var Instruction: UILabel!
    @IBAction func PageDot(_ sender: UIPageControl) {
    }
    //@IBAction func skip(_ sender: Any) {
        //dismiss(animated: true, completion: nil)
    //}
    override func viewDidLoad() {
        super.viewDidLoad()
        //以下でラベルの数だけローカライズ
       Instruction.text = "\(NSLocalizedString("Instruction", comment: ""))"
   
        
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
