//
//  QSelectionViewController.swift
//  KanetsuGo
//
//  Created by n.kanreky on 2017/10/22.
//  Copyright © 2017年 NC. All rights reserved.
//

import UIKit

class QSelectionViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var questions = [["注射","注意","意見","温度","専門"],
                     ["出席","出発","出版","出身","提出"],
                     ["上級","上下","上旬","頂上","以上"],
                     ["通行","通信","通知","通訳","通過"],
                     ["生存","生産","生徒","学生","生活"]]
    
    
    //                    ["脱出","出身","出陣","出席","出家"],
    //                    ["商業","減少","招待","少数","食卓"],
    //                    ["心配","親友","信用","信頼","新聞"],
    //                    ["水道","水滴","水田","水平","水泡"],
    //                    ["制限","限界","紹介","拳銃","電車"]]
    var katakana = [["チュウシャをする","友達にチュウイする","反対イケンを言う","オンドが高い","センモン店"],
                    ["シュッセキする","シュッパツする","シュッパンする","シュッシン","テイシュツする"],
                    ["ジョウキュウの教科書","ジョウゲ","ジョウジュン","山のチョウジョウ","イジョウです"],
                    ["ツウコウする","ツウシンする","ツウチする","ツウヤクする","ツウカする"],
                    ["セイゾン","セイサン","セイト","ガクセイ","セイカツ"]]
    //                    ["ダッシュツ","シュッシン","シュツジン","シュッセキ","シュッケ"],
    //                    ["ショウギョウ","ゲンショウ","ショウタイ","ショウスウ","ショクタク"],
    //                    ["シンパイ","シンユウ","シンヨウ","シンライ","シンブン"],
    //                    ["スイドウ","スイテキ","スイデン","スイヘイ","スイホウ"],
    //                    ["セイゲン","ゲンカイ","ショウカイ","ケンジュウ","デンシャ"]]
    var vietnamese = [["chú xạ","chú ý","ý kiến","ôn độ","chuyên môn"],
                      ["xuất tịch","xuất phát","xuất bản","xuất thân","đề xuất"],
                      ["thượng cấp","thượng hạ","thượng tuần","đỉnh thượng","dĩ thượng"],
                      ["thông hành","thông tín","thông tri","thông dịch","thông quá"],
                      ["sinh tồn","sinh sản","sinh đồ","học sinh","sinh hoạt"]]
    //                      ["thoát xuất","xuất thân","xuất trận","xuất tịch","xuất gia"],
    //                      ["thương nghiệp","giảm thiểu","chiêu đãi","thiếu, số","thực trác"],
    //                      ["tâm phối","thân hữu","tín dụng","tín lại","tân văn"],
    //                      ["thủy đạo","thủy đích","thủy điền","thủy bình","thủy bào"],
    //                      ["hạn chế","hạn chế","giới thiệu","súng lục","xe điện"]]
    
    var pronunciationJ = [["Chuusha","Chuui","Iken","Ondo","Senmon"],
                          ["Shusseki","Shuppatsu","Shuppan","Shusshin","Teishutsu"],
                          ["Joukyuu","Jouge","Joujun","Choujou","Ijou"],
                          ["Tsuukou","Tsuushin","Tsuuchi","Tsuuyaku","Tsuuka"],
                          ["Seizon","Seisan","Seito","Gakusei","Seikatsu"]]
    //                         ["Dasshutsu","Shusshin","shutsujin","Shusseki","Shukke"]]
    //                          ["Shougyou","Genshou","Shoutai","Shousuu","Shokutaku"],
    //                          ["Shinpai","Shinyuu","Shinyou","Shinrai","Shinbun"],
    //                          ["Suidou","Suiteki","Suiden","Suihei","Suihou"],
    //                          ["Seigen","Genkai","Shoukai","Kenjuu","Densha"]]
    
    
    var reibunJ =
        [[
          ["毎年予防注射をする。\n\n Tiêm phòng hàng năm. \n\n子供は注射が嫌いだ。\n\n Trẻ em không thích chích ngừa."],
          ["先生が学生に注意する。\n\n Giáo viên chú ý đến sinh viên. \n\n親の注意に耳をかさない。\n\nKhông lắng nghe lời của cha mẹ."],
          ["皆が彼の意見に同意した。 \n\nMọi người đồng ý với ý kiến của anh ấy.\n\n皆の同意がなければやめます。\n\n Tôi sẽ từ bỏ nếu không có sự đồng ý của mọi người."],
          ["北と南の温度の差が激しい。\n\n Sự chênh lệch về nhiệt độ giữa miền Bắc và miền Nam rất dữ dội. \n\n部屋の温度を測ると30度もあった。\n\n Nhiệt độ của phòng được đo và nó là 30 độ."],
          ["私の専門は日本語だ。\n\n Chuyên môn của tôi là tiếng Nhật.\n\n専門的な話はわからない。\n\n Tôi không hiểu những câu chuyện mang tính chuyên môn."]],
         
         [["あの先生は必ず出席をとる。\n\n Giáo sư đó chắc chắn sẽ điểm danh. \n\n昨日のパーティーに出席しましたか。\n\n Bạn đã tham dự bữa tiệc hôm qua?"],
          ["列車の出発の時間が来た。\n\n Thời gian khởi hành của đoàn tàu đã đến. \n\nバスが出発する。\n\n Xe buýt khởi hành."],
          ["初めて本を出版する。\n\n Lần đầu tiên xuất bản một cuốn sách. \n\n東京には出版社が多い。\n\n Có rất nhiều công ty xuất bản ở Tokyo."],
          ["出身はどちらですか。\n\n Bạn đến từ đâu？\n\n関西出身です。\n\n Tôi đến từ Kansai."],
          ["レポートを提出する。\n\n Nộp báo cáo. \n\n提出期限を守る。\n\n Tuân thủ thời hạn."]],
         
         [["レベルは初級、中級、上級に分かれている。\n\n Các mức được chia thành tiểu học, trung cấp, cao cấp. \n\n上級レベルを担当する。\n\n Tôi phụ trách cấp độ cao cấp."],
          ["腕を上下に動かす。\n\n Di chuyển cánh tay của bạn lên xuống. \n\n成績が上下する。\n\n Thành tích tăng và giảm."],
          ["8月上旬に試験がある。\n\n Có một cuộc kiểm tra vào đầu tháng Tám. \n\n月初めから10日間を上旬という。\n\n Người ta nói rằng từ đầu tháng đến khoảng 10 ngày là thượng tuần."],
          ["富士山の頂上に立つ。\n\n Đứng ở đỉnh núi Phú Sĩ. \n\n景気が頂上に達する。\n\n Nền kinh tế đạt đến đỉnh điểm."],
          ["日本は18歳以上の人に選挙権がある。\n\n Tại Nhật, người trên 18 tuổi có quyền biểu quyết. \n\n期待以上の大活躍だ。\n\n Đó là một thành công lớn hơn mong đợi."]],
         
         [["ここはたくさんのトラックが通行する。\n\n Nhiều xe tải đi qua đây. \n\nこの道は一方通行だ。\n\n Con đường này là đường một chiều."],
          ["通信販売を利用する。\n\n Sử dụng đơn đặt hàng qua mạng thông tín. \n\n海外の友達と通信する。\n\n Giao tiếp với bạn bè nước ngoài."],
          ["学校からの成績通知を受け取る。\n\n Nhận thông báo về kết quả từ trường. \n\n通知表を親に見せる。\n\n Cho cha mẹ xem bảng thông báo từ trường."],
          ["会議で通訳する。\n\n Thông dịch tại cuộc họp. \n\n通訳の仕事は疲れる。\n\n Mệt mỏi với công việc thông dịch."],
          ["台風が九州を通過した。\n\n Một cơn bão đi qua Kyushu. \n\n特急はこの駅を通過する。\n\n Tàu (tokkyu) đi qua ga này."]],
         
         [["子供の生存を確認する。\n\n Xác nhận sự sống còn của đứa trẻ. \n\n宇宙には生命体が生存している可能性がある。\n\n Có khả năng các dạng sống tồn tại trong vũ trụ."],
          ["この国は石油を生産する。\n\n Nước này sản xuất dầu. \n\nここは米の生産が有名だ。\n\n Sản xuất lúa gạo nổi tiếng ở đây."],
          ["彼はまじめな生徒だ。\n\n Anh ấy là một học sinh chăm chỉ. \n\n中学校の生徒に英語を教える。\n\n Dạy tiếng Anh cho học sinh trung học cơ sở."],
          ["外国語学部は男子学生より女子学生の方が多い。\n\n Khoa ngoại ngữ có nhiều inh viên nữ hơn sinh viên nam. \n\n学生時代にはいろいろなスポーツをした。\n\n Tôi đã chơi các môn thể thao khác nhau trong thời học sinh."],
          ["留学生として日本で4年間生活した。\n\n Tôi đã sống ở Nhật Bản trong 4 năm với tư cách là du học sinh. \n\n海外でぜいたくな生活を送りたい。\n\n Tôi muốn sống một cuộc sống xa hoa ở nước ngoài."]]]
    
   

