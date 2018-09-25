//
//  WT3ViewController.swift
//  KanetsuGo
//
//  Created by n.kanreky on 2018/02/01.
//  Copyright © 2018年 NC. All rights reserved.
//

import UIKit

class WT3ViewController: UIViewController {
    @IBOutlet weak var Step2: UILabel!
    @IBAction func PageDot(_ sender: UIPageControl) {
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
    Step2.text = "\(NSLocalizedString("Step2", comment: ""))"
        
        let height = UIScreen.main.bounds.size.height
        var lineHeight:CGFloat = 25.0
        
        
        //iPhone の行間設定
        if height <= 812 {
            lineHeight = 25.0
            
            //iPad の行間設定
        }else{
            lineHeight = 40.0
            
            
        }
        
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.minimumLineHeight = lineHeight
        paragraphStyle.maximumLineHeight = lineHeight
        let attributedText = NSMutableAttributedString(string:Step2.text!)
        attributedText.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range: NSMakeRange(0, attributedText.length))
        Step2.attributedText = attributedText
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
