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
           [["注意","意見","同意","結果","結論","天然","燃料","記念","過去","孤独","古代","管理","楽観","連絡","準備","首都","観察","宇宙","歴史","破産"], //Group 1
                        
            ["今週","先週","来週","毎週","週末","週刊誌"], //Group 2
            ["今日","毎日","日時","日常","日用品"], //Group 3
            ["今月","来月","先月","月給","月額","月末"], //Group 4
            ["通信","通知","通訳","交通"], //Group 5
            ["生存","生活","生命","生還","生計"], //Group 6
            ["文学","哲学","医学","数学","薬学","化学","社会学","政治学","学者","学校","大学"], //Group 7 学がつく漢語 x 11
            ["国立","国家","国籍","国際","国連"], //Group 8 国を含む
            ["反応","反映","反射","反対","違反","反省"], //Group 9 反を含む　６語
            ["地面","地球","地上","地震","湿地"],//Group 10 地を含む
            ["費用","人件費","食費","旅費","学費","光熱費"],  //Group 11 費を含む
            ["活動","動詞","動物","動機","動作"],  //Group 12 費を含む
            ["鉄道","鉄橋","私鉄","鉄分"],  //Group 13 費を含む
            ["友人","友情","親友","悪友"],  //Group 14 費を含む
            ["信号","信頼","信者","信仰"],  //Group 15 費を含む
            ["人間","人数"," 外国人","日本人","新人","人権"],  //Group 16 費を含む
            ["政治家","小説家","家族","家電"]]  //Group 17 費を含む
    

    var katakana =
           [["友達にチュウイする","反対イケンを言う","意見にドウイする","試験のケッカ","ケツロンを先に言う","テンネンの温泉（おんせん）","ネンリョウ費（ひ）","キネン日（び）","カコのデータ","コドクなくらし","コダイの文明（ぶんめい）","カンリする","ラッカン的（てき）","レンラクする","ジュンビする","日本のシュト","花をカンサツする ","ウチュウ飛行士","日本のレキシ","会社がハサンする"], // Group 1
            ["コンシュウの土曜日","センシュウから今週まで","ライシュウの火曜日","マイシュウ水曜日","シュウマツに出かける","シュウカンシを読む"], //Group 2
            ["キョウは晴れだ","マイニチ学校に行く","会議のニチジ","ニチジョウの生活","ニチヨウヒンを買う"], //Group 3
            ["コンゲツ","ライゲツ","センゲツ","ゲッキュウ","ゲツガク","ゲツマツ"], //Group 4
            ["ツウシンする","ツウチする","ツウヤクする","コウツウルールを守る"], //Group 5
            ["セイゾンしている","セイカツする","セイメイ保険（ほけん）","宇宙からセイカンする","セイケイを立てる"], //Group 6
            ["ブンガクを勉強する",
             "テツガクはむずかしい",
             "イガクが進歩する",
             "スウガクが得意（とくい）だ",
             "ヤクガクを学ぶ",
             "カガクの実験（じっけん）",
             "シャカイガク",
             "セイジガク",
             "政治ガクシャ ",
             "ガッコウ",
             "ダイガク"], //Group 7 x 11
            ["コクリツ大学",
             "民主主義（みんしゅしゅぎ）コッカ",
             "コクセキはベトナムだ",
             "コクサイ的に有名",
             "コクレン加盟国（かめいこく）"], //Group 8
            ["体がハンノウする","ハンエイする","光がハンシャする","ハンタイ意見","ルールにイハンする","ハンセイする"], //Group 9
            ["ジメンに落ちた","チキュウを守る","チジョウに出る","ジシンがおきる","シッチ帯（たい）が広がる"], //Group 10
            ["ヒヨウがかかる","ジンケンヒが高い","ショクヒを増やす","リョヒを払う","ガクヒを払う","コウネツヒが高い"], //Group 11
            ["カツドウする","日本語のドウシ","ドウブツ園","学習ドウキの研究","ドウサする"], //Group 12
            ["鉄道がトオル","テッキョウを渡る","シテツに乗る"], //Group 13
            ["ユウジンが多い","固いユウジョウ","シンユウ","アクユウ"], //Group 14
            ["交通シンゴウ","シンライする","シンジャが多い","シンコウ心（しん）が強い"], //Group 15）
            ["ニンゲン","ニンズウ","ガイコクジン","ニホンジン","シンジン教育","ジンケン週間"], //Group 16
            ["セイジカになる","ショウセツカ","5人カゾク","カデン製品を買う"]] //Group 17”
    
    var vietnamese =
           [["chú ý","ý kiến","đồng ý","Kết quả","Kết luận","thiên nhiên","Nhiên liệu","kỷ niệm","quá khứ","cô đơn","cổ đại","Quản lý","Lạc quan","liên lạc","Chuẩn bị","thủ đô","Quan sát","Vũ trụ","Lịch sử","phá sản"], //Group 1
            ["tuần này","tuần trước","Tuần tới","Mỗi tuần","Cuối tuần","Tạp chí hàng tuần"], //Group 2
            ["Ngày này (Hôm nay)","Mỗi ngày","Ngày giờ","Hàng ngày","Nhu yếu phẩm hàng ngày"], //Group 3
            ["Tháng này","Tháng tiếp theo","Tháng trước","Tiền lương hàng tháng","Số tiền hàng tháng","Cuối tháng"], //Group 4
            ["thông tín","thông tri","thông dịch","Giao thông"],// Group 5
            ["Sự sống còn","sống","Cuộc sống","Sống sót","Sống"], //Group 6
            ["Văn học",
             "triết học",
             "y học",
             "toán học",
             "dược học",
             "hóa học",
             "Xã hội học",
             "Khoa học chính trị",
             "Một học giả",
             "Trường học",
             "Đại học"], //Group7 x 11
            ["Quốc gia","Một quốc gia","Quốc tịch","Quốc tế","Liên Hợp Quốc"],//Group8
            ["Phản ứng","Phản ánh","Phản xạ","Phản đối","Vi phạm","Sự phản chiếu"],//Group9
            ["Mặt đất","Trái đất","Trên mặt đất","Đất đai","Đất ngập nước","Đất ở"],//Group10
            ["Chi phí","Chi phí nhân sự","Chi phí ăn uống","Chi phí đi lại","Học phí","Phí tiện ích"],//Group11
            ["Hoạt động","động từ","Động vật","Động lực","động tác"],//Group12
            ["Đường sắt","Cầu sắt","Đường sắt tư nhân"],//Group13
            ["Một người bạn","Tình bạn","Bạn thân nhất","Bạn xấu"],//Group14
            ["Tín hiệu","Tin tưởng","Người tin Chúa","Đức tin "],//Group15
            ["Một con người","Số người","Một người nước ngoài","Người Nhật","Người mới đến","Quyền con người"],//Group16
            ["Chính trị gia","Một tiểu thuyết gia","Một gia đình","Điện tử gia dụng"]]//Group17
    
    var pronunciationJ =
        [["Chuui","Iken","Doui","Kekka","Ketsuron","Tennen","Nenryou","Kinen","Kako","Kodoku","Kodai","Kanri","Rakkan","Renraku","Junbi","Shuto","Kansatsu","Uchuu","Rekishi","Hasan"],//Groupo 1
            ["Konshuu","Senshuu","Raishuu","Maishuu","Shuumatsu","Shuukanshi"], //Group 2
            ["Kyou","Mainichi","Nichiji","Nichijou","Nichiyouhin"], //Group 3
            ["Kongetsu","Raigetsu","Sengetsu","Gekkyuu","Getsugaku","Getsumatsu"], //Group 4
            ["Tsuushin","Tsuuchi","Tsuuyaku","Koutsuu"],  //Group 5
            ["Seizon","Seikatsu","Seimei","Seikan","Seikei"], //Group 6
            ["Bungaku",
             "Tetsugaku",
             "Igaku",
             "Suugaku",
             "Yakugaku",
             "Kagaku",
             "Shakaigaku",
             "Seijigaku",
             "Gakusha",
             "Gakkou",
             "Daigaku"], //Group7
            ["Kokuritsu","Kokka","Kokuseki","Kokusai","Kokuren"], //Group 8
            ["Hannou","Hanei","Hansha","Hantai","Ihan","Hansei"], //Group 9
            ["Jimen","Chikyuu","Chijou","Jishin","Shicchi"], //Group 10
            ["Hiyou","Jinkenhi","Shokuhi","Shokuhi","Ryohi","Gakuhi","Kounetsuhi"], //Group 11
            ["Katsudou","Doushi","Doubutsu","Douki","Doumyaku"], //Group 12
            ["Tetsudou","Tekkyou","Shitetsu"], //Group 13
            ["Yuujin","Yuujou","Shinyuu","Akuyuu"], //Group 14
            ["Shingou","Shinrai","Shinja","Shinkou"], //Group 15
            ["Ningen","Ninzuu","Gaikokujin","Nihonjin","Shinjin","Jinken"], //Group 16
            ["Seijika","Shousetsuka","Kazoku","Kaden"]] //Group 17
    
    var reibunJ1 =
        //Group 1
          [[["この機械を使う時は注意が必要だ。"],
            ["誰もが彼の意見に反対した。"],
            ["皆が彼の意見に同意した。"],
            ["試験の結果はどうでしたか。"],
            ["プレゼンテーションの結論は何ですか。"],
            ["この国は天然資源に恵まれている。"],
            ["石油とガスは燃料になる。"],
            ["記念に写真を撮る。"],
            ["私は動詞の過去形を学んだ。"],
            ["彼は孤独を好む。"],
            ["古代文明はここで繁栄した。"],
            ["彼はこのアパートを管理している。"],
            ["彼は楽観的な人だ。"],
            ["財布を落としたので、警察に連絡した。"],
            ["明日のために準備する。"],
            ["日本の首都は東京だ。"],
            ["星の動きを観察する。"],
            ["宇宙では重力がかからない。"],
            ["日本の歴史を学ぶ。"],
            ["破産とはすべての財産をなくすことだ。"]],
         //Group 2
           [["私は今週の火曜日に太郎さんとテニスをします。"],
            ["母は、先週国に帰りました。"],
            ["私は来週、東京へ行きます。"],
            ["毎週妻に花を買います。"],
            ["あなたは週末、どこかに行きますか。"],
            ["私は週刊誌を買った。"]],
         //Group 3
           [["今日は8時までに帰ります。"],
            ["私は毎日日本語を勉強します。"],
            ["パーティの日時を決定する。"],
            ["私たちは日常生活を大切にしています。"],
            ["近くのスーパーで日用品を買います。"]],
          //Group 4
           [["今月から新しいバイトを始めます。"],
            ["母は、来月ハノイに来る予定です。"],
            ["この店は、先月オープンしました。"],
            ["私の月給は10万円です。"],
            ["バイト料の月額は5万円くらいです。"],
            ["私は月末に給料を受け取った。"]],
          //Group 5
           [["通信販売を利用する。"],
            ["学校からの成績通知を受け取る。"],
            ["会議で通訳する。"],
            ["今日から交通安全週間が始まる。"]],
         //Group 6
           [["子供の生存を確認する。"],
            ["私は留学生として日本で生活している。"],
            ["大地震で多くの生命が奪われた。"],
            ["宇宙飛行士は無事生還した。"],
            ["村人たちは、農業をして生計を立てている。"]],
         //Group 7
           [["私の専攻は日本文学だ。"],
            ["彼はギリシャ哲学の研究者だ。"],
            ["医学が進み、人間が長生きできるようになった。"],
            ["彼は有名な数学者だ。"],
            ["大学では薬学を学んでいる。"],
            ["化学と科学は日本語で発音が同じだ。"],
            ["私は大学で社会学を学んだ。"],
            ["政治学は経済学、社会学、法学などと同じ社会科学分野に入る。"],
            ["学者に専門的な意見を求める。"],
            ["私は海外の学校を卒業した。"],
            ["日本の大学には国公立大学と私立大学がある。"]],
         //Group 8 国
           [["これが新しい国立劇場（げきじょう）です。"],
            ["アフリカに新しい国家が生まれた。"],
            ["あなたの国籍はどこですか。"],
            ["私の専門は国際関係だ。"],
            ["国連は国際連合（こくさいれんごう）の略（りゃく）だ。"]],
         //Group 9 反
           [["呼びかけても何の反応もない。"],
            ["ファッションは常にその時代を反映していると言える。"],
            ["条件反射（じょうけんはんしゃ）は、学習による生物学的（せいぶつがくてき）応答（おうとう）である。"],
            ["私はその対策（たいさく）に反対します。"],
            ["彼は交通違反で警察に逮捕された。"],
            ["反省点を日記に書く。"]],
         //Group 10 地
           [["地面がぬれていて、すべりやすいので気をつけてください。"],
            ["地球の４分の１は陸だ。"],
            ["このビルは地下３階、地上１０階建てだ。"],
            ["日本は地震が多い。"],
            ["この国には多くの湿地がある。"]],
        
         //Group 11 費
           [["国が留学費用を負担する。"],
            ["人件費を削減する。"],
            ["食費を節約する。"],
            ["東京までの旅費を計算する。"],
            ["日本の私立大学は学費が高い。"],
            ["光熱費を節約する。"]],
        
        //Group 12 動
           [["救援活動は海外で行われている。"],
            ["動詞の使い方を学ぶ。"],
            ["この島には多くの動物がいる。"],
            ["学習には動機付けが必要だ。"],
            ["血管には動脈と静脈（じょうみゃく）がある。"]],
    
        //J1 Group 13 鉄
           [["1872年、日本初の鉄道が新橋と横浜の間に開通した。"],
            ["鉄橋は鉄で出来ている。"],
            ["私鉄は民間企業が運営する鉄道だ。"]],
            
        //Group 14 友
           [["私は昨日友達とゲームをしました。"],
            ["私たちは友情でつながっている。"],
            ["田中さんは子供時代から私の親友だ。"],
            ["学生の時、悪友と私はよく先生に叱られた。"]],
    
        //Group 15
           [["信号を無視するのは危険だ。"],
            ["彼は皆に信頼されている"],
            ["司祭は信者の罪の告白を聞いた。"],
            ["仏教徒にとって信仰とは、仏を信じ敬うことだ。"]],
            
        //Group 16
           [["私は職場の人間関係に苦しんでいる。"],
            ["パーティーにはかなりの人数が集まった。"],
            ["日本を訪れる外国人の数が増えた。"],
            ["日本人はあなたの国に何人ぐらい住んでいますか？"],
            ["新しい映画の主役に新人が選ばれた。"],
            ["人権は人間が持つ当然の権利だ。"]],
    
        //Group 17
           [["私の弟は政治家を目指している。"],
            ["有名な日本の小説家は誰ですか？"],
            ["私は新年に家族写真を撮った。"],
            ["私は家電メーカーに勤めている。"]]]
    
    
    
    var reibunJ2 =
        //Group 1
          [[["熱中症に注意してください。"],
            ["何か意見はありますか。"],
            ["多くの同意が得られた。"],
            ["結果的に成功だった。"],
            ["私はこの結論に満足していない。"],
            ["このバスの燃料は天然ガスだ。"],
            ["日本は燃料を輸入している。"],
            ["結婚25年を記念する。"],
            ["このテストの問題は過去にも出た。"],
            ["私の母は孤独な人生を送った。"],
            ["私は古代の歴史を研究している。"],
            ["彼は自己管理が必要だ。"],
            ["彼は将来を楽観している。"],
            ["災害の場合、人々は連絡を取り合う。"],
            ["準備に時間がかかる。"],
            ["首都は国の中心だ。"],
            ["子供たちの観察能力をチェックする。"],
            ["宇宙にどんな生物がいるのだろう？"],
            ["各国には歴史の中で作られた文化がある。"],
            ["彼は新しい会社を設立して半年後に破産した。"]],
         //Group 2
           [["天気予報によると、今週は週末にかけて雨が降るようだ。"],
            ["先週の金曜日は、大雨のため休校になった。"],
            ["来週から夏休みが始まります。"],
            ["私は毎週友達と映画をみます。"],
            ["私は週末によくサッカーをします。"],
            ["この出版社の週刊誌は有名だ。"]],
        //Group 3
           [["私は今日から大学生だ。"],
            ["私は毎日バスで駅に行く。"],
            ["次の会議の日時を教えてください。"],
            ["散歩は日常的に行っている。"],
            ["デパートでも日用品を買うことができます。"]],
         //Group 4
           [["今月中にこの仕事を仕上げなくてはならない。"],
            ["私は来月結婚します。"],
            ["彼は先月帰国しました。"],
            ["月給日は毎月25日です。"],
            ["このアプリの使用料は、月額300円です。"],
            ["私は今月末から一週間出張する。"]],
         //Group 5
           [["この会社では、通信システムを開発している。"],
            ["通知表を親に見せる。"],
            ["通訳の仕事は疲れる。"],
            ["私は交通事故のために学校に遅れた。"]],
         //Group 6
           [["宇宙には生命体（せいめいたい）が生存している可能性がある。"],
            ["海外でぜいたくな生活をしたい。"],
            ["私は生命科学を研究している。"],
            ["登山の遭難者（そうなんしゃ）の生還を祈る。"],
            ["祖父母と同居して生計を共にする。"]],
         //Group 7
           [["『源氏物語』（げんじものがたり）は日本の古典文学の最高傑作（さいこうけっさく）だ。"],
            ["この研究は哲学と宗教学（しゅうきょうがく）の境界（きょうかい）を超えている。"],
            ["医学は哲学とともに最も（もっとも）古い学問分野（がくもんぶんや）だと言われている。"],
            ["高校の時から数学が得意だった。"],
            ["薬学部を卒業して、薬剤師（やくざいし）になった。"],
            ["彼はノーベル化学賞を受賞した。"],
            ["あの教授は社会学の研究で有名だ。"],
            ["彼は大学で政治学を学び、国際政治学者になった。"],
            ["有名な海外の学者が講演（こうえん）に招待（しょうたい）された。"],
            ["日本には小学校、中学校、高等学校がある。"],
            ["大学を卒業後、私は大学院修士課程に進んだ。"]],
         //Group 8
           [["日本に国立大学はいくつありますか。"],
            ["試験に合格して、国家公務員（こっかこうむいん）になった。"],
            ["私の国籍はベトナムです。"],
            ["新東京国際空港は千葉県にあります。"],
            ["国連は1945年に設立された国際機構（こくさいきこう）だ。"]],
         //Group ９
           [["薬が合わなかったらしく拒絶反応を起こした。"],
            ["消費者の意見を反映した商品を開発する。"],
            ["このクリスタルは、光の反射により七色に輝く。"],
            ["彼の意見に賛成の人は反対の人より少ない。"],
            ["それはサッカーのルール違反だ。"],
            ["彼は自分の悪い点を反省している。"]],
         //Group 10
           [["地面に落書き(らくがき）をする。"],
            ["月は地球のまわりを回っている。"],
            ["地上から宇宙（うちゅう）に向かって信号（しんごう）を送る。"],
            ["これは地震の被害（ひがい）を防ぐための訓練（くんれん）だ。"],
            ["湿地は野菜栽培には適していない。"]],
           
        //Group 11
           [["このシステムは、費用にたいして効果が高い。"],
            ["来年度予算計画では、人件費を見直すことになった。"],
            ["寄付金は難民の食費に使われる。"],
            ["私は旅行会社に旅費を支払った。"],
            ["私は学費を支払うことができなかったので退学した。"],
            ["光熱費とはガス代、電気代やガス代のことだ。"]],
            
        //Group 12
           [["ボランティア活動に参加する。"],
            ["動詞や名詞などの品詞を学習する。"],
            ["動物の写真を撮る。"],
            ["外国語学習の動機に関する多くの研究がある。"],
            ["ロボットの動作を確認してください。"]],
            
        //Group 13
           [["北米大陸横断鉄道は19世紀半ばに完成した。"],
            ["列車が鉄橋を渡る。"],
            ["東京には私鉄がたくさんある。"]],
            
        //Group 14
           [["彼は私の友人の一人だ。"],
            ["私は彼との友情を裏切った。"],
            ["私は交通事故で親友を失った悲しさを忘れることはできない。"],
            ["悪友は一緒に悪いことをする仲間で、その反対は良友という。"]],
            
        //Group 15
           [["交通信号の色は赤、青、黄色だ。"],
            ["私は彼を信頼して、お金を貸した。"],
            ["信者はある宗教を信仰している人のことだ。"],
            ["この山は昔から神聖な山として信仰の対象となっている。"]],
            
        //Group 16
           [["人間は社会的な動物だ。"],
            ["このカウンターは、店に来た人の人数を自動的に数えてくれる。"],
            ["外国人を差別することは許されない。"],
            ["日本人は旅行するたびにお土産（みやげ）を買う。"],
            ["今年、私の会社には三人の新人が入った。"],
            ["基本的人権は尊重されなければならない。"]],
            
        //Group 17 ReivunJ２
           [["彼は日本の政治家だ。"],
            ["小説家になるのは難しい。"],
            ["私の家族は五人です。"],
            ["家電製品とは家庭で使用されるテレビ、冷蔵庫、洗濯機などを指す。"]]]

    var furigana1 =
        //Group 1
        [[["このきかいを　つかうときは　ちゅういが　ひつようだ。"],
          ["だれもが　かれの　いけんに　はんたいした。"],
          ["みなが　かれの　いけんに　どういした。"],
          ["しけんの　けっかは　どうでしたか。"],
          ["プレゼンテーションの　けつろんは　なんですか。"],
          ["このくには　てんねんしげんに　めぐまれている。"],
          ["せきゆと　ガスは　ねんりょうに　なる。"],
          ["きねんに　しゃしんを　とる。"],
          ["わたしは　どうしの　かこけいを　まなんだ。"],
          ["かれは　こどくを　このむ。"],
          ["こだいぶんめいは　ここで　はんえいした。"],
          ["かれは　このアパートを　かんりしている。"],
          ["かれは　らっかんてきな　ひとだ。"],
          ["さいふを　おとしたので、けいさつに　れんらくした。"],
          ["あしたの　ために　じゅんびする。"],
          ["にほんの　しゅとは　とうきょうだ。"],
          ["ほしの　うごきを　かんさつする。"],
          ["うちゅうでは　じゅうりょくが　かからない。"],
          ["にほんの　れきしを　まなぶ。"],
          ["はさんとは　すべての　ざいさんを　なくすことだ。"]],
         //Group 2
            [["わたしは　こんしゅうの　かようびに　たろうさんと　テニスを　します。"],
             ["ははは、せんしゅう　くにに　かえりました。"],
             ["わたしは　ライしゅう、とうきょうへ　いきます。"],
             ["まいしゅう　つまに　はなを　かいます。"],
             ["あなたは　しゅうまつ、どこかに　いきますか。"],
             ["わたしは　しゅうかんしを　かった。"]],
            //Group 3
            [["きょうは　はちじまでに　かえります。"],
             ["わたしは　まいにち　にほんごを　べんきょうします。"],
             ["パーティーの　にちじを　けっていする。"],
             ["わたしたちは　にちじょうせいかつを　たいせつに　しています。"],
             ["ちかくの　スーパーで　にちようひんを　かいます。"]],
            //Group 4
            [["こんげつから　あたらしい　バイトを　はじめます。"],
             ["ははは、らいげつ　ハノイに　くる　よていです。"],
             ["このみせは、せんげつ　オープンしました。"],
             ["わたしの　げっきゅうは　じゅうまんえんです。"],
             ["バイトりょうの　げつがくは　ごまんえんくらいです。"],
             ["わたしは　げつまつに　きゅうりょうを　うけとった。"]],
            //Group 5
            [["つうしんはんばいを　りようする。"],
             ["がっこうからの　せいせきつうちを　うけとる。"],
             ["かいぎで　つうやくする。"],
             ["きょうから　こうつうあんぜんしゅうかんが　はじまる。"]],
            //Group 6
            [["こどもの　せいぞんを　かくにんする。"],
             ["わたしは　りゅうがくせいとして　にほんで　せいかつしている。"],
             ["だいじしん/おおじしん　で　おおくの  せいめいが　うばわれた。"],
             ["うちゅうひこうしは　ぶじ　せいかんした。"],
             ["むらびとたちは、のうぎょうをしてせいけいをたてている。"]],
            //Group 7
            [["わたしの　せんこうは　にほんぶんがくだ。"],
             ["かれは  ギリシャてつがくの　けんきゅうしゃだ。"],
             ["いがくが　すすみ、にんげんが　ながいき　できるように　なった。"],
             ["かれは  ゆうめいな　すうがくしゃだ。"],
             ["だいがくでは　やくがくを　まなんでいる。"],
             ["かがくと　かがくは　にほんごで　はつおんが　おなじだ。"],
             ["わたしは　だいがくで　しゃかいがくを　まなんだ。"],
             ["せいじがくは　けいざいがく、しゃかいがく、ほうがくなどと　おなじ　しゃかいかがくぶんやに　はいる。"],
             ["がくしゃに　せんもんてきな　いけんを　もとめる。"],
             ["わたしは　かいがいの　がっこうを　そつぎょうした。"],
             ["にほんの　だいがくには　こっこうりつだいがくと　しりつだいがくが　ある。"]],
            //Group 8 国
            [["あたらしい  こくりつげきじょうだ。"],
             ["アフリカに　あたらしい  こっかが　うまれた。"],
             ["あなたの　こくせきは　どこですか。"],
             ["わたしの　せんもんは　こくさいかんけいだ。"],
             ["こくれんは　こくさいれんごうの　りゃくだ。"]],
            //Group 9 反
            [["よびかけても　なんのはんのうも　ない。"],
             ["ファッションは　つねに　そのじだいを　はんえいしていると　いえる。"],
             ["じょうけんはんしゃは　がくしゅうによる　せいぶつがくてき　おうとうである。"],
             ["わたしは　そのたいさくに　はんたいする"],
             ["かれは　こうつういはんで　けいさつに　たいほされた。"],
             ["かれは　じぶんの　わるい　てんを　はんせい　している。"]],
            //Group 10 地
            [["じめんが　ぬれていて、すべりやすいので　きを　つけてください。"],
             ["ちきゅうの　よんぶんの　いちは　りくだ。"],
             ["このビルは　ちかさんがい、ちじょうじっかいだてだ。"],
             ["にほんは  じしんが　おおい。"],
             ["このくにには　おおくの  しっちが　ある。"]],
            
            //Group 11 費
            [["くにが　りゅうがくひようを　ふたんする。"],
             ["じんけんひを　さくげんする。"],
             ["しょくひを　せつやくする。"],
             ["とうきょうまでの　りょひを　けいさんする。"],
             ["にほんの　しりつだいがくは　がくひが　たかい。"],
             ["こうねつひを　せつやくする。"]],
            
            //Group 12 動
            [["きゅうえんかつどうは　かいがいで　おこなわれている。"],
             ["どうしの　つかいかたを　まなぶ。"],
             ["このしまには　おおくの　どうぶつが　いる。"],
             ["がくしゅうには　どうきづけが　ひつようだ。"],
             ["どうしには どうさどうしや　じょうたいどうしなどがある。"]],
            
            //J1 Group 13 鉄
            [["せんはっぴゃくななじゅうにねん、にほんはつの　てつどうが　しんばしと　よこはまの　あいだに　かいつうした。"],
             ["てっきょうは　てつで　できている。"],
             ["してつは　みんかんきぎょうが　うんえいする　てつどうだ。"]],
            
            //Group 14 友
            [["わたしは　きのう　ともだちと　ゲームを　しました。"],
             ["わたしたちは　ゆうじょうで　つながっている。"],
             ["たなかさんは　こどもじだいから　わたしの　しんゆうだ。"],
             ["がくせいのとき、あくゆうと　わたしは　よく　せんせいに　しかられた。"]],
            
            //Group 15
            [["しんごうを　むしするのは　きけんだ。"],
             ["かれは  みなに　しんらいされている。"],
             ["しさいは　しんじゃの　つみの　こくはくを　きいた。"],
             ["ぶっきょうとにとって　しんこうとは、ほとけを　しんじ　うやまうことだ。"]],
            
            //Group 16
            [["わたしは　しょくばの　にんげんかんけいに　くるしんでいる。"],
             ["パーティーにはかなりの人数が集まった。"],
             ["にほんを　おとずれる　がいこくじんの　かずが　ふえた。"],
             ["にほんじんは　あなたのくにに　なんにんぐらい　すんでいますか？"],
             ["あたらしい  えいがの　しゅやくに　しんじんが　えらばれた。"],
             ["じんけんは　にんげんが　もつ　とうぜんの　けんりだ"]],
            
            //Group 17
            [["わたしの　おとうとは　せいじかを　めざしている。"],
             ["ゆうめいな　にほんの　しょうせつかは　だれですか？"],
             ["わたしは　しんねんに　かぞくしゃしんを　とった。"],
             ["わたしは　かでんメーカーに　つとめている。"]]]
    
    var furigana2 =
        //Group 1
        [[["ねっちゅうしょうに　ちゅういしてください。"],
          ["なにか　いけんは　ありますか。"],
          ["おおくの　どういが　えられた。"],
          ["けっかてきに　せいこうだった。"],
          ["わたしは　このけつろんに　まんぞくしていない。"],
          ["このバスの　ねんりょうは　てんねんガスだ。"],
          ["にほんは　ねんりょうを　ゆにゅうしている。"],
          ["けっこん　にじゅうごしゅうねんを　きねんする。"],
          ["このテストの　もんだいは　かこにも　でた。"],
          ["わたしの　ははは　こどくな　じんせいを　おくった。"],
          ["わたしは　こだいの　れきしを　けんきゅうしている。"],
          ["かれは　じこかんりが　ひつようだ。"],
          ["かれは　しょうらいを　らっかんしている。"],
          ["さいがいの　ばあい、ひとびとは　れんらくを　とりあう。"],
          ["じゅんびに　じかんが　かかる。"],
          ["しゅとは　くにの　ちゅうしんだ。"],
          ["こどもたちの　かんさつのうりょくを　チェックする。"],
          ["うちゅうに　どんなせいぶつが　いるのだろう？"],
          ["かっこくには　れきしの　なかで　つくられた　ぶんかが　ある。"],
          ["かれは　あたらしい　かいしゃを　せつりつして　はんとしごに　とうさんした。"]],
         //Group 2
            [["てんきよほうによると、こんしゅうは　しゅうまつにかけて　あめが　ふる　そうだ。"],
             ["てんきよほうによると、こんしゅうは　しゅうまつにかけて　あめが　ふる　そうだ。"],
             ["らいしゅうから　なつやすみが　はじまります。"],
             ["わたしは　まいしゅう　ともだちと　えいがを　みます。"],
             ["わたしは　しゅうまつに　よく　サッカーを　します。"],
             ["このしゅっぱんしゃの　しゅうかんしは　ゆうめいだ。"]],
            //Group 3
            [["わたしは　きょうから　だいがくせいだ。"],
             ["わたしは　まいにち　バスで　えきに　いく。"],
             ["つぎの　かいぎの　にちじを　おしえて　ください。"],
             ["さんぽは　にちじょうてきに　おこなっている。"],
             ["デパートでも　にちようひんを　かうことが　できます。"]],
            //Group 4
            [["こんげつちゅうに　このしごとを　しあげなくてはならない。"],
             ["わたしは　らいげつ　けっこんします。"],
             ["かれは　せんげつ　きこくしました。"],
             ["げっきゅうびは　まいつき　にじゅうごにちです。"],
             ["このアプリの　しようりょうは、げっきゅう　さんびゃくえんです。"],
             ["わたしは　こんげつまつから　いっしゅうかん　しゅっちょうする。　"]],
            //Group 5
            [["このかいしゃでは、つうしんシステムを　かいはつしている。"],
             ["つうちひょうを　おやに　みせる。"],
             ["つうやくの　しごとは　つかれる。"],
             ["わたしは　こうつうじこのために　がっこうに　おくれた。"]],
            //Group 6
            [["うちゅうには　せいめいたいが　せいぞんしている　かのうせいが　ある。"],
             ["かいがいで　ぜいたくな　せいかつを　したい。"],
             ["わたしは　せいめいかがくを　けんきゅう している。"],
             ["とざんの　そうなんしゃの　せいかんを　いのる。"],
             ["そふぼと　どうきょして　せいけいを　ともにする。"]],
            //Group 7
            [["『げんじものがたり』は　にほんの　こてんぶんがくの　さいこうけっさくだ。"],
             ["このけんきゅうは　てつがくと　しゅうきょうがくの　きょうかいを　こえている。 "],
             ["いがくは　てつがくとともに　もっとも　ふるい　がくもんぶんやだと　いわれている。"],
             ["こうこうの　ときから　すうがくが　とくいだった。"],
             ["やくがくぶを　そつぎょうして、やくざいしになった。"],
             ["かれは  ノーベルかがくしょうを　じゅしょうした。"],
             ["あのきょうじゅは　しゃかいがくの　けんきゅう で　ゆうめいだ。"],
             ["かれは　だいがくで　せいじがくを　まなび、こくさいせいじがくしゃに　なった。"],
             ["ゆうめいな　かいがいの　がくしゃが　こうえんに　しょうたいされた。"],
             ["にほんには　しょうがっこう、ちゅうがっこう、こうとうがっこうがある。"],
             ["だいがくを　そつぎょうご、わたしは　だいがくいんしゅうしかていに　すすんだ。"]],
            //Group 8
            [["にほんに　こくりつだいがくは　いくつ　ありますか。"],
             ["しけんに　ごうかくして、こっかこうむいんに　なった。"],
             ["わたしの　こくせきは　ベトナムです。"],
             ["しんとうきょうこくさいくうこうは　ちばけんに　あります。"],
             ["こくれんは　せんきゅうひゃくよんじゅうごねんに　せつりつされた　こくさいきかんだ。"]],
            //Group ９
            [["くすりが　あわなかったらしく　きょぜつはんのうを　おこした。"],
             ["しょうひしゃの　いけんを　はんえいした　しょうひんを　かいはつする。"],
             ["このクリスタルは　ひかりの　はんしゃにより　なないろに　かがやく。"],
             ["かれの　いけんに　さんせいの　ひとは　はんたいの　ひとより　すくない。"],
             ["それは　サッカーの　ルールいはんだ。"],
             ["「はんせい」とは、じぶんの　ことばや　げんどうの　よくなかったてんを　あらためようと　することです。"]],
            //Group 10
            [["じめんに　らくがきを　する。"],
             ["ちきゅうの　まわりを　まわっている。"],
             ["ちじょうから　うちゅうに  むかって　しんごうを　おくる。"],
             ["これは　じしんの　ひがいを　ふせぐための　くんれんだ。"],
             ["しっちは　やさいさいばいには　てきしていない。"]],
            
            //Group 11
            [["このシステムは　ひように　たいして　こうかが　たかい。"],
             ["らいねんどよさんけいかくでは　じんけんひを　みなおすことに　なった。"],
             ["きふきんは　こまっている　ひとびとの　しょくひに　つかわれる。"],
             ["わたしは　りょこうがいしゃに　りょひを　しはらった。"],
             ["わたしは　がくひを　しはらうことが　できなかったので　たいがくした。"],
             ["こうねつひとは、でんきだいや　ガスだいの　ことだ。"]],
            
            //Group 12
            [["ボランティアかつどうに　さんかする。"],
             ["どうしや　めいしなどの　ひんしを　がくしゅうする。"],
             ["どうぶつの　しゃしんを  とる。"],
             ["がいこくごがくしゅうの　どうきに　かんする　おおくの けんきゅうが　ある。"],
             ["ロボットの　どうさを　かくにんしてください。"]],
            
            //Group 13
            [["ほくべいたいりくおうだんてつどうは　じゅうきゅうせいきなかばに　かんせいした。"],
             ["れっしゃが　てっきょうを　わたる。"],
             ["とうきょうには　してつが　たくさん　ある。"]],
            
            //Group 14
            [["かれは　わたしの　ゆうじんの　ひとりだ。"],
             ["わたしは　かれとの　ゆうじょうを　うらぎった。"],
             ["わたしは　こうつうじこで　たいせつな　しんゆうを　うしなった。"],
             ["あなたは　あくゆうと　いっしょに　でかけないほうがいい。"]],
            
            //Group 15
            [["こうつうしんごうのいろは　あか、あお、きいろだ。"],
             ["わたしは　かれを　しんらいして、おかねを　かした。"],
             ["しんじゃは　あるしゅうきょうを　しんこうしている　ひとのことだ。"],
             ["このやまは　むかしから　しんせいなやまとして　しんこうの　たいしょうとなっている。"]],
            
            //Group 16
            [["にんげんは　しゃかいてきな　どうぶつだ。"],
             ["このカウンターは、みせに　きた　ひと　の　にんずうを　じどうてきに　おしえてくれる。"],
             ["がいこくじんを　さべつすることは　ゆるされない。"],
             ["にほんじんは　りょこうするたびに　おみやげを　かう。"],
             ["ことし、わたしの　かいしゃには　さんにんの　しんじんが　はいった。"],
             ["基本的人権は尊重されなければならない。"]],
            
            //Group 17 ReivunJ２
            [["かれは  にほんの　せいじかだ。"],
             ["しょうせつかになるのは　むずかしい。"],
             ["わたしの　かぞくは　ごにんです。"],
             ["かでんせいひんとは　かていで　しようされる　テレビ、れいぞうこ、せんたくきなどを　さす。"]]]
    
    var reibunV1 =
        //Group 1
          [[["Chú ý là cần thiết khi sử dụng máy này."],
            ["Mọi người đều phản đối ý kiến của mình."],
            ["Tôi đồng ý với ý kiến của anh ấy."],
            ["Kết quả của kỳ thi như thế nào?"],
            ["Kết luận của bài trình bày là gì?"],
            ["Đất nước này được ban phước với nguồn tài nguyên thiên nhiên."],
            ["Dầu và khí được cung cấp nhiên liệu."],
            ["Chúng tôi chụp một bức ảnh kỷ niệm."],
            ["Tôi đã học được quá khứ của động từ."],
            ["Anh thích sự cô đơn."],
            ["Nền văn minh cổ đại thịnh vượng ở đây."],
            ["Anh ta đang quản lý căn hộ này."],
            ["Anh ấy lạc quan."],
            ["Tôi bỏ ví và liên lạc với cảnh sát."],
            ["Chuẩn bị cho ngày mai."],
            ["Thành phố thủ đô của Nhật Bản là Tokyo."],
            ["Quan sát chuyển động của các ngôi sao."],
            ["Lực hấp dẫn không diễn ra trong vũ trụ."],
            ["Tìm hiểu về lịch sử Nhật Bản."],
            ["Phá sản là để loại bỏ tất cả sự giàu có."]],
         //Group 2
           [["Tôi chơi tennis với Taro vào thứ ba tuần này."],
            ["Mẹ tôi quay trở lại đất nước tuần trước."],
            ["Tôi sẽ đến Tokyo vào tuần tới."],
            ["Mỗi tuần tôi sẽ mua hoa cho vợ tôi."],
            ["Bạn sẽ đi đâu đó vào cuối tuần?"],
            ["Tôi đã mua một tạp chí hàng tuần."],
            ["Tôi đã mua một tạp chí hàng tuần."]],
         //Group 3
           [["Hôm nay tôi sẽ trở lại lúc 8 giờ."],
            ["Tôi học tiếng Nhật mỗi ngày."],
            ["Xác định ngày và giờ của bên."],
            ["Chúng tôi coi trọng cuộc sống hàng ngày của mình."],
            ["Mua nhu yếu phẩm hàng ngày tại siêu thị gần đó."]],
         //Group 4
           [["Bắt đầu một byte mới từ tháng này."],
            ["Mẹ tôi sẽ đến Hà Nội vào tháng tới."],
            ["Cửa hàng này vừa mới mở vào tháng trước."],
            ["Tiền lương hàng tháng của tôi là 100.000 yên."],
            ["Phí hàng tháng cho phí byte là khoảng 50.000 yên."],
            ["Tôi đã nhận được một mức lương vào cuối tháng."]],
         //Group 5
           [["Sử dụng đơn đặt hàng qua mạng thông tín."],
            ["Nhận thông báo về kết quả từ trường."],
            ["Thông dịch tại cuộc họp."],
            ["Tuần an toàn giao thông bắt đầu từ hôm nay."]],
         //Group 6
           [["Xác nhận sự sống còn của đứa trẻ."],
            ["Nước này sản xuất dầu."],
            ["Anh ấy là một học sinh chăm chỉ."],
            ["Khoa ngoại ngữ có nhiều inh viên nữ hơn sinh viên nam."],
            ["Tôi đã sống ở Nhật Bản trong 4 năm với tư cách là du học sinh."]],
         //Group 7
           [["Chuyên ngành của tôi là văn học Nhật Bản."],
            ["Ông ấy là nhà nghiên cứu triết học Hi Lạp."],
            ["Cùng vơi sự tiến bộ của y học, con người cũng có thể sống lâu hơn."],
            ["Ông là một nhà toán học nổi tiếng."],
            ["Tôi đang học dược tại trường đại học."],
            ["Hóa học và khoa học có cùng cách phát âm bằng tiếng Nhật. "],
            ["Tôi học xã hội học ở trường đại học."],
            ["Khoa học chính trị đi vào cùng lĩnh vực khoa học xã hội như kinh tế học, xã hội học, luật."],
            ["Yêu cầu một học giả cho ý kiến chuyên gia."],
            ["Tôi tốt nghiệp trường nước ngoài."],
            ["Các trường đại học Nhật Bản có các trường đại học công lập quốc gia và các trường đại học tư."]],
         //Group 8
           [["Đây là Nhà hát Quốc gia mới."],
            ["Một quốc gia mới được sinh ra ở châu Phi."],
            ["Quốc tịch của bạn ở đâu?"],
            ["Chuyên môn của tôi là quan hệ quốc tế."],
            ["Liên Hợp Quốc là viết tắt của Liên Hiệp Quốc."]],
         //Group 9
           [["Gọi nhưng không có phản ứng gì."],
            ["Thời trang thường phản ảnh thời đại đó."],
            ["Phản xạ có điều kiện là phản ứng sinh học bằng cách học."],
            ["Tôi phản đối biện pháp đó."],
            ["Anh ta bị cảnh sát bắt vì vi phạm giao thông."],
            ["Anh ấy đang phản ánh về điểm xấu của mình."]],
         //Group 10
           [["Mặt đất rất trơn, dễ trượt ngã nên hãy cẩn thận."],
            ["Một phần từ trái đất là lục địa."],
            ["Tòa nhà này có 3 tầng hầmvà 10 tầng trên mặt đất."],
            ["Có rất nhiều trận động đất ở Nhật Bản."],
            ["Có nhiều vùng đất ngập nước ở đất nước này."]],
            
        //Group 11
           [["Đất nước sẽ chịu chi phí du học."],
            ["Giảm chi phí nhân sự."],
            ["Tiết kiệm chi phí ăn uống."],
            ["Tính chi phí đi lại đến Tokyo."],
            ["Các trường đại học tư nhân của Nhật Bản có học phí cao."],
            ["Tiết kiệm chi phí tiện ích."]],
            
        //Group 12
           [["Các hoạt động cứu trợ được tiến hành ở nước ngoài."],
            ["Học cách sử dụng động từ."],
            ["Có rất nhiều loài động vật trên hòn đảo này."],
            ["Động lực là cần thiết cho việc học."],
            ["Động từ bao gồm động từ hành động và động từ trạng thái."]],
            
        //Group 13
           [["Năm 1872, đường sắt đầu tiên của Nhật Bản mở cửa giữa Shinbashi và Yokohama."],
            ["Cầu sắt được làm bằng sắt."],
            ["Đường sắt tư nhân là một tuyến đường sắt do một công ty tư nhân điều hành."]],
            
        //Group 14
           [["Tôi đã chơi một trò chơi với bạn bè của tôi hôm qua."],
            ["Chúng tôi được kết nối bởi tình bạn."],
            ["Ông Tanaka là bạn thân nhất của tôi từ khi còn nhỏ."],
            ["Người bạn xấu của tôi và tôi thường bị thầy giáo mắng khi tôi còn là sinh viên."]],
            
        //Group 15
           [["Bỏ qua tín hiệu là nguy hiểm."],
            ["Ông được mọi người tin tưởng."],
            ["Vị linh mục lắng nghe lời tỏ tình của lời thú nhận của người tin Chúa."],
            ["Đức tin cho Phật tử là tin và kính trọng Đức Phật."]],
            
        //Group 16
           [["Tôi đau khổ cho mối quan hệ của con người trong công việc."],
            ["Một số lượng đáng kể mọi người tụ tập tại bữa tiệc."],
            ["Số lượng người nước ngoài đến thăm Nhật Bản đã tăng lên."],
            ["Có bao nhiêu người Nhật sống ở đất nước của bạn?"],
            ["Một người mới được chọn làm nhân vật chính trong một bộ phim mới."],
            ["Nhân quyền là quyền tự nhiên của con người."]],
            
        //Group 17
           [["Em trai tôi đang nhắm vào các chính trị gia."],
            ["Ai là một tiểu thuyết gia nổi tiếng người Nhật?"],
            ["Tôi chụp ảnh gia đình trong năm mới."],
            ["Tôi làm việc cho các nhà sản xuất điện tử gia đình."]]]

    
    var reibunV2 =
        //Group 1
          [[["Hãy chú ý đến đột quỵ nhiệt."], //1
            ["Bạn có ý kiến ​​gì không?"],//2
            ["Đã có nhiều sự đồng ý."],//3
            ["Kết quả là nó thành công."],//4
            ["Tôi không hài lòng với kết luận này."],//5
            ["Nhiên liệu cho xe buýt này là khí thiên nhiên."],//6
            ["Nhật Bản nhập khẩu nhiên liệu."],//7
            ["Kỷ niệm 25 năm kết hôn."],//8
            ["Vấn đề của bài kiểm tra này cũng đã xuất hiện trong quá khứ."],//9
            ["Mẹ tôi đã gửi một cuộc sống cô đơn."],//10
            ["Tôi đang nghiên cứu lịch sử của thời cổ đại."],//11
            ["Anh ấy cần tự quản lý."],//12
            ["Anh ta lạc quan về tương lai."],//13
            ["Trong trường hợp thiên tai, mọi người giữ liên lạc."],//14
            ["Phải mất thời gian để chuẩn bị."],//15
            ["Thủ đô là trung tâm của đất nước."],//16
            ["Kiểm tra khả năng quan sát của trẻ em."],//17
            ["Những sinh vật nào trong vũ trụ?"],//18
            ["Mỗi quốc gia có một nền văn hóa được thực hiện trong lịch sử."],//19
            ["Ông bị phá sản trong sáu tháng sau khi ông thành lập một công ty mới."]],//20
        //Group 2
           [["Theo dự báo thời tiết, có vẻ như trời sẽ mưa vào cuối tuần này."],
            ["Ngôi trường đã bị đóng cửa do mưa lớn hôm thứ Sáu tuần trước."],
            ["Kỳ nghỉ hè bắt đầu vào tuần tới."],
            ["Tôi xem phim với bạn bè mỗi tuần."],
            ["Tôi thường chơi bóng đá vào cuối tuần."],
            ["Tạp chí hàng tuần của nhà xuất bản này nổi tiếng."],
            ["Tạp chí hàng tuần của nhà xuất bản này nổi tiếng."]],
        //Group 3
           [["Tôi là sinh viên đại học từ hôm nay."],
            ["Tôi đi đến nhà ga bằng xe buýt mỗi ngày."],
            ["Vui lòng cho tôi biết ngày và giờ của cuộc họp tiếp theo."],
            ["Tôi đi bộ hàng ngày."],
            ["Ngay cả ở các cửa hàng bách hóa, bạn có thể mua các vật dụng hàng ngày."]],
        //Group 4
           [["Tôi phải hoàn thành công việc này trong tháng."],
            ["Tôi sẽ kết hôn vào tháng tới."],
            ["Anh ấy quay trở lại đất nước hồi tháng trước."],
            ["Ngày thanh toán hàng tháng là ngày 25 hàng tháng."],
            ["Lệ phí hàng tháng cho việc sử dụng ứng dụng này là 300 yên."],
            ["Tôi đang đi công tác từ cuối tháng trong một tuần."]],
        //Group 5
           [["Công ty này phát triển một hệ thống thông tin liên lạc."],
            ["Cho cha mẹ xem bảng thông báo từ trường."],
            ["Mệt mỏi với công việc thông dịch."],
            ["Tôi đã đến trường muộn vì tai nạn giao thông."]],
        //Group 6
           [["Có khả năng các dạng sống tồn tại trong vũ trụ."],
            ["Sản xuất lúa gạo nổi tiếng ở đây."],
            ["Dạy tiếng Anh cho học sinh trung học cơ sở."],
            ["Tôi đã chơi các môn thể thao khác nhau trong thời học sinh."],
            ["Tôi muốn sống một cuộc sống xa hoa ở nước ngoài."]],
        //Group 7
           [["Truyện Genji là 1 kiệt tác văn học cổ điển của Nhật Bản."],
            ["Nghiên cứu này nằm ngoài ranh giới giữa triết học và tôn giáo."],
            ["Y học được coi là lĩnh vực học thuật lâu đời nhất với triết học."],
            ["Toán học tốt ở trường trung học."],
            ["Tôi tốt nghiệp Khoa Khoa học Dược phẩm và trở thành dược sĩ."],
            ["Ông được trao giải Nobel Hóa học."],
            ["Giáo sư đó nổi tiếng với các nghiên cứu xã hội học."],
            ["Ông học ngành khoa học chính trị tại trường đại học và trở thành một nhà khoa học chính trị quốc tế."],
            ["Một học giả nước ngoài nổi tiếng được mời đến để thuyết trình."],
            ["Có trường tiểu học, trung học cơ sở, trường trung học ở Nhật Bản."],
            ["Sau khi tốt nghiệp đại học, tôi đã theo học khóa thạc sĩ sau đại học."]],
        //Group 8
           [["Có bao nhiêu trường đại học quốc gia ở Nhật Bản?"],
            ["Sau khi vượt qua kỳ thi, tôi đã trở thành một công chức quốc gia."],
            ["Quốc tịch của tôi là người Việt Nam."],
            ["Sân bay quốc tế Tokyo mới nằm ở quận Chiba."],
            ["Liên Hợp Quốc là một tổ chức quốc tế được thành lập vào năm 1945."]],
        //Group 9
           [["Hình như là không hợp thuốc nên đã gây ra phản ứng kháng thuốc."],
            ["Phát triển những sản phẩm phản ánh mong muốn của người tiêu dùng."],
            ["Pha lê này phát sáng bảy mầu do phản xạ ánh sáng."],
            ["Số người tán thành ý kiến của anh ấy ít hơn số người phản đối."],
            ["Đó là một sự vi phạm các quy tắc bóng đá."],
            ["Phản chiếu là hành vi của riêng bạn."]],
        //Group 10
           [["Làm scribbles trên mặt đất."],
            ["Mặt trăng quay quanh trái đất."],
            ["Gửi tín hiệu từ mặt đất về phía vũ trụ."],
            ["Đây là một đào tạo để ngăn chặn thiệt hại của trận động đất."],
            ["Đất ngập nước không thích hợp cho trồng rau."]],
            
        //Group 11
           [["Hệ thống này hiệu quả về chi phí."],
            ["Trong kế hoạch ngân sách năm tài chính tiếp theo, chi phí nhân sự sẽ được xem xét."],
            ["Quyên góp được sử dụng cho chi phí thực phẩm cho những người có nhu cầu."],
            ["Tôi đã trả chi phí đi lại của đại lý du lịch."],
            ["Tôi bỏ học vì tôi không thể trả học phí."],
            ["Chi phí tiện ích là chi phí điện, gas và nước."]],
            
        //Group 12
           [["Tham gia vào các hoạt động tình nguyện."],
            ["Tìm hiểu các phần của lời nói như động từ và danh từ."],
            ["Chụp ảnh động vật."],
            ["Có rất nhiều nghiên cứu về động lực cho việc học ngoại ngữ."],
            ["Kiểm tra hoạt động của robot."]],
            
        //Group 13
           [["Tuyến đường sắt Bắc Mỹ được hoàn thành vào giữa thế kỷ 19."],
            ["Con tàu đi qua cây cầu sắt."],
            ["Có rất nhiều tuyến đường sắt tư nhân ở Tokyo."]],
            
        //Group 14
           [["Anh ấy là một trong những người bạn của tôi."],
            ["Tôi đã phản bội tình bạn của anh ấy với anh ấy."],
            ["Tôi đã mất những người bạn quý giá của mình trong một vụ tai nạn giao thông."],
            ["Bạn tốt hơn không nên đi chơi với những người bạn xấu."]],
            
        //Group 15
           [["Màu tín hiệu giao thông có màu đỏ, xanh dương và xanh lục."],
            ["Tôi tin tưởng anh ta và cho vay tiền."],
            ["Người tin Chúa nói đến người tin vào tôn giáo."],
            ["Ngọn núi này từ lâu đã là mục tiêu của đức tin như một ngọn núi thiêng liêng."]],
            
        //Group 16
           [["Con người là động vật xã hội."],
            ["Cái máy đếm này đếm tự động số người tới cửa hàng."],
            ["Nó không bao giờ được phép phân biệt đối xử với người nước ngoài."],
            ["Người Nhật mua quà lưu niệm mỗi khi họ đi du lịch."],
            ["Năm nay công ty của tôi có ba người mới đến."],
            ["Quyền con người cơ bản phải được tôn trọng."]],
            
        //Group 17
           [["Anh ấy là Anh ấy là một chính trị gia Nhật Bản.một chính khách tốt."],
            ["Thật khó để trở thành một tiểu thuyết gia."],
            ["Gia đình tôi là năm người."],
            ["Điện tử gia dụng dùng để chỉ tivi, tủ lạnh, máy giặt, vv được sử dụng ở nhà."]]]

        

