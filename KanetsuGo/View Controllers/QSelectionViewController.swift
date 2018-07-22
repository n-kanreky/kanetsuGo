//
//  QSelectionViewController.swift
//  KanetsuGo
//
//  Created by n.kanreky on 2017/10/22.
//  Copyright © 2017年 NC. All rights reserved.
//

import UIKit

class QSelectionViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var questions = [["注意","意見","準備"], //Group 1
                     ["今週","先週","来週","毎週","週末","一週間","隔週"], //Group 2
                     ["今日","毎日","日時","日常","日用品"], //Group 3
                     ["今月","月給","月額","来月","先月"], //Group 4
                     ["通行","通信","通知","通訳","通過"], //Group 5
                     ["生存","生産","生徒","学生","生活"], //Group 6
                     
                     ["文学","哲学","医学","数学","薬学","化学"], //Group 7 学がつく漢語
                     ["国立","国家","国籍","国際","国連"], //Group 8 国を含む
                     ["反応","反映","反射","反対","反撃","反省"], //Group 9 反を含む
                     ["地面","地球","地上","地下鉄","土地"]] //Group 10 地を含む
//                     ["文化","法律","印象","報告","科学"]]
    
    
    var katakana = [["友達にチュウイする","反対イケンを言う","ジュンビする"], // Group 1
                    ["コンシュウの土曜日","センシュウの月曜日","ライシュウの火曜日","マイシュウ水曜日","シュウマツに出かける","イッシュウカンの休みが取れた","カクシュウで試合がある"], //Group 2
                    ["キョウは晴れだ","マイニチ学校に行く","会議のニチジ","ニチジョウの生活","ニチヨウヒンを買う"], //Group 3
                    ["コンゲツ","ゲッキュウ","ゲツガク","ライゲツ","センゲツ"], //Group 4
                    ["ツウコウする","ツウシンする","ツウチする","ツウヤクする","ツウカする"], //Group 5
                    ["セイゾンしている","セイサンする","学校のセイト","大学のガクセイ","セイカツする"], //Group 6
                    
                    ["ブンガクを勉強する","テツガクはむずかしい","イガクが進歩する","スウガクが得意（とくい）だ","ヤクガクを学ぶ","カガクの実験（じっけん）"], //Group 7
                    ["コクリツ大学","民主主義（みんしゅしゅぎ）コッカ","コクセキはベトナムだ","コクサイ的に有名","コクレン"], //Group 8
                    ["ハンノウする","ハンエイする","ハンシャする","ハンタイする","ハンゲキする","ハンセイする"], //Group 9
                    ["ジメンに落ちた","チキュウを守る","チジョウに出る","チカテツに乗る","広いトチ"]] //Group 10
//                    ["日本ブンカ","ホウリツを守る（まもる）","インショウを聞く","ホウコクする","カガクが発達（ハッタツ）する"]]

    var vietnamese = [["chú ý","ý kiến","Chuẩn bị"],//Group 1
                      ["tuần này","tuần trước","tuần sau","cuối tuần","hàng tuần","Một tuần","2 tuần một lần"], //Group 2
                      ["Ngày này (Hôm nay)","Mỗi ngày","Ngày giờ","Hàng ngày","Nhu yếu phẩm hàng ngày"], //Group 3
                      ["Tháng này","Tiền lương hàng tháng","Số tiền hàng tháng","Tháng tiếp theo","Tháng trước"], //Group 4
                      ["thông hành","thông tín","thông tri","thông dịch","thông quá"],// Group 5
                      ["sinh tồn","sinh sản","sinh đồ","học sinh","sinh hoạt"], //Group 6
                      
                      ["Văn học","triết học","y học","toán học","dược học","hóa học"], //Group7
                      ["Quốc gia","Một quốc gia","Quốc tịch","Quốc tế","Liên Hợp Quốc"],//Group8
                      ["Phản ứng","Phản ánh","Sự phản chiếu","Phản đối","Phản công","Sự phản chiếu"],//Group9
                      ["Mặt đất","Trái đất","Trên mặt đất","Dưới đất","Đất đai"]]//Group10
