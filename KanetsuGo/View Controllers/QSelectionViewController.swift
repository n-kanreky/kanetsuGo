//
//  QSelectionViewController.swift
//  KanetsuGo
//
//  Created by n.kanreky on 2017/10/22.
//  Copyright © 2017年 NC. All rights reserved.
//

import UIKit

class QSelectionViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var questions = [["注射","注意","意見","温度","専門"], //Group 1
                     ["今週","先週","来週","週末","毎週","一週間"], //Group 2
                     ["今日","毎日","日時","日常","日用品","日付"], //Group 3
                     ["今月","毎月","月日","月額","来月","先月"], //Group 4
                     ["通行","通信","通知","通訳","通過"], //Group 5
                     ["生存","生産","生徒","学生","生活"], //Group 6
                     
                     ["文学","哲学","医学","数学","薬学","化学"]] //Group 7 学がつく漢語
//                     ["国立","国家","国籍","国際","隣国","国連"],//Group8 国を含む
//                     ["反応","反映","反射","反対","反撃","違反","反省"],//Group9 反を含む
//                     ["文化","法律","印象","報告","科学"]]
    
    
    var katakana = [["チュウシャをする","友達にチュウイする","反対イケンを言う","オンドが高い","センモン店"], // Group 1
                    ["コンシュウ","センシュウ","ライシュウ","シュウマツ","マイシュウ","イッシュウカン"], //Group 2
                    ["キョウ","マイニチ","ニチジ","ニチジョウ","ニチヨウヒン","ヒヅケ"], //Group 3
                    ["コンゲツ","マイツキ","ゲッキュウ","ゲツガク","ライゲツ","センゲツ"], //Group 4
                    ["ツウコウする","ツウシンする","ツウチする","ツウヤクする","ツウカする"], //Group 5
                    ["セイゾン","セイサン","セイト","ガクセイ","セイカツ"], //Group 6
                    
                    ["ブンガクを勉強する","テツガクはむずかしい","イガクが進歩する","スウガクが得意（とくい）だ","ヤクガクを学ぶ","カガクの実験（じっけん）"], //Group7
                    ["コクリツ大学","民主主義（みんしゅしゅぎ）コッカ","コクセキはベトナムだ","コクサイ的に有名","リンコクの人","コクレン"], //Group8
                    ["ハンノウする","ハンエイする","ハンシャする","ハンタイする","ハンゲキする","イハンする","ハンセイする"], //Group9
                    ["日本ブンカ","ホウリツを守る（まもる）","インショウを聞く","ホウコクする","カガクが発達（ハッタツ）する"]]

    var vietnamese = [["chú xạ","chú ý","ý kiến","ôn độ","chuyên môn"], //Group 1
                      ["tuần này","tuần trước","tuần sau","cuối tuần","hàng tuần","Một tuần"], //Group 2
                      ["Ngày này (Hôm nay)","Mỗi ngày","Ngày giờ","Hàng ngày","Nhu yếu phẩm hàng ngày","Ngày tháng"], //Group 3
                      ["Tháng này","Hàng tháng","Tiền lương hàng tháng","Số tiền hàng tháng","Tháng tiếp theo","Tháng trước"], //Group 4
                      ["thông hành","thông tín","thông tri","thông dịch","thông quá"],// Group 5
                      ["sinh tồn","sinh sản","sinh đồ","học sinh","sinh hoạt"], //Group 6
                      
                      ["Văn học","triết học","y học","toán học","dược học","hóa học"]] //Group7
//                      ["Quốc gia","Một quốc gia","Quốc tịch","Quốc tế","Quốc gia láng giềng","Liên Hợp Quốc"],//Group8
//                      ["xa điện","hạn chế","giới hạn","giới thiệu","Đoạn giai"],//Group9
//                      ["Văn hóa","Pháp luật","ấn tượng","báo cáo","báo cáo"]]

    
    var pronunciationJ = [["Chuusha","Chuui","Iken","Ondo","Senmon"], //Groupo 1
                          ["Konshuu","Senshuu","Raishuu","Shuumatsu","Maishuu","Isshuukan"], //Group 2
                          ["Kyou","Mainichi","Nichiji","Nichijou","Nichiyouhin","Hiduke"], //Group 3
                          ["Kongetsu","maitsuki","Gekkyuu","Getsugaku","Raigetsu","Sengetsu"], //Group 4
                          ["Tsuukou","Tsuushin","Tsuuchi","Tsuuyaku","Tsuuka"],  //Group 5
                          ["Seizon","Seisan","Seito","Gakusei","Seikatsu"], //Group 6
                          
                          ["Bungaku","Tetsugaku","Igaku","Suugaku","Yakugaku","Kagaku"]] //Group7
