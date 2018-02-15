//
//  PageViewController.swift
//  KanetsuGo
//
//  Created by クロス尚美 on 2018/02/01.
//  Copyright © 2018年 NC. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDataSource{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setViewControllers([getFirst()], direction: .reverse, animated: true, completion: nil)
        //　最初のviewControllerを設定している
        self.dataSource = self
    }
    
    @IBAction func tutorial(_ sender: Any) {
    }
    
    //全ページ数を返すメソッド
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 5
    }
    
    //ページコントロールの最初の位置を返すメソッド
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
    func getFirst() -> WT1ViewController {
        return storyboard!.instantiateViewController(withIdentifier: "WT1") as! WT1ViewController
        //StoryBoard上のFirstViewControllerをインスタンス化している
        //withIdentifierはStoryBoard上で設定したStoryBoard Id
    }
    
    func getSecond() -> WT2ViewController {
        return storyboard!.instantiateViewController(withIdentifier: "WT2") as! WT2ViewController
    }
    func getThird() -> WT3ViewController {
        return storyboard!.instantiateViewController(withIdentifier: "WT3") as! WT3ViewController
    }
    func getFourth() -> WT4ViewController {
        return storyboard!.instantiateViewController(withIdentifier: "WT4") as! WT4ViewController
    }
    func getFifth() -> WT5ViewController {
        return storyboard!.instantiateViewController(withIdentifier: "WT5") as! WT5ViewController
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        // 左に進む動き（前に戻る）
        
        if viewController.isKind(of: WT5ViewController.self)// 現在のviewControllerがWT5ViewControllerかどうか調べる
        {
            // 5 -> 4
            return getFourth()
            
        } else if viewController.isKind(of: WT4ViewController.self) {// 現在のviewControllerがWT4ViewControllerかどうか調べる
            // 4 -> 3
            return getThird()
        } else if viewController.isKind(of: WT3ViewController.self) {// 現在のviewControllerがWT3ViewControllerかどうか調べる
            // 3 -> 2
            return getSecond()
        } else if viewController.isKind(of: WT2ViewController.self) {// 現在のviewControllerがWT2ViewControllerかどうか調べる
            // 2 -> 1
            return getFirst()
        } else {
            // 1 -> end of the road
            return nil
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController?
    {
        // 右に進む（先に進む）
        
        if viewController.isKind(of: WT1ViewController.self)//　現在のviewControllerがFirstViewControllerかどうか調べる
        {
            // 1 -> 2
            return getSecond()
            
        } else if viewController.isKind(of: WT2ViewController.self) {//　現在のviewControllerがSecondViewCotrollerかどうか調べる
            // 2 -> 3
            return getThird()
        } else if viewController.isKind(of: WT3ViewController.self) {
            // 3 -> 4
            return getFourth()
        } else if viewController.isKind(of: WT4ViewController.self) {
            // 4 -> 5
            return getFifth()
        } else {
            // 5 -> end of the road
            return nil
        }
    }
}
