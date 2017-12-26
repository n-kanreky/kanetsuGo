//
//  Review.swift
//  KanetsuGo
//
//  Created by クロス尚美 on 2017/10/22.
//  Copyright © 2017年 NC. All rights reserved.
//

import RealmSwift

class Review: Object {
    // 管理用 ID。プライマリーキー
    @objc dynamic var id = 0
    
    // 問題
    @objc dynamic var questions = ""
    
    // カタカナによる発音ヒント
    @objc dynamic var katakana = ""
    
    // ベトナム語
    @objc dynamic var vietnamese = ""
    
    /// 日越の例文
    @objc dynamic var reibunJ = ""
    
    // 音声ファイル
    @objc dynamic var pronunciationJ = ""
    
    /**
     id をプライマリーキーとして設定
     */
    override static func primaryKey() -> String? {
        return "id"
    }
}