//                          ["Kokuritsu","Kokka","Kokuseki","Kokusai","Rinkoku"], //Group 8
//                          ["Hannou","Hanei","Hansha","Hantai","Hangeki","Ihan","Hansei"], //Group 9
//                          ["Bunka","Houritsu","Inshou","Houkoku","Kagaku"]]
    

    
    var reibunJ =
        [[
            ["毎年予防注射をする。\n\n Tiêm phòng hàng năm. \n\n子供は注射が嫌いだ。\n\n Trẻ em không thích chích ngừa."],
            ["先生が学生に注意する。\n\n Giáo viên chú ý đến sinh viên. \n\n親の注意に耳をかさない。\n\nKhông lắng nghe lời của cha mẹ."],
            ["皆が彼の意見に同意した。 \n\nMọi người đồng ý với ý kiến của anh ấy.\n\n皆の同意がなければやめます。\n\n Tôi sẽ từ bỏ nếu không có sự đồng ý của mọi người."],
            ["北と南の温度の差が激しい。\n\n Sự chênh lệch về nhiệt độ giữa miền Bắc và miền Nam rất dữ dội. \n\n部屋の温度を測ると30度もあった。\n\n Nhiệt độ của phòng được đo và nó là 30 độ."],
            ["私の専門は日本語だ。\n\n Chuyên môn của tôi là tiếng Nhật.\n\n専門的な話はわからない。\n\n Tôi không hiểu những câu chuyện mang tính chuyên môn."]],
         
         [["毎年予防注射をする。\n\n Tiêm phòng hàng năm. \n\n子供は注射が嫌いだ。\n\n Trẻ em không thích chích ngừa."],
          ["先生が学生に注意する。\n\n Giáo viên chú ý đến sinh viên. \n\n親の注意に耳をかさない。\n\nKhông lắng nghe lời của cha mẹ."],
          ["皆が彼の意見に同意した。 \n\nMọi người đồng ý với ý kiến của anh ấy.\n\n皆の同意がなければやめます。\n\n Tôi sẽ từ bỏ nếu không có sự đồng ý của mọi người."],
          ["北と南の温度の差が激しい。\n\n Sự chênh lệch về nhiệt độ giữa miền Bắc và miền Nam rất dữ dội. \n\n部屋の温度を測ると30度もあった。\n\n Nhiệt độ của phòng được đo và nó là 30 độ."],
          ["私の専門は日本語だ。\n\n Chuyên môn của tôi là tiếng Nhật.\n\n専門的な話はわからない。\n\n Tôi không hiểu những câu chuyện mang tính chuyên môn."],
          ["毎年予防注射をする。\n\n Tiêm phòng hàng năm. \n\n子供は注射が嫌いだ。\n\n Trẻ em không thích chích ngừa."]],
         
         [["今日は8時までに帰ります。\n\n Hôm nay tôi sẽ trở lại lúc 8 giờ. \n\n私は今日から大学生だ。\n\n Tôi là sinh viên đại học từ hôm nay."],
          ["私は毎日日本語を勉強します。\n\n Tôi học tiếng Nhật mỗi ngày. \n\n昨日のパーティーに出席しましたか。\n\n Trời mưa hàng ngày."],
          ["パーティの日時を決定する。\n\n Xác định ngày và giờ của bên. \n\n次の会議の日時を教えてください。\n\n Vui lòng cho tôi biết ngày và giờ của cuộc họp tiếp theo."],
          ["私たちは日常生活を大切にしています。\n\n Chúng tôi coi trọng cuộc sống hàng ngày của mình. \n\n散歩は日常的に行っている。\n\n Tôi đi bộ hàng ngày."],
          ["近くのスーパーで日用品を買います。\n\n Mua nhu yếu phẩm hàng ngày tại siêu thị gần đó.デパートでも日用品を買うことができます。\n\n Ngay cả ở các cửa hàng bách hóa, bạn có thể mua các vật dụng hàng ngày."],
          ["書類には必ず日付を入れてください。\n\n Hãy chắc chắn bao gồm ngày trong tài liệu. \n\nExcelで日付から自動的に曜日を入力できる。\n\n Bạn có thể nhập ngày trong tuần tự động từ ngày Excel."]],
         
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
          ["留学生として日本で4年間生活した。\n\n Tôi đã sống ở Nhật Bản trong 4 năm với tư cách là du học sinh. \n\n海外でぜいたくな生活を送りたい。\n\n Tôi muốn sống một cuộc sống xa hoa ở nước ngoài."]],
         
         //ここから第二弾、Group7-9\n\n
            //7
            [["私の専攻は日本文学だ。\n\nChuyên ngành của tôi là văn học Nhật Bản. \n\n『源氏物語』は日本の古典文学の最高傑作だ。\n\nTruyện Genji là 1 kiệt tác văn học cổ điển của Nhật Bản."],
             ["彼はギリシャ哲学の研究者だ。\n\nÔng ấy là nhà nghiên cứu triết học Hi Lạp. \n\nこれは哲学と宗教学の境界を超えた研究だ。\n\nNghiên cứu này vượt qua ranh giới của triết học và tôn giáo học."],
             ["医学が進み、人間が長生きできるようになった。\n\nCùng vơi sự tiến bộ của y học, con người cũng có thể sống lâu hơn. \n\nこれは哲学と宗教学の境界を超えた研究だ。\n\nNgười ta cho rằng Y học cùng với Triết học là ngành học có từ xa xưa nhất."],
             ["彼は有名な数学者だ。\n\n Ông là một nhà toán học nổi tiếng. \n\n高校の時から数学が得意だった。\n\n Toán học tốt ở trường trung học."],
             ["大学では薬学を学んでいる。\n\nTôi đang học dược tại trường đại học. \n\n薬学部を卒業して、薬剤師になった。\n\nTôi tốt nghiệp Khoa Khoa học Dược phẩm và trở thành dược sĩ。"],
             ["化学と科学は日本語で発音が同じだ。\n\n Hóa học và khoa học có cùng cách phát âm bằng tiếng Nhật. \n\n彼はノーベル化学賞を受賞した。\n\nÔng được trao giải Nobel Hóa học."]]]
            //8
