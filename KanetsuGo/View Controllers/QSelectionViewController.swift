//
//  QSelectionViewController.swift
//  KanetsuGo
//
//  Created by n.kanreky on 2017/10/22.
//  Copyright © 2017年 NC. All rights reserved.
//

import UIKit

class QSelectionViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var questions =
                    [["注意","同意","意見","結果","結論","天然","燃料","記念","過去","孤独","古代","管理","楽観","連絡","準備","首都"], //Group 1
                     ["今週","先週","来週","毎週","週末","週刊誌"], //Group 2
                     ["今日","毎日","日時","日常","日用品"], //Group 3
                     ["今月","来月","先月","月給","月額"], //Group 4
                     ["通行","通信","通知","通訳","通過"], //Group 5
                     ["生存","生産","生徒","学生","生活"], //Group 6
                     ["文学","哲学","医学","数学","薬学","化学"], //Group 7 学がつく漢語
                     ["国立","国家","国籍","国際","国連"], //Group 8 国を含む
                     ["反応","反映","反射","反対","違反","反省"], //Group 9 反を含む　６語
                     ["地面","地球","地上","地震","湿地","宅地"]]//Group 10 地を含む

    

    var katakana = [["友達にチュウイする","意見（いけん）にドウイする","反対イケンを言う","試験のケッカ","ケツロンを先に言う","テンネンの温泉（おんせん）","ネンリョウ費（ひ）","キネン日（び）","カコのデータ","コドクなくらし","コダイの文明（ぶんめい）","カンリする","ラッカン的（てき）","レンラクする","ジュンビする","日本のシュト"], // Group 1
                    ["コンシュウの土曜日","センシュウの月曜日","ライシュウの火曜日","マイシュウ水曜日","シュウマツに出かける","シュウカンシを読む"], //Group 2
                    ["キョウは晴れだ","マイニチ学校に行く","会議のニチジ","ニチジョウの生活","ニチヨウヒンを買う"], //Group 3
                    ["コンゲツ","ライゲツ","センゲツ","ゲッキュウ","ゲツガク"], //Group 4
                    ["ツウコウする","ツウシンする","ツウチする","ツウヤクする","ツウカする"], //Group 5
                    ["セイゾンしている","セイサンする","中学校のセイト","大学のガクセイ","セイカツする"], //Group 6
                    ["ブンガクを勉強する","テツガクはむずかしい","イガクが進歩する","スウガクが得意（とくい）だ","ヤクガクを学ぶ","カガクの実験（じっけん）"], //Group 7
                    ["コクリツ大学","民主主義（みんしゅしゅぎ）コッカ","コクセキはベトナムだ","コクサイ的に有名","コクレン加盟国（かめいこく）"], //Group 8
                    ["体がハンノウする","ハンエイする","光がハンシャする","ハンタイ意見","ルールにイハンする","ハンセイする"], //Group 9
                    ["ジメンに落ちた","チキュウを守る","チジョウに出る","ジシンがおきる","シッチ帯（たい）が広がる","住（ジュウ）タクチ"]] //Group 10


    var vietnamese =
                     [["chú ý","đồng ý","ý kiến","Kết quả","Kết luận","thiên nhiên","Nhiên liệu","kỷ niệm","quá khứ","cô đơn","cổ đại","Quản lý","Lạc quan","liên lạc","Chuẩn bị","thủ đô"], //Group 1
                      ["tuần này","tuần trước","Tuần tới","Hàng tuần","Cuối tuần","Tạp chí hàng tuần"], //Group 2
                      ["Ngày này (Hôm nay)","Mỗi ngày","Ngày giờ","Hàng ngày","Nhu yếu phẩm hàng ngày"], //Group 3
                      ["Tháng này","Tháng tiếp theo","Tháng trước","Tiền lương hàng tháng","Số tiền hàng tháng"], //Group 4
                      ["thông hành","thông tín","thông tri","thông dịch","thông quá"],// Group 5
                      ["sinh tồn","sinh sản","sinh đồ","học sinh","sinh hoạt"], //Group 6
                      ["Văn học","triết học","y học","toán học","dược học","hóa học"], //Group7
                      ["Quốc gia","Một quốc gia","Quốc tịch","Quốc tế","Liên Hợp Quốc"],//Group8
                      ["Phản ứng","Phản ánh","Phản xạ","Phản đối","Vi phạm","Sự phản chiếu"],//Group9
                      ["Mặt đất","Trái đất","Trên mặt đất","Đất đai","Đất ngập nước","Đất ở."]]//Group10


    
    var pronunciationJ =
                [["Chuui","Doui","Iken","Kekka","Ketsuron","Tennen","Nenryou","Kinen","Kako","Kodoku","Kodai","Kanri","Rakkan","Renraku","Junbi","Shuto"], //Groupo 1
                     ["Konshuu","Senshuu","Raishuu","Maishuu","Shuumatsu","Shuukanshi"], //Group 2
                     ["Kyou","Mainichi","Nichiji","Nichijou","Nichiyouhin"], //Group 3
                     ["Kongetsu","Raigetsu","Sengetsu","Gekkyuu","Getsugaku"], //Group 4
                     ["Tsuukou","Tsuushin","Tsuuchi","Tsuuyaku","Tsuuka"],  //Group 5
                     ["Seizon","Seisan","Seito","Gakusei","Seikatsu"], //Group 6
                     ["Bungaku","Tetsugaku","Igaku","Suugaku","Yakugaku","Kagaku"], //Group7
                     ["Kokuritsu","Kokka","Kokuseki","Kokusai","Kokuren"], //Group 8
                     ["Hannou","Hanei","Hansha","Hantai","Ihan","Hansei"], //Group 9
                     ["Jimen","Chikyuu","Chijou","Jishin","Shicchi","Takuchi"]] //Group 10


    var reibunJ1 =
        [[["この道は交通量が多いので、渡るときには注意が必要だ。",  //Group 1
            "私は彼の意見に同意する。",
            "皆が彼の意見に同意した。",
            "試験の結果はどうでしたか？",
            "プレゼンテーションの結論は何ですか。",
            "この国は天然資源に恵まれている。",
            "石油とガスは燃料になる。",
            "記念に写真を撮る。",
            "私は動詞の過去形を学んだ。",
            "彼は孤独を好む。",
            "古代文明はここで繁栄した。",
            "彼はこのアパートを管理している。",
            "彼は楽観的な人だ。",
            "財布を落としたので、警察に連絡した。",
            "明日のために準備する。",
            "日本の首都は東京だ。" ],
         
         ["私は今週の火曜日に太郎さんとテニスをします。",  //Group 2
            "母は、先週国に帰りました。",
            "私は来週、東京へ行きます。",
            "毎週妻に花を買います。",
            "あなたは週末、どこかに行きますか。"],
         
         ["今日は8時までに帰ります。",            //Group 3
            "私は毎日日本語を勉強します。",
            "パーティの日時を決定する。",
            "私たちは日常生活を大切にしています。",
            "近くのスーパーで日用品を買います。"],
         
         ["今月から新しいバイトを始めます。",         //Group 4
            "母は、来月ハノイに来る予定です。",
            "この店は、先月オープンしました。",
            "私の月給は10万円です。",
            "バイト料の月額は5万円くらいです。"],
         
         ["ここはたくさんのトラックが通行する。",       //Group 5
            "通信販売を利用する。",
            "学校からの成績通知を受け取る。",
            "会議で通訳する。",
            "台風（たいふう）が九州を通過した。"],
         
         ["子供の生存を確認する。",              //Group 6
            "この国は石油を生産する。",
            "彼はまじめな生徒だ。",
            "外国語学部は男子学生より女子学生の方が多い。",
            "留学生として日本で4年間生活した。"],
         
         ["私の専攻は日本文学だ。",              //Group 7
            "彼はギリシャ哲学の研究者だ。",
            "医学が進み、人間が長生きできるようになった。",
            "彼は有名な数学者だ。",
            "大学では薬学を学んでいる。",
            "化学と科学は日本語で発音が同じだ。"],
         
         ["これが新しい国立劇場（げきじょう）です。",     //Group 8
            "アフリカに新しい国家が生まれた。",
            "国籍はどこですか。",
            "私の専門は国際関係だ。",
            "国連は国際連合（こくさいれんごう）の略（りゃく）だ。"],
         
         ["呼びかけても何の反応もない。",            //Group 9
            "ファッションは常にその時代を反映していると言える。",
            "条件反射（じょうけんはんしゃ）は、学習による生物学的（せいぶつがくてき）応答（おうとう）である。",
            "私はその対策（たいさく）に反対します。",
            "彼は交通違反で警察に逮捕された。",
            "反省点を日記に書く。"],
         
         ["地面がぬれていて、すべりやすいので気をつけてください。", //Group 10
            "地球の４分の１は陸だ。",
            "このビルは地下３階、地上１０階建てだ。",
            "日本は地震が多い。",
            "この国には多くの湿地がある。",
            "宅地を造成(ぞうせい）する。"]]]
    
    var reibunJ2 =
        [[["熱中症に注意してください。",                  //Group 1
            "多くの同意が得られた。",
            "何か意見はありますか。",
            "結果的に成功だった。",
            "私はこの結論に満足していない。",
            "このバスの燃料は天然ガスだ。",
            "日本は燃料を輸入している。",
            "結婚25年を記念する。",
            "このテストの問題は過去にも出た。",
            "私の母は孤独な人生を送った。",
            "私は古代の歴史を研究している。",
            "彼は自己管理が必要だ。",
            "彼は将来を楽観している。",
            "災害の場合、人々は連絡を取り合う。",
            "準備に時間がかかる。",
            "ベトナムの首都はハノイだ。"],
         
         ["天気予報によると、今週は週末にかけて雨が降るようだ。",     //Group 2
            "先週の金曜日は、大雨のため休校になった。",
            "来週から夏休みが始まります。",
            "私は毎週友達と映画をみます。",
            "私は週末によくサッカーをします。"],
        
         ["私は今日から大学生だ。",                    //Group 3
            "私は毎日バスで駅に行く。",
            "次の会議の日時を教えてください。",
            "散歩は日常的に行っている。",
            "デパートでも日用品を買うことができます。"],
         
         ["今月中にこの仕事を仕上げなくてはならない。",          //Group 4
            "私は来月結婚します。",
            "彼は先月帰国しました。",
            "月給日は毎月25日です。",
            "このアプリの使用料は、月額300円です。"],
         
         ["この道は一方通行だ。",                     //Group 5
            "海外の友達と通信する。",
            "通知表を親に見せる。",
            "通訳の仕事は疲れる。",
            "特急はこの駅を通過する。"],
         
         ["宇宙には生命体が生存している可能性がある。",          //Group 6
            "ここは米の生産が有名だ。",
            "中学校の生徒に英語を教える。",
            "学生時代にはいろいろなスポーツをした。",
            "海外でぜいたくな生活を送りたい。"],
    
         ["『源氏物語』は日本の古典文学の最高傑作だ。",          //Group 7
            "この研究は哲学と宗教学の境界を超えている。",
            "医学は哲学とともに最も古い学問分野だと言われている。",
            "高校の時から数学が得意だった。",
            "薬学部を卒業して、薬剤師（やくざいし）になった。",
            "彼はノーベル化学賞を受賞した。"],
         
         ["日本に国立大学はいくつありますか。",              //Group 8
            "試験に合格して、国家公務員（こっかこうむいん）になった。",
            "国籍はベトナムです。",
            "新東京国際空港は千葉県にあります。",
            "国連は1945年に設立された国際機構（こくさいきこう）だ。"],
         
         ["薬が合わなかったらしく拒絶反応を起こした。",
            "消費者の意見を反映した商品を開発する。",
            "このクリスタルは光の反射により七色に輝く（かがやく）。",
            "彼の意見に賛成の人は反対の人より少ない。",
            "それはサッカーのルール違反だ。",
            "「反省」とは、自分の言動（げんどう）を振り返ることです。"],
    
         ["地面に落書き(らくがき）をする。",                //Group 10
            "月は地球のまわりを回っている。",
            "地上から宇宙（うちゅう）に向かって信号（しんごう）を送る。",
            "これは地震の被害（ひがい）を防ぐための訓練（くんれん）だ。",
            "湿地は野菜栽培には適していない。",
            "宅地の価格（かかく）が上がっている。"]]]
    
    var reibunV1 =
        [[["Con đường này có rất nhiều phương tiện giao thông, vì vậy hãy cẩn thận khi đi qua.", //Group 1
            "Tôi đồng ý với ý kiến của anh ấy.",
            "Mọi người đồng ý với ý kiến của anh ấy.",
            "Kết quả của kỳ thi như thế nào?",
            "Kết luận của bài trình bày là gì?",
            "Đất nước này được ban phước với nguồn tài nguyên thiên nhiên.",
            "Dầu và khí được cung cấp nhiên liệu.",
            "Chúng tôi chụp một bức ảnh kỷ niệm.",
            "Tôi đã học được quá khứ của động từ.",
            "Anh thích sự cô đơn.",
            "Nền văn minh cổ đại thịnh vượng ở đây.",
            "Anh ta đang quản lý căn hộ này.",
            "Anh ấy lạc quan.",
            "Tôi bỏ ví và liên lạc với cảnh sát.",
            "Chuẩn bị cho ngày mai.",
            "Thành phố thủ đô của Nhật Bản là Tokyo."],
         
         ["Tôi chơi tennis với Taro vào thứ ba tuần này.",   //Group 2
            "Mẹ tôi quay trở lại đất nước tuần trước.",
            "Tôi sẽ đến Tokyo vào tuần tới.",
            "Mỗi tuần tôi sẽ mua hoa cho vợ tôi.",
            "Bạn sẽ đi đâu đó vào cuối tuần?",
            "Tôi đã mua một tạp chí hàng tuần."],
         
         ["Hôm nay tôi sẽ trở lại lúc 8 giờ.",           //Group 3
            "Tôi học tiếng Nhật mỗi ngày.",
            "Xác định ngày và giờ của bên.",
            "Chúng tôi coi trọng cuộc sống hàng ngày của mình.",
            "Mua nhu yếu phẩm hàng ngày tại siêu thị gần đó."],
         
         ["Bắt đầu một byte mới từ tháng này.",           //Group 4
            "Mẹ tôi sẽ đến Hà Nội vào tháng tới.",
            "Cửa hàng này vừa mới mở vào tháng trước.",
            "Tiền lương hàng tháng của tôi là 100.000 yên.",
            "Phí hàng tháng cho phí byte là khoảng 50.000 yên."],
         
         ["Nhiều xe tải đi qua đây.",                  //Group 5
            "Sử dụng đơn đặt hàng qua mạng thông tín.",
            "Nhận thông báo về kết quả từ trường.",
            "Thông dịch tại cuộc họp.",
            "Một cơn bão đi qua Kyushu."],
         
         ["Xác nhận sự sống còn của đứa trẻ.",             //Group 6
            "Nước này sản xuất dầu.",
            "Anh ấy là một học sinh chăm chỉ.",
            "Khoa ngoại ngữ có nhiều inh viên nữ hơn sinh viên nam.",
            "Tôi đã sống ở Nhật Bản trong 4 năm với tư cách là du học sinh."],
         
         ["Chuyên ngành của tôi là văn học Nhật Bản.",        //Group 7
            "Ông ấy là nhà nghiên cứu triết học Hi Lạp.",
            "Cùng vơi sự tiến bộ của y học, con người cũng có thể sống lâu hơn.",
            "Ông là một nhà toán học nổi tiếng.",
            "Tôi đang học dược tại trường đại học.",
            "Hóa học và khoa học có cùng cách phát âm bằng tiếng Nhật. "],
       
         ["Đây là Nhà hát Quốc gia mới.",                 //Group 8
            "Một quốc gia mới được sinh ra ở châu Phi.",
            "Quốc tịch của bạn ở đâu?",
            "Chuyên môn của tôi là quan hệ quốc tế.",
            "Liên Hợp Quốc là viết tắt của Liên Hiệp Quốc."],
         
         ["Gọi nhưng không có phản ứng gì.",               //Group 9
            "Thời trang thường phản ảnh thời đại đó.",
            "Phản xạ có điều kiện là phản ứng sinh học bằng cách học.",
            "Tôi phản đối biện pháp đó.",
            "Anh ta bị cảnh sát bắt vì vi phạm giao thông.",
            "Viết điểm phản chiếu trong nhật ký."],
         
         ["Mặt đất rất trơn, dễ trượt ngã nên hãy cẩn thận.",    //Group 10
            "Một phần từ trái đất là lục địa.",
            "Tòa nhà này có 3 tầng hầmvà 10 tầng trên mặt đất.",
            "Có rất nhiều trận động đất ở Nhật Bản.",
            "Có nhiều vùng đất ngập nước ở đất nước này.",
            "Tạo đất ở. "]]]
    
    var reibunV2 =
        
     [[["Hãy chú ý đến đột quỵ nhiệt.",                     //Group 1
            "Đã có nhiều sự đồng ý.",
            "Bạn có ý kiến ​​gì không?",
            "Kết quả là nó thành công.",
            "Tôi không hài lòng với kết luận này.",
            "Nhiên liệu cho xe buýt này là khí thiên nhiên.",
            "Nhật Bản nhập khẩu nhiên liệu.",
            "Kỷ niệm 25 năm kết hôn.",
            "Vấn đề của bài kiểm tra này cũng đã xuất hiện trong quá khứ.",
            "Mẹ tôi đã gửi một cuộc sống cô đơn.",
            "Tôi đang nghiên cứu lịch sử của thời cổ đại.",
            "Anh ấy cần tự quản lý.",
            "Anh ta lạc quan về tương lai.",
            "Trong trường hợp thiên tai, mọi người giữ liên lạc.",
            "Phải mất thời gian để chuẩn bị.",
            "Thủ đô của Việt Nam là Hà Nội."],
    
        ["Theo dự báo thời tiết, có vẻ như trời sẽ mưa vào cuối tuần này.",  //Group 2
            "Ngôi trường đã bị đóng cửa do mưa lớn hôm thứ Sáu tuần trước.",
            "Kỳ nghỉ hè bắt đầu vào tuần tới.",
            "Tôi xem phim với bạn bè mỗi tuần.",
            "Tôi thường chơi bóng đá vào cuối tuần.",
            "Tạp chí hàng tuần của nhà xuất bản này nổi tiếng."],
        
        ["Tôi là sinh viên đại học từ hôm nay.",                   //Group 3
            "Tôi đi đến nhà ga bằng xe buýt mỗi ngày.",
            "Vui lòng cho tôi biết ngày và giờ của cuộc họp tiếp theo.",
            "Tôi đi bộ hàng ngày.",
            "Ngay cả ở các cửa hàng bách hóa, bạn có thể mua các vật dụng hàng ngày."],
        
        ["Tôi phải hoàn thành công việc này trong tháng.",            //Group 4
            "Tôi sẽ kết hôn vào tháng tới.",
            "Anh ấy quay trở lại đất nước hồi tháng trước.",
            "Ngày thanh toán hàng tháng là ngày 25 hàng tháng.",
            "Lệ phí hàng tháng cho việc sử dụng ứng dụng này là 300 yên."],
        
        ["Con đường này là đường một chiều.",                    //Group 5
            "Giao tiếp với bạn bè nước ngoài.",
            "Cho cha mẹ xem bảng thông báo từ trường.",
            "Mệt mỏi với công việc thông dịch.",
            "Tàu (tokkyu) đi qua ga này."],
        
        ["Có khả năng các dạng sống tồn tại trong vũ trụ.",           //Group 6
            "Sản xuất lúa gạo nổi tiếng ở đây.",
            "Dạy tiếng Anh cho học sinh trung học cơ sở.",
            "Tôi đã chơi các môn thể thao khác nhau trong thời học sinh.",
            "Tôi muốn sống một cuộc sống xa hoa ở nước ngoài."],
        
        ["Truyện Genji là 1 kiệt tác văn học cổ điển của Nhật Bản.",      //Group 7
            "Nghiên cứu này nằm ngoài ranh giới giữa triết học và tôn giáo.",
            "Y học được coi là lĩnh vực học thuật lâu đời nhất với triết học.",
            "Toán học tốt ở trường trung học.",
            "Tôi tốt nghiệp Khoa Khoa học Dược phẩm và trở thành dược sĩ.",
            "Ông được trao giải Nobel Hóa học."],
        
        ["Có bao nhiêu trường đại học quốc gia ở Nhật Bản?",           //Group 8
            "Sau khi vượt qua kỳ thi, tôi đã trở thành một công chức quốc gia.",
            "Quốc tịch của tôi là người Việt Nam.",
            "Sân bay quốc tế Tokyo mới nằm ở quận Chiba.",
            "Liên Hợp Quốc là một tổ chức quốc tế được thành lập vào năm 1945."],
        
        ["Hình như là không hợp thuốc nên đã gây ra phản ứng kháng thuốc.",  //Group 9
            "Phát triển những sản phẩm phản ánh mong muốn của người tiêu dùng.",
            "Pha lê này phát sáng bảy mầu do phản xạ ánh sáng.",
            "Số người tán thành ý kiến của anh ấy ít hơn số người phản đối.",
            "Đó là một sự vi phạm các quy tắc bóng đá.",
            "Phản chiếu là hành vi của riêng bạn."],
        
        ["Làm scribbles trên mặt đất.",                         //Group 10
            "Mặt trăng quay quanh trái đất.",
            "Gửi tín hiệu từ mặt đất về phía vũ trụ.",
            "Đây là một đào tạo để ngăn chặn thiệt hại của trận động đất.",
            "Đất ngập nước không thích hợp cho trồng rau.",
            "Giá đất ở đang tăng lên."]]]
        
