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

    @IBOutlet weak var Exp4_skip: UILabel!
    @IBOutlet weak var Exp4: UILabel!
    
    @IBAction func PageDot(_ sender: UIPageControl) {
    }
    @IBAction func skip(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    Exp4.text = "\(NSLocalizedString("Exp4", comment: ""))"
    Exp4_skip.text = "\(NSLocalizedString("Exp4_skip", comment: ""))"
        
        let height = UIScreen.main.bounds.size.height
        var lineHeight:CGFloat = 25.0
        var lineHeight2:CGFloat = 25.0
        
        //iPhone の行間設定
        if height <= 812 {
            lineHeight = 25.0
            lineHeight2 = 25.0
        //iPad の行間設定
        }else{
            lineHeight = 40.0
            lineHeight2 = 40.0
            
        }
        
    
        // 行間の変更(正確には行自体の高さを変更している。)
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.minimumLineHeight = lineHeight
        paragraphStyle.maximumLineHeight = lineHeight
        let attributedText = NSMutableAttributedString(string: Exp4_skip.text!)
        attributedText.addAttribute(NSAttributedStringKey.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attributedText.length))
        Exp4_skip.attributedText = attributedText
        
        // 行間の変更(正確には行自体の高さを変更している。 ２箇所行間を変えるLabelがある場合は、＝２をつけて区別する
        
        let paragraphStyle2 = NSMutableParagraphStyle()
        paragraphStyle2.minimumLineHeight = lineHeight2
        paragraphStyle2.maximumLineHeight = lineHeight2
        let attributedText2 = NSMutableAttributedString(string: Exp4.text!)
        attributedText2.addAttribute(NSAttributedStringKey.paragraphStyle, value: paragraphStyle2, range: NSMakeRange(0, attributedText2.length))
        Exp4.attributedText = attributedText2
        
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
