//
//  MenuViewController.swift
//  KanetsuGo
//
//  Created by クロス尚美 on 2018/04/24.
//  Copyright © 2018年 NC. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

//    @IBOutlet weak var LetsSelectCourse: UILabel!
//    @IBOutlet weak var ForN1: UIButton!
    @IBOutlet weak var ForN2: UIButton!
    @IBOutlet weak var LetsStart: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController!.navigationBar.shadowImage = UIImage()
        //以下でラベルの数だけローカライズ
//        LetsSelectCourse.text = "\(NSLocalizedString("LetsSelectCourse", comment: ""))"
        //以下でボタンをローカライズ
//        ForN1.setTitle("\(NSLocalizedString("ForN1", comment: ""))", for:UIControlState.normal)
       // ForN2.setTitle("\(NSLocalizedString("ForN2", comment: ""))", for:UIControl.State.normal)
        LetsStart.text = "\(NSLocalizedString("LetsStart", comment: ""))"
        
        // 行間の変更(正確には行自体の高さを変更している。)
        let lineHeight:CGFloat = 35.0
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.minimumLineHeight = lineHeight
        paragraphStyle.maximumLineHeight = lineHeight
        let attributedText = NSMutableAttributedString(string: LetsStart.text!)
        attributedText.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attributedText.length))
        LetsStart.attributedText = attributedText
        LetsStart.textAlignment = NSTextAlignment.center //ここで、ローカライズしたあともcenterになるように設定
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