//            [["私は料理するのが得意だ。\n\n Tôi giỏi nấu ăn.\n\n日本料理の中で何が一番好きですか。\n\n Trong các mốn ăn Nhật Bản bạn thích món nào nhất."],
//             ["毎日、5時間日本語を勉強する。\n\n Học tiếng Nhật 5 tiếng mỗi ngày.\n\n日本語の勉強の中で何が一番難しいですか。 \n\n Môn nào khó nhất trong các môn học tiếng Nhật."],
//             ["サッカー部は結束が堅い。\n\n Câu lạc bộ bóng đá bị ràng buộc chặt chẽ.\n\nみんなで結束して、課題を解決した。 \n\n Chúng tôi đoàn kết với nhau và giải quyết vấn đề."],
//             ["人に迷惑をかけるのはやめましょう。\n\n Hãy thôi làm phiền mọi người.\n\n図書館で大声で話をすると迷惑だ。 \n\n Nói chuyện lớn tiếng trong thư viện sẽ làm phiền mọi người xung quanh."],
//             ["この辺りは工場が多い。\n\n Vùng này có nhiều công trường.\n\n私の父は工場で働いている。 \n\n Bố tôi làm việc trong công trường."]],
//            //9
//            [["踏切事故のため電車が遅れた。\n\n Xe điện bị trễ do tai nạn đường sắt.\n\n神戸駅で電車に乗って、大阪駅で降りる。 \n\n Tôi lên xe điện ở ga kobe và xuống ở ga Osaka."],
//             ["高速道路の制限速度を守る。\n\n Tuân thủ tốc độ qui định ở đường cao tốc.\n\n会場の入場者を制限する。 \n\n Hạn chế người vào hội trường."],
//             ["我慢の限界を超える。\n\n Vượt quá giới hạn chịu đựng.\n\nこの暑さは体力の限界だ。 \n\n Nhiệt này là giới hạn của sức mạnh."],
//             ["彼女を両親に紹介する。\n\n Giới thiệu cô ấy với cha mẹ.\n\nパーティーの初めに自己紹介をする。 \n\n Giới thiệu bản thân lúc bắt đầu bữa tiệc."],
//             ["エレベーターではなく階段を使う。\n\n Sử dụng cầu thang chứ không phải thang máy.\n\n階段から転がり落ちた。\n\n Té lăn xuống từ cầu thang."]],
//            //10
//            [["日本文化を学ぶ。\n\n Học văn hoá Nhật Bản.\n\n11月3日は「文化の日」で祝日だ。 \n\n Ngày 3 tháng 11 là ＊ngày văn hóa＊ và đó là một ngày lễ."],
//             ["私は日本の法律を勉強している。\n\n Tôi học luật Nhật Bản.\n\n彼は有名な法律学者だ。 \n\n Ông là một học giả luật nổi tiếng."],
//             ["彼の第一印象はどうでしたか。\n\n Ấn tượng đầu tiên của anh ấy như thế nào?\n\n印象的な芸術作品だ。 \n\n Đây là một tác phẩm nghệ thuật ấn tượng."],
//             ["会議で決まったことを報告する。\n\n Báo cáo việc đã quyết định trong hội nghị.\n\n両親に旅行の報告がたくさんある。 \n\n Có nhiều điều cần báo cáo cho bố mẹ về việc du lịch."],
//             ["私は自然科学を専攻している。\n\n Tôi chuyên ngành khoa học tự nhiên.\n\n将来私は科学者になりたい。 \n\n Tương lai, tôi muốn trở thành nhà khoa học."]]] //Group 10

