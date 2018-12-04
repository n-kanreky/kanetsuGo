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
       // ForN2.setTitle("\(NSLocalizedString("ForN2", comment: ""))", for:UIControlState.normal)
//        LetsStart.text = "\(NSLocalizedString("LetsStart", comment: ""))"
        
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

    //押された時にURLを起動
    @IBAction func toFAQ(_ sender: Any) {
        let url = NSURL(string:"https://www.kanetsugo.com/")
        let app:UIApplication = UIApplication.shared
        app.canOpenURL(url! as URL)
        app.open(url! as URL, options: convertToUIApplicationOpenExternalURLOptionsKeyDictionary([:]), completionHandler: nil)
    }
   

}
// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertToUIApplicationOpenExternalURLOptionsKeyDictionary(_ input: [String: Any]) -> [UIApplication.OpenExternalURLOptionsKey: Any] {
    return Dictionary(uniqueKeysWithValues: input.map { key, value in (UIApplication.OpenExternalURLOptionsKey(rawValue: key), value)})
}