//                      ["Văn hóa","Pháp luật","ấn tượng","báo cáo","báo cáo"]]

    
    var pronunciationJ = [["Chuui","Iken","Junbi"], //Groupo 1
                    ["Konshuu","Senshuu","Raishuu","Maishuu","Shuumatsu","Isshuukan","Kakushuu"], //Group 2
                    ["Kyou","Mainichi","Nichiji","Nichijou","Nichiyouhin"], //Group 3
                    ["Kongetsu","Gekkyuu","Getsugaku","Raigetsu","Sengetsu"], //Group 4
                    ["Tsuukou","Tsuushin","Tsuuchi","Tsuuyaku","Tsuuka"],  //Group 5
                    ["Seizon","Seisan","Seito","Gakusei","Seikatsu"], //Group 6
    
                    ["Bungaku","Tetsugaku","Igaku","Suugaku","Yakugaku","Kagaku"], //Group7
                    ["Kokuritsu","Kokka","Kokuseki","Kokusai","Kokuren"], //Group 8
                    ["Hannou","Hanei","Hansha","Hantai","Hangeki","Hansei"], //Group 9
                    ["Jimen","Chikyuu","Chijou","Chikatetsu","Tochi"]] //Group 10
//                          ["Bunka","Houritsu","Inshou","Houkoku","Kagaku"]] 
    

    
    var reibunJ =
        [[
            //["毎年予防注射をする。\n\n Tiêm phòng hàng năm. \n\n子供は注射が嫌いだ。\n\n Trẻ em không thích chích ngừa."],
            ["先生が学生に注意する。\n\n Giáo viên chú ý đến sinh viên. \n\n親の注意に耳をかさない。\n\nKhông lắng nghe lời của cha mẹ."],
            ["皆が彼の意見に同意した。 \n\nMọi người đồng ý với ý kiến của anh ấy.\n\n何か意見はありますか。\n\n Bạn có ý kiến ​​gì không?"],
            //["北と南の温度の差が激しい。\n\n Sự chênh lệch về nhiệt độ giữa miền Bắc và miền Nam rất dữ dội. \n\n部屋の温度を測ると30度もあった。\n\n Nhiệt độ của phòng được đo và nó là 30 độ."],
            //["私の専門は日本語だ。\n\n Chuyên môn của tôi là tiếng Nhật.\n\n専門的な話はわからない。\n\n Tôi không hiểu những câu chuyện mang tính chuyên môn."]], //Group 1
            ["明日のために準備する。\n\n Chuẩn bị cho ngày mai.\n\n準備に時間がかかる。\n\nPhải mất thời gian để chuẩn bị."]],
            
         [["私は今週の火曜日に太郎さんとテニスをします。\n\n Tôi chơi tennis với Taro vào thứ ba tuần này. \n\n天気予報によると、今週は週末にかけて雨が降るようだ。　\n\n Theo dự báo thời tiết, có vẻ như trời sẽ mưa vào cuối tuần này."],
          ["母は、先週国に帰りました。\n\n Mẹ tôi quay trở lại đất nước tuần trước. \n\n先週の金曜日は、大雨のため休校になった。\n\nNgôi trường đã bị đóng cửa do mưa lớn hôm thứ Sáu tuần trước."],
          ["私は来週、東京へ行きます。 \n\nTuần tới, tôi sẽ đi đến Tokyo.\n\n私は来週の月曜日、午前9時に病院へ行きます。\n\n Tôi sẽ đến bệnh viện vào sáng thứ Hai lúc 9 giờ sáng."],
          ["毎週金曜日に花を買います。\n\n Tôi mua hoa vào mỗi thứ Sáu. \n\n私は毎週友達と映画をみます。\n\n Tôi xem phim với bạn bè mỗi tuần."],
          ["あなたは週末、どこかに行きますか。\n\n Bạn sẽ đi đâu đó vào cuối tuần?\n\n私は週末によくサッカーをします。\n\n Tôi thường chơi bóng đá vào cuối tuần."],
          ["この絵を描くのに１週間かかりました。\n\n Tôi mất một tuần để vẽ bức tranh này. \n\n１週間待ってください。\n\n Vui lòng chờ một tuần."],
          ["隔週（２週間おきに）東京に来ます。\n\n Tôi sẽ đến Tokyo hai tuần một lần. \n\n私は隔週（２週間に１度）母に電話をします。\n\n Tôi sẽ gọi cho mẹ tôi hai tuần một lần."]], //Group 2
         
         [["今日は8時までに帰ります。\n\n Hôm nay tôi sẽ trở lại lúc 8 giờ. \n\n私は今日から大学生だ。\n\n Tôi là sinh viên đại học từ hôm nay."],
          ["私は毎日日本語を勉強します。\n\n Tôi học tiếng Nhật mỗi ngày. \n\n昨日のパーティーに出席しましたか。\n\n Trời mưa hàng ngày."],
          ["パーティの日時を決定する。\n\n Xác định ngày và giờ của bên. \n\n次の会議の日時を教えてください。\n\n Vui lòng cho tôi biết ngày và giờ của cuộc họp tiếp theo."],
          ["私たちは日常生活を大切にしています。\n\n Chúng tôi coi trọng cuộc sống hàng ngày của mình. \n\n散歩は日常的に行っている。\n\n Tôi đi bộ hàng ngày."],
          ["近くのスーパーで日用品を買います。\n\n Mua nhu yếu phẩm hàng ngày tại siêu thị gần đó.デパートでも日用品を買うことができます。\n\n Ngay cả ở các cửa hàng bách hóa, bạn có thể mua các vật dụng hàng ngày."]],  //Group 3
         
         [["今月から新しいバイトを始めます。\n\n Bắt đầu một byte mới từ tháng này. \n\n今月中にこの仕事を仕上げなくてはならない。\n\n Tôi phải hoàn thành công việc này trong tháng."],
          ["私の月給は10万円です。\n\n Tiền lương hàng tháng của tôi là 100.000 yên. \n\n月給日は毎月25日です。\n\n Ngày thanh toán hàng tháng là ngày 25 hàng tháng."],
          ["バイト料の月額は5万円くらいです。\n\n Phí hàng tháng cho phí byte là khoảng 50.000 yên. \n\nこのアプリの使用料は、月額300円です。\n\n Lệ phí hàng tháng cho việc sử dụng ứng dụng này là 300 yên."],
          ["母は、来月ハノイに来る予定です。\n\n Mẹ tôi sẽ đến Hà Nội vào tháng tới. \n\n私は来月結婚します。\n\n Tôi sẽ kết hôn vào tháng tới."],
          ["この店は、先月オープンしました。\n\n Cửa hàng này vừa mới mở vào tháng trước. \n\n彼は先月帰国しました。\n\n Anh ấy quay trở lại đất nước hồi tháng trước."]],
          //Group 4
         
         [["ここはたくさんのトラックが通行する。\n\n Nhiều xe tải đi qua đây. \n\nこの道は一方通行だ。\n\n Con đường này là đường một chiều."],
          ["通信販売を利用する。\n\n Sử dụng đơn đặt hàng qua mạng thông tín. \n\n海外の友達と通信する。\n\n Giao tiếp với bạn bè nước ngoài."],
          ["学校からの成績通知を受け取る。\n\n Nhận thông báo về kết quả từ trường. \n\n通知表を親に見せる。\n\n Cho cha mẹ xem bảng thông báo từ trường."],
          ["会議で通訳する。\n\n Thông dịch tại cuộc họp. \n\n通訳の仕事は疲れる。\n\n Mệt mỏi với công việc thông dịch."],
          ["台風が九州を通過した。\n\n Một cơn bão đi qua Kyushu. \n\n特急はこの駅を通過する。\n\n Tàu (tokkyu) đi qua ga này."]],  //Group 5
         
         [["子供の生存を確認する。\n\n Xác nhận sự sống còn của đứa trẻ. \n\n宇宙には生命体が生存している可能性がある。\n\n Có khả năng các dạng sống tồn tại trong vũ trụ."],
          ["この国は石油を生産する。\n\n Nước này sản xuất dầu. \n\nここは米の生産が有名だ。\n\n Sản xuất lúa gạo nổi tiếng ở đây."],
          ["彼はまじめな生徒だ。\n\n Anh ấy là một học sinh chăm chỉ. \n\n中学校の生徒に英語を教える。\n\n Dạy tiếng Anh cho học sinh trung học cơ sở."],
          ["外国語学部は男子学生より女子学生の方が多い。\n\n Khoa ngoại ngữ có nhiều inh viên nữ hơn sinh viên nam. \n\n学生時代にはいろいろなスポーツをした。\n\n Tôi đã chơi các môn thể thao khác nhau trong thời học sinh."],
          ["留学生として日本で4年間生活した。\n\n Tôi đã sống ở Nhật Bản trong 4 năm với tư cách là du học sinh. \n\n海外でぜいたくな生活を送りたい。\n\n Tôi muốn sống một cuộc sống xa hoa ở nước ngoài."]], //Group 6
         
         //ここから第二弾、Group7-9\n\n
            //7
            [["私の専攻は日本文学だ。\n\nChuyên ngành của tôi là văn học Nhật Bản. \n\n『源氏物語』は日本の古典文学の最高傑作だ。\n\nTruyện Genji là 1 kiệt tác văn học cổ điển của Nhật Bản."],
             ["彼はギリシャ哲学の研究者だ。\n\nÔng ấy là nhà nghiên cứu triết học Hi Lạp. \n\nこれは哲学と宗教学の境界を超えた研究だ。\n\nNghiên cứu này vượt qua ranh giới của triết học và tôn giáo học."],
             ["医学が進み、人間が長生きできるようになった。\n\nCùng vơi sự tiến bộ của y học, con người cũng có thể sống lâu hơn. \n\nこれは哲学と宗教学の境界を超えた研究だ。\n\nNgười ta cho rằng Y học cùng với Triết học là ngành học có từ xa xưa nhất."],
             ["彼は有名な数学者だ。\n\n Ông là một nhà toán học nổi tiếng. \n\n高校の時から数学が得意だった。\n\n Toán học tốt ở trường trung học."],
             ["大学では薬学を学んでいる。\n\nTôi đang học dược tại trường đại học. \n\n薬学部を卒業して、薬剤師になった。\n\nTôi tốt nghiệp Khoa Khoa học Dược phẩm và trở thành dược sĩ。"],
             ["化学と科学は日本語で発音が同じだ。\n\n Hóa học và khoa học có cùng cách phát âm bằng tiếng Nhật. \n\n彼はノーベル化学賞を受賞した。\n\nÔng được trao giải Nobel Hóa học."]], //Group 7
            //8
            [["これが新しい国立劇場です。\n\n Đây là Nhà hát Quốc gia mới.\n\n日本に国立大学はいくつありますか。\n\n Có bao nhiêu trường đại học quốc gia ở Nhật Bản?"],
             ["アフリカに新しい国家が生まれた。\n\n Một quốc gia mới được sinh ra ở châu Phi.\n\n試験に合格して、国家公務員になった。 \n\n Sau khi vượt qua kỳ thi, tôi đã trở thành một công chức quốc gia."],
             ["国籍はどこですか。\n\n Quốc tịch của bạn ở đâu?\n\n国籍はベトナムです。 \n\n Quốc tịch là người Việt Nam."],
             ["私の専門は国際関係だ。\n\n Chuyên môn của tôi là quan hệ quốc tế.\n\n新東京国際空港は千葉県にあります。\n\n Sân bay quốc tế Tokyo mới nằm ở quận Chiba."],
             ["国連は国際連合の略だ。\n\n Liên Hợp Quốc là viết tắt của Liên Hiệp Quốc.\n\n国連は1945年に設立された国際機構だ。\n\n Liên Hợp Quốc là một tổ chức quốc tế được thành lập vào năm 1945."]],//Group 8
            //9
           [["呼びかけても何の反応もない。\n\n Gọi nhưng không có phản ứng gì.\n\n薬が合わなかったらしく拒絶反応を起こした。\n\n Hình như là không hợp thuốc nên đã gây ra phản ứng kháng thuốc."],
             ["ファッションは常にその時代を反映していると言える。\n\n Thời trang thường phản ảnh thời đại đó.\n\n消費者の意見を反映した商品を開発する。\n\n Phát triển những sản phẩm phản ánh mong muốn của người tiêu dùng."],
             ["条件反射は学習による生物学的応答である。\n\n Phản xạ có điều kiện là phản ứng sinh học bằng cách học. \n\n このクリスタルは光の反射により七色に輝く。 \n\n Pha lê này phát sáng bảy mầu do phản xạ ánh sáng."],
             ["法案に反対します。\n\n Bỏ phiếu phản đối dự luật.\n\n彼の意見に賛成の人は反対の人より少ない。\n\n Số người tán thành ý kiến của anh ấy ít hơn số người phản đối."],
             ["敵の反撃にあった。\n\n Giám sát vi phạm giao thông.\n\n野党は次の選挙で反撃する機会をうかがっている。 \n\n Đó là một sự vi phạm các quy tắc bóng đá."],
             ["反省点を日記に書く\n\n Viết điểm phản chiếu trong nhật ký.\n\n「反省」とは、自分の言動を振り返ることです。\n\n Phản chiếu là hành vi của riêng bạn."]], //Group 9
    
           [["地面がぬれていて、すべりやすいので気をつけてください。\n\n Mặt đất rất trơn, dễ trượt ngã nên hãy cẩn thận.\n\n地面に落書きをする。\n\nLàm scribbles trên mặt đất。"],
             ["地球の４分の１は陸だ。\n\nMột phần từ trái đất là lục địa.\n\n月は地球のまわりを回っている。\n\nMặt trăng quay quanh trái đất."],
             ["このビルは地下３階、地上１０階建てだ。\n\nTòa nhà này có 3 tầng hầmvà 10 tầng trên mặt đất. \n\n地上から宇宙に向かって信号を送る。\n\nGửi tín hiệu từ mặt đất về phía vũ trụ."],
             ["地下鉄に乗るために、エスカレーターでおりる。\n\n Để đi tàu điện ngầm phải xuống dưới bằng thang cuốn.n\n この道の真下に地下鉄が通っている。n\nNgay bên dưới con đường này có tàu điện ngầm chạy qua."],
             ["家を建てるために土地を買った。\n\n Tôi đã mua đất để xây nhà.n\n 工事の前に、土地の測量をする。n\n Trước khi xây dựng, tiến hành đo đạc đất đai."]]] //Group 10
    
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
            cell.textLabel!.text = "Group \(indexPath.row + 1)    音が似ている漢語"
        case 1:
            cell.textLabel!.text = "Group \(indexPath.row + 1)    週 tuần を含む漢語"
        case 2:
            cell.textLabel!.text = "Group \(indexPath.row + 1)    日 Ngày を含む漢語"
        case 3:
            cell.textLabel!.text = "Group \(indexPath.row + 1)    月 Tháng を含む漢語"
        case 4:
            cell.textLabel!.text = "Group \(indexPath.row + 1)    通 thông を含む漢語"
        case 5:
            cell.textLabel!.text = "Group \(indexPath.row + 1)    生 sinh を含む漢語"
        case 6:
            cell.textLabel!.text = "Group \(indexPath.row + 1)    学 học を含む漢語"
        case 7:
            cell.textLabel!.text = "Group \(indexPath.row + 1)    国 quốc を含む漢語"
        case 8:
            cell.textLabel!.text = "Group \(indexPath.row + 1)    反 phản を含む漢語"
        case 9:
            cell.textLabel!.text = "Group \(indexPath.row + 1)   地 đất を含む漢語"
            
        
            
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