//        var reibunJ =
//        [[
//   //Group1
//            ["この道は交通量が多いので、渡るときには注意が必要だ。\n\nCon đường này có rất nhiều phương tiện giao thông, vì vậy hãy cẩn thận khi đi qua. \n\n熱中症に注意してください。\n\nHãy chú ý đến đột quỵ nhiệt."],
//            ["皆が彼の意見に同意した。 \n\nMọi người đồng ý với ý kiến của anh ấy.\n\n何か意見はありますか。\n\nBạn có ý kiến ​​gì không?"],
//            //["北と南の温度の差が激しい。\n\n Sự chênh lệch về nhiệt độ giữa miền Bắc và miền Nam rất dữ dội. \n\n部屋の温度を測ると30度もあった。\n\n Nhiệt độ của phòng được đo và nó là 30 độ."],
//            //["私の専門は日本語だ。\n\n Chuyên môn của tôi là tiếng Nhật.\n\n専門的な話はわからない。\n\n Tôi không hiểu những câu chuyện mang tính chuyên môn."]], //Group 1
//            ["明日のために準備する。\n\nChuẩn bị cho ngày mai.\n\n準備に時間がかかる。\n\nPhải mất thời gian để chuẩn bị."],
//            ["彼はこのアパートを管理している。\n\nAnh ta đang quản lý căn hộ này.\n\n彼は自己管理が必要だ。\n\nAnh ấy cần tự quản lý."],
//            ["記念に写真を撮る。\n\nChụp ảnh trong lễ kỷ niệm.\n\n結婚25年を記念する。\n\nKỷ niệm 25 năm kết hôn."],
//            ["明日のために準備する。\n\nChuẩn bị cho ngày mai.\n\n準備に時間がかかる。\n\nPhải mất thời gian để chuẩn bị."],
//            ["明日のために準備する。\n\nChuẩn bị cho ngày mai.\n\n準備に時間がかかる。\n\nPhải mất thời gian để chuẩn bị."],
//            ["明日のために準備する。\n\nChuẩn bị cho ngày mai.\n\n準備に時間がかかる。\n\nPhải mất thời gian để chuẩn bị."]],
//    //Group2
//         [["私は今週の火曜日に太郎さんとテニスをします。\n\nTôi chơi tennis với Taro vào thứ ba tuần này. \n\n天気予報によると、今週は週末にかけて雨が降るようだ。　\n\nTheo dự báo thời tiết, có vẻ như trời sẽ mưa vào cuối tuần này."],
//          ["母は、先週国に帰りました。\n\nMẹ tôi quay trở lại đất nước tuần trước. \n\n先週の金曜日は、大雨のため休校になった。\n\nNgôi trường đã bị đóng cửa do mưa lớn hôm thứ Sáu tuần trước."],
//          ["私は来週、東京へ行きます。 \n\nTuần tới, tôi sẽ đi đến Tokyo.\n\n来週から夏休みが始まります。\n\nTKỳ nghỉ hè bắt đầu vào tuần tới."],
//          ["毎週妻に花を買います。\n\nMỗi tuần tôi sẽ mua hoa cho vợ tôi. \n\n私は毎週友達と映画をみます。\n\nTôi xem phim với bạn bè mỗi tuần."],
//          ["あなたは週末、どこかに行きますか。\n\nBạn sẽ đi đâu đó vào cuối tuần?\n\n私は週末によくサッカーをします。\n\nTôi thường chơi bóng đá vào cuối tuần."]],
//            //,
//          //["隔週（２週間おきに）東京に来ます。\n\nTôi sẽ đến Tokyo hai tuần một lần. \n\n私は隔週（２週間に１度）母に電話をします。\n\nTôi sẽ gọi cho mẹ tôi hai tuần một lần."]], //Group 2
//
//         [["今日は8時までに帰ります。\n\nHôm nay tôi sẽ trở lại lúc 8 giờ. \n\n私は今日から大学生だ。\n\nTôi là sinh viên đại học từ hôm nay."],
//          ["私は毎日日本語を勉強します。\n\nTôi học tiếng Nhật mỗi ngày. \n\n昨日のパーティーに出席しましたか。\n\nTrời mưa hàng ngày."],
//          ["パーティの日時を決定する。\n\n Xác định ngày và giờ của bên. \n\n次の会議の日時を教えてください。\n\nVui lòng cho tôi biết ngày và giờ của cuộc họp tiếp theo."],
//          ["私たちは日常生活を大切にしています。\n\nChúng tôi coi trọng cuộc sống hàng ngày của mình. \n\n散歩は日常的に行っている。\n\nTôi đi bộ hàng ngày."],
//          ["近くのスーパーで日用品を買います。\n\nMua nhu yếu phẩm hàng ngày tại siêu thị gần đó.\n\nデパートでも日用品を買うことができます。\n\nNgay cả ở các cửa hàng bách hóa, bạn có thể mua các vật dụng hàng ngày."]],  //Group 3
//
//         [["今月から新しいバイトを始めます。\n\nBắt đầu một byte mới từ tháng này. \n\n今月中にこの仕事を仕上げなくてはならない。\n\nTôi phải hoàn thành công việc này trong tháng."],
//          ["私の月給は10万円です。\n\nTiền lương hàng tháng của tôi là 100.000 yên. \n\n月給日は毎月25日です。\n\nNgày thanh toán hàng tháng là ngày 25 hàng tháng."],
//          ["バイト料の月額は5万円くらいです。\n\nPhí hàng tháng cho phí byte là khoảng 50.000 yên. \n\nこのアプリの使用料は、月額300円です。\n\nLệ phí hàng tháng cho việc sử dụng ứng dụng này là 300 yên."],
//          ["母は、来月ハノイに来る予定です。\n\nMẹ tôi sẽ đến Hà Nội vào tháng tới. \n\n私は来月結婚します。\n\nTôi sẽ kết hôn vào tháng tới."],
//          ["この店は、先月オープンしました。\n\nCửa hàng này vừa mới mở vào tháng trước. \n\n彼は先月帰国しました。\n\nAnh ấy quay trở lại đất nước hồi tháng trước."]],
//          //Group 4
//
//         [["ここはたくさんのトラックが通行する。\n\nNhiều xe tải đi qua đây. \n\nこの道は一方通行だ。\n\nCon đường này là đường một chiều."],
//          ["通信販売を利用する。\n\nSử dụng đơn đặt hàng qua mạng thông tín. \n\n海外の友達と通信する。\n\nGiao tiếp với bạn bè nước ngoài."],
//          ["学校からの成績通知を受け取る。\n\nNhận thông báo về kết quả từ trường. \n\n通知表を親に見せる。\n\nCho cha mẹ xem bảng thông báo từ trường."],
//          ["会議で通訳する。\n\nThông dịch tại cuộc họp. \n\n通訳の仕事は疲れる。\n\nMệt mỏi với công việc thông dịch."],
//          ["台風（たいふう）が九州を通過した。\n\nMột cơn bão đi qua Kyushu. \n\n特急はこの駅を通過する。\n\nTàu (tokkyu) đi qua ga này."]],  //Group 5
//
//         [["子供の生存を確認する。\n\nXác nhận sự sống còn của đứa trẻ. \n\n宇宙には生命体が生存している可能性がある。\n\nCó khả năng các dạng sống tồn tại trong vũ trụ."],
//          ["この国は石油を生産する。\n\nNước này sản xuất dầu. \n\nここは米の生産が有名だ。\n\nSản xuất lúa gạo nổi tiếng ở đây."],
//          ["彼はまじめな生徒だ。\n\nAnh ấy là một học sinh chăm chỉ. \n\n中学校の生徒に英語を教える。\n\nDạy tiếng Anh cho học sinh trung học cơ sở."],
//          ["外国語学部は男子学生より女子学生の方が多い。\n\nKhoa ngoại ngữ có nhiều inh viên nữ hơn sinh viên nam. \n\n学生時代にはいろいろなスポーツをした。\n\nTôi đã chơi các môn thể thao khác nhau trong thời học sinh."],
//          ["留学生として日本で4年間生活した。\n\nTôi đã sống ở Nhật Bản trong 4 năm với tư cách là du học sinh. \n\n海外でぜいたくな生活を送りたい。\n\nTôi muốn sống một cuộc sống xa hoa ở nước ngoài."]], //Group 6
//
//         //ここから第二弾、Group7-9\n\n
//            //7
//            [["私の専攻は日本文学だ。\n\nChuyên ngành của tôi là văn học Nhật Bản. \n\n『源氏物語』は日本の古典文学の最高傑作だ。\n\nTruyện Genji là 1 kiệt tác văn học cổ điển của Nhật Bản."],
//             ["彼はギリシャ哲学の研究者だ。\n\nÔng ấy là nhà nghiên cứu triết học Hi Lạp. \n\nこの研究は哲学と宗教学の境界を超えている。\n\nNghiên cứu này nằm ngoài ranh giới giữa triết học và tôn giáo."],
//             ["医学が進み、人間が長生きできるようになった。\n\nCùng vơi sự tiến bộ của y học, con người cũng có thể sống lâu hơn. \n\n医学は哲学とともに最も古い学問分野だと言われている。\n\nY học được coi là lĩnh vực học thuật lâu đời nhất với triết học."],
//             ["彼は有名な数学者だ。\n\nÔng là một nhà toán học nổi tiếng. \n\n高校の時から数学が得意だった。\n\nToán học tốt ở trường trung học."],
//             ["大学では薬学を学んでいる。\n\nTôi đang học dược tại trường đại học. \n\n薬学部を卒業して、薬剤師（やくざいし）になった。\n\nTôi tốt nghiệp Khoa Khoa học Dược phẩm và trở thành dược sĩ。"],
//             ["化学と科学は日本語で発音が同じだ。\n\nHóa học và khoa học có cùng cách phát âm bằng tiếng Nhật. \n\n彼はノーベル化学賞を受賞した。\n\nÔng được trao giải Nobel Hóa học."]], //Group 7
//            //8
//            [["これが新しい国立劇場（げきじょう）です。\n\nĐây là Nhà hát Quốc gia mới.\n\n日本に国立大学はいくつありますか。\n\nCó bao nhiêu trường đại học quốc gia ở Nhật Bản?"],
//             ["アフリカに新しい国家が生まれた。\n\nMột quốc gia mới được sinh ra ở châu Phi.\n\n試験に合格して、国家公務員（こっかこうむいん）になった。 \n\nSau khi vượt qua kỳ thi, tôi đã trở thành một công chức quốc gia."],
//             ["国籍はどこですか。\n\nQuốc tịch của bạn ở đâu?\n\n国籍はベトナムです。 \n\nQuốc tịch là người Việt Nam."],
//             ["私の専門は国際関係だ。\n\nChuyên môn của tôi là quan hệ quốc tế.\n\n新東京国際空港は千葉県にあります。\n\nSân bay quốc tế Tokyo mới nằm ở quận Chiba."],
//             ["国連は国際連合（こくさいれんごう）の略（りゃく）だ。\n\nLiên Hợp Quốc là viết tắt của Liên Hiệp Quốc.\n\n国連は1945年に設立された国際機構（こくさいきこう）だ。\n\nLiên Hợp Quốc là một tổ chức quốc tế được thành lập vào năm 1945."]],//Group 8
//            //9
//           [["呼びかけても何の反応もない。\n\nGọi nhưng không có phản ứng gì.\n\n薬が合わなかったらしく拒絶反応を起こした。\n\nHình như là không hợp thuốc nên đã gây ra phản ứng kháng thuốc."],
//             ["ファッションは常にその時代を反映していると言える。\n\nThời trang thường phản ảnh thời đại đó.\n\n消費者の意見を反映した商品を開発する。\n\nPhát triển những sản phẩm phản ánh mong muốn của người tiêu dùng."],
//             ["条件反射（じょうけんはんしゃ）は学習による生物学的（せいぶつがくてき）応答（おうとう）である。\n\nPhản xạ có điều kiện là phản ứng sinh học bằng cách học. \n\nこのクリスタルは光の反射により七色に輝く（かがやく）。 \n\nPha lê này phát sáng bảy mầu do phản xạ ánh sáng."],
//             ["法案（ほうあん）に反対します。\n\nBỏ phiếu phản đối dự luật.\n\n彼の意見に賛成の人は反対の人より少ない。\n\nSố người tán thành ý kiến của anh ấy ít hơn số người phản đối."],
//             ["敵（てき）の反撃にあった。\n\nGiám sát vi phạm giao thông.\n\n野党は次の選挙（せんきょ）で反撃する機会（きかい）をうかがっている。 \n\nĐó là một sự vi phạm các quy tắc bóng đá."],
//             ["反省点を日記に書く。\n\nViết điểm phản chiếu trong nhật ký.\n\n「反省」とは、自分の言動（げんどう）を振り返ることです。\n\nPhản chiếu là hành vi của riêng bạn."]], //Group 9
//
//           [["地面がぬれていて、すべりやすいので気をつけてください。\n\nMặt đất rất trơn, dễ trượt ngã nên hãy cẩn thận. \n\n地面に落書き(らくがき）をする。\n\nLàm scribbles trên mặt đất."],
//             ["地球の４分の１は陸だ。\n\nMột phần từ trái đất là lục địa.\n\n月は地球のまわりを回っている。\n\nMặt trăng quay quanh trái đất."],
//             ["このビルは地下３階、地上１０階建てだ。\n\nTòa nhà này có 3 tầng hầmvà 10 tầng trên mặt đất. \n\n地上から宇宙（うちゅう）に向かって信号（しんごう）を送る。\n\nGửi tín hiệu từ mặt đất về phía vũ trụ."],
//             ["家を建てるために土地を買った。\n\nTôi đã mua đất để xây nhà.\n\n工事の前に、土地の測量（そくりょう）をする。\n\nTrước khi xây dựng, tiến hành đo đạc đất đai."],
//             ["この国には多くの湿地がある。\n\nCó nhiều vùng đất ngập nước ở đất nước này. \n\n湿地は野菜栽培には適していない。\n\nĐất ngập nước không thích hợp cho trồng rau."],
//
//             ["宅地を造成(ぞうせい）する。\n\nTạo đất ở.\n\n宅地の価格（かかく）が上がっている。\n\nGiá đất ở đang tăng lên."]]] //Group 10
    

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
        
        // 行間の変更(正確には行自体の高さを変更している。)
        let lineHeight:CGFloat = 40.0
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.minimumLineHeight = lineHeight
        paragraphStyle.maximumLineHeight = lineHeight
        let attributedText = NSMutableAttributedString(string: QSelect.text!)
        attributedText.addAttribute(NSAttributedStringKey.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attributedText.length))
        QSelect.attributedText = attributedText
        QSelect.textAlignment = NSTextAlignment.center //ここで、ローカライズしたあともcenterになるように設定
        
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
        let height = UIScreen.main.bounds.size.height
        //general設定
        cell.textLabel!.font = UIFont.boldSystemFont(ofSize: 20)
        //iPhone の文字の大きさ設定
        
        if height <= 812 {
            cell.textLabel!.font = UIFont.boldSystemFont(ofSize: 18)
        //iPad の文字の大きさ設定
        }else{
            cell.textLabel!.font = UIFont.boldSystemFont(ofSize: 30)
            
        }
        
        
        // 値を設定する.
        switch indexPath.row {
        case 0:
            cell.textLabel!.text = "Group \(indexPath.row + 1)    \(NSLocalizedString("QSG1", comment: ""))"
        case 1:
            cell.textLabel!.text = "Group \(indexPath.row + 1)    \(NSLocalizedString("QSG2", comment: ""))"
        case 2:
            cell.textLabel!.text = "Group \(indexPath.row + 1)    \(NSLocalizedString("QSG3", comment: ""))"
        case 3:
            cell.textLabel!.text = "Group \(indexPath.row + 1)    \(NSLocalizedString("QSG4", comment: ""))"
        case 4:
            cell.textLabel!.text = "Group \(indexPath.row + 1)    \(NSLocalizedString("QSG5", comment: ""))"
        case 5:
            cell.textLabel!.text = "Group \(indexPath.row + 1)    \(NSLocalizedString("QSG6", comment: ""))"
        case 6:
            cell.textLabel!.text = "Group \(indexPath.row + 1)    \(NSLocalizedString("QSG7", comment: ""))"
        case 7:
            cell.textLabel!.text = "Group \(indexPath.row + 1)    \(NSLocalizedString("QSG8", comment: ""))"
        case 8:
            cell.textLabel!.text = "Group \(indexPath.row + 1)    \(NSLocalizedString("QSG9", comment: ""))"
        case 9:
            cell.textLabel!.text = "Group \(indexPath.row + 1)   \(NSLocalizedString("QSG10", comment: ""))"
            
        
            
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
            ViewController.reibunJ1 = reibunJ1[sender as!Int]
            ViewController.reibunJ2 = reibunJ2[sender as!Int]
            ViewController.reibunV1 = reibunV1[sender as!Int]
            ViewController.reibunV2 = reibunV1[sender as!Int]
            ViewController.cellNumber = sender as!Int
            ViewController.hiddenFlag = true
           
            
        }
        
    }
    
}