//ローカライズ
    @IBOutlet weak var toInstruction: UILabel!
    @IBOutlet weak var QSelect: UILabel!
    
    @IBOutlet weak var questionLevel: UITableView!
    
    
    override func viewDidLoad() {
       
        super.viewDidLoad()
        if UserDefaults.standard.object(forKey: "hajimeteFlag") == nil {
            DispatchQueue.main.async {
                let pageViewController = self.storyboard?.instantiateViewController(withIdentifier: "pageView")
                self.present(pageViewController!, animated: true, completion: nil)
            }
        }
        //ローカライズ
        toInstruction.text = "\(NSLocalizedString("toInstruction", comment: ""))"
        QSelect.text = "\(NSLocalizedString("QSelect", comment: ""))"
        
        questionLevel.dataSource = self
        questionLevel.delegate = self
        // Do any additional setup after loading the view.
        UserDefaults.standard.set(1, forKey: "hajimeteFlag")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questions.count // N個のデータがあるという意味 変数questionsの中の値（カンマ区切り）を数える
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 再利用可能な cell を得る
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath as IndexPath)
        // 文字色変更
        cell.textLabel?.textColor = UIColor.init(red: 64/255, green: 131/255, blue: 174/255, alpha: 1)
        //文字の大きさを変える
        cell.textLabel!.font = UIFont.boldSystemFont(ofSize: 20)
        
        // 値を設定する.
        switch indexPath.row {
        case 0:
            cell.textLabel!.text = "Group \(indexPath.row + 1)  音が似ている漢語"
        case 1:
            cell.textLabel!.text = "Group \(indexPath.row + 1)  出   を含む漢語"
        case 2:
            cell.textLabel!.text = "Group \(indexPath.row + 1)  上   を含む漢語"
        case 3:
            cell.textLabel!.text = "Group \(indexPath.row + 1)  通   を含む漢語"
        case 4:
            cell.textLabel!.text = "Group \(indexPath.row + 1)  生   を含む漢語"
            
            
        default:
            break // do nothing
        }
        
        return cell
        
    }
    
    
    @IBAction func reEntryInstruction(_ sender: Any) {
        DispatchQueue.main.async {
            let pageViewController = self.storyboard?.instantiateViewController(withIdentifier: "pageView")
            self.present(pageViewController!, animated: true, completion: nil)
        }
    }
   
    // 各セルを選択した時に実行されるメソッド
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "cellSegue",sender: indexPath.row)
        
    }
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "cellSegue"){
          
            let ViewController:ViewController = (segue.destination as! ViewController)
            ViewController.questions = questions[sender as!Int]
            ViewController.katakana = katakana[sender as!Int]
            ViewController.vietnamese = vietnamese[sender as!Int]
            ViewController.pronunciationJ = pronunciationJ[sender as!Int]
            ViewController.reibunJ = reibunJ[sender as!Int]

        }
        
    }
    
}