//ローカライズ
    @IBOutlet weak var toInstruction: UILabel!
    @IBOutlet weak var QSelect: UILabel!
    
    @IBOutlet weak var ToRevisionList: UIButton!
    @IBOutlet weak var questionLevel: UITableView!
    
    
    override func viewDidLoad() {
       
        super.viewDidLoad()
        
        if UserDefaults.standard.object(forKey: "hajimeteFlag") == nil {
            //以下で非同期処理をする
            DispatchQueue.main.async {
                let pageViewController = self.storyboard?.instantiateViewController(withIdentifier: "pageView")
                self.present(pageViewController!, animated: true, completion: nil)
            }
        }
        //ローカライズ
        toInstruction.text = "\(NSLocalizedString("toInstruction", comment: ""))"
        QSelect.text = "\(NSLocalizedString("QSelect", comment: ""))"
        //復習リストのボタンを以下に置き換えて、ローカライズ
        ToRevisionList.setTitle("\(NSLocalizedString("ToRevisionList", comment: ""))", for:UIControlState.normal)
        
        
        
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
        cell.textLabel!.font = UIFont.boldSystemFont(ofSize: 18)
        
        // 値を設定する.
        switch indexPath.row {
        case 0:
            cell.textLabel!.text = "Group \(indexPath.row + 1)   音が似ている漢語"
        case 1:
            cell.textLabel!.text = "Group \(indexPath.row + 1)   週 tuần を含む漢語"
        case 2:
            cell.textLabel!.text = "Group \(indexPath.row + 1)   日 Ngày を含む漢語"
        case 3:
            cell.textLabel!.text = "Group \(indexPath.row + 1)   上 trên を含む漢語"
        case 4:
            cell.textLabel!.text = "Group \(indexPath.row + 1)   通 thông を含む漢語"
        case 5:
            cell.textLabel!.text = "Group \(indexPath.row + 1)   生 sinh を含む漢語"
        case 6:
            cell.textLabel!.text = "Group \(indexPath.row + 1)   学 học を含む漢語"
//        case 7:
//            cell.textLabel!.text = "Group \(indexPath.row + 1)   国　　を含む漢語"
//        case 8:
//            cell.textLabel!.text = "Group \(indexPath.row + 1)   反　　を含む漢語"
//        case 9:
//            cell.textLabel!.text = "Group \(indexPath.row + 1)   日本で作られた漢語"
            
            
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
            ViewController.cellNumber = sender as!Int
            ViewController.hiddenFlag = true
           
            //以下を利用してIntroGroupViewControllerに各グループの漢越語を表示できるか？
            print(sender as!Int)
            print(questions[sender as!Int])
        }
        
    }
    
}