//ローカライズ

    @IBOutlet weak var QSelect: UILabel!
    @IBOutlet weak var toInstruction: UIButton!
    @IBOutlet weak var ToSupportSite: UIButton!
    
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
        
        
        QSelect.text = "\(NSLocalizedString("QSelect", comment: ""))"
        //復習リストのボタンを以下に置き換えて、ローカライズ
        ToRevisionList.setTitle("\(NSLocalizedString("ToRevisionList", comment: ""))", for:UIControl.State.normal)
       
        toInstruction.setTitle("\(NSLocalizedString("toInstruction", comment: ""))", for:UIControl.State.normal)
        // 行間の変更(正確には行自体の高さを変更している。)
        let lineHeight:CGFloat = 40.0
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.minimumLineHeight = lineHeight
        paragraphStyle.maximumLineHeight = lineHeight
        let attributedText = NSMutableAttributedString(string: QSelect.text!)
        attributedText.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attributedText.length))
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
        //セルの行数を変える ＝折り返し処理
        cell.textLabel?.lineBreakMode = NSLineBreakMode.byCharWrapping
        //セルの行数指定を外し（０）、複数行にできるようにする
        cell.textLabel?.numberOfLines = 0
        // 文字色変更
        cell.textLabel?.textColor = UIColor.init(red: 64/255, green: 131/255, blue: 174/255, alpha: 1)
        //文字の大きさを変える
        let height = UIScreen.main.bounds.size.height
        //general設定
        cell.textLabel!.font = UIFont.boldSystemFont(ofSize: 20)
        //iPhone の文字の大きさ設定
        
        if height <= 900 {
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
        case 10:
            cell.textLabel!.text = "Group \(indexPath.row + 1)   \(NSLocalizedString("QSG11", comment: ""))"
        case 11:
            cell.textLabel!.text = "Group \(indexPath.row + 1)   \(NSLocalizedString("QSG12", comment: ""))"
        case 12:
            cell.textLabel!.text = "Group \(indexPath.row + 1)   \(NSLocalizedString("QSG13", comment: ""))"
        case 13:
            cell.textLabel!.text = "Group \(indexPath.row + 1)   \(NSLocalizedString("QSG14", comment: ""))"
        case 14:
            cell.textLabel!.text = "Group \(indexPath.row + 1)   \(NSLocalizedString("QSG15", comment: ""))"
        case 15:
            cell.textLabel!.text = "Group \(indexPath.row + 1)   \(NSLocalizedString("QSG16", comment: ""))"
        case 16:
            cell.textLabel!.text = "Group \(indexPath.row + 1)   \(NSLocalizedString("QSG17", comment: ""))"
        case 17:
            cell.textLabel!.text = "Group \(indexPath.row + 1)   \(NSLocalizedString("QSG18", comment: ""))"
            
            
            
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
   //押された時にSafariを起動する
    @IBAction func toSupportSite(_ sender: Any) {
        let url = NSURL(string:"https://www.kanetsugo.com/")
        let app:UIApplication = UIApplication.shared
        app.canOpenURL(url! as URL)
        app.open(url! as URL, options: convertToUIApplicationOpenExternalURLOptionsKeyDictionary([:]), completionHandler: nil)
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
            ViewController.reibunV1 = reibunV1[sender as!Int]
            ViewController.reibunJ2 = reibunJ2[sender as!Int]
            ViewController.reibunV2 = reibunV2[sender as!Int]
            ViewController.furigana1 = furigana1[sender as!Int]
            ViewController.furigana2 = furigana2[sender as!Int]
            
            ViewController.cellNumber = sender as!Int
            ViewController.hiddenFlag = true
            
            
        }
        
    }
    
}


// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertToUIApplicationOpenExternalURLOptionsKeyDictionary(_ input: [String: Any]) -> [UIApplication.OpenExternalURLOptionsKey: Any] {
	return Dictionary(uniqueKeysWithValues: input.map { key, value in (UIApplication.OpenExternalURLOptionsKey(rawValue: key), value)})
}
