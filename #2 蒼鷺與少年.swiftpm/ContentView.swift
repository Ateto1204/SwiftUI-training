import SwiftUI
import AVKit

struct ContentView: View {
    var body: some View {
        ZStack {
            IntroView().background
            Staffs_List()
                .background(IntroView().background)
        }
    }
}

struct Staff {
    let image: String
    let name: String
    let intro: String
    let url: String
    
    init(image: String, name: String, intro: String, url: String) {
        self.image = image
        self.name = name
        self.intro = intro
        self.url = url
    }
    
    init(image: String, name: String, intro: String) {
        self.image = image
        self.name = name
        self.intro = intro
        self.url = "null"
    }
}
extension Staff {
    static let demoStaff = Staff(image: "吉卜力", name: "吉卜力", intro: "Hello World!")
}

struct StaffRow: View {
    let staff: Staff
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .stroke(lineWidth: 5)
                    .frame(width: 90, height: 100)
                    .foregroundColor(.yellow)
                Image(staff.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 90, height: 90)
                    .clipShape(Circle())
            }
            Text(staff.name)
                .foregroundColor(.white)
        }
    }
}

struct Staffs_List: View {
    @State public var number = 0
    let staffs = [
        Staff(image: "Movie", name: "蒼鷺與少年", intro: "《蒼鷺與少年》（日語：君たちはどう生きるか，英語：The Boy and the Heron）是一部2023年上映的日本動畫電影，由宮崎駿執導兼編劇，吉卜力工作室所製作。靈感來自小說家吉野源三郎在1937年發表的同名著書，電影劇情為原創，講述因為太平洋戰爭喪母的少年牧眞人與一隻會說話的蒼鷺相遇，展開不可思議的探索旅程。\n\n電影於2023年7月14日在日本院線上映，同時是吉卜力工作室少數未釋出預告片和劇照便直接在院線上映的電影。這部電影在日本國內獲得的評價普遍兩極，動畫視覺效果、製作、音樂、美術為評論家稱讚的焦點，但同時也有部份評論認為故事偏向艱澀不易理解、配音演出難以讓人融入情境。電影在日本上映首日便突破4億日圓。電影賣座的同時帶動吉野源三郎同名著書的銷售量和再版，平裝本也大量出現在跳蚤市場應用程序上。", url: "電影預告"), 
        Staff(image: "吉卜力", name: "吉卜力", intro: "吉卜力工作室（日語：スタジオジブリ）是一家位於日本東京都小金井市的動畫工作室，為日本動畫協會成員之一、日本電視台子公司。該工作室於1985年6月成立，由動畫導演宮崎駿、高畑勳，德間書店的編輯鈴木敏夫及社長德間康快等人所創辦，目的是作為宮崎駿與高畑勳兩人能夠方便製作動畫片的場所。吉卜力一開始的場所位置是在日本東京都吉祥寺一帶，1992年搬遷到東京都小金井市裡。工作室起初是隸屬於德間書店集團下一員，2005年成為獨立公司。\n\n所推出的動畫電影作品是以高品質、細膩著稱，在全球最高日本動畫電影票房前十名當中，吉卜力的作品便包辦其中六項。吉卜力的作品也常囊括日本海內外各項電影大獎，其中在2001年推出的《神隱少女》不僅是日本首部奪下奧斯卡最佳動畫片獎的動畫，達300億日圓以上的總票房成績在日本票房紀錄中曾有將近二十年的時間作為榜首，直至2020年年末期間才被ufotable動畫工作室推出的《鬼滅之刃劇場版 無限列車篇》給超越。\n\n         除了創作動畫電影之外，吉卜力的業務也包含廣告動畫製作、真人影片拍攝、數款電子遊戲的美術設計，以及動畫作品的影視產品、CD唱片、相關周邊書籍的出版。吉卜力是在1996年期間與華特迪士尼日本分公司合作，讓對方提供在出版影音產品方面的協助，以及進入日本海外國際市場的策略。\n\n在成為日本海內外大眾娛樂文化裡具影響力的工作室之一後，以吉卜力為主題的建物設施除了有2001年在三鷹市成立的三鷹之森吉卜力美術館之外，相關遊樂場所吉卜力公園則是預計在2022年於愛知縣的愛·地球博記念公園裡開幕。"), 
        Staff(image: "宮崎駿", name: "宮崎駿", intro: "宮崎駿（日語：宮﨑 駿／みやざき はやお Miyazaki Hayao，1941年1月5日—）是日本動畫師、動畫導演、及漫畫家。畢業於杉並區立永福小學校、杉並區立大宮中學校、東京都立豐多摩高等學校及學習院大學政治經濟學院。大學畢業後踏入動畫製作工作，日後成為日本知名動畫廠吉卜力工作室的核心人物之一。其執導過11部長篇動畫電影，多次宣布退休，2013年9月時是第7次宣布退休，2016年再度復出。現任吉卜力工作室董事、德間紀念動畫文化財團理事長、三鷹市立動畫美術館館長。目前居住於埼玉縣所澤市。"), 
        Staff(image: "米津玄師", name: "米津玄師", intro: "米津玄師（日語：米津 玄師／よねづ けんし Yonezu Kenshi；1991年3月10日—），是出生於日本德島縣的男性音樂家、創作歌手、插畫家、攝影師、舞者，為近年日本流行音樂的代表歌手之一。\n\n         米津玄師在2009年左右開始以「Hachi（ハチ）」的名義在網際網路發表以VOCALOID製作的音樂，其後在2012年以專輯《diorama》出道。2016年他從環球音樂轉投日本索尼音樂旗下，其後發表的專輯《BOOTLEG》大獲成功，不僅獲得了日本唱片大賞的優秀專輯獎，在商業上亦取得不俗的成績。2018年發售的第八張單曲《Lemon》作爲日劇《UNNATURAL》的主題曲，全球的實體與數位數量超過300萬張，並連續兩年位列日本Billboard Japan Hot 100排行榜榜首，為米津玄師的代表作。此曲的MV在Youtube上的瀏覽量超越8億次，為日本國內最多瀏覽次數的影片之一。在2020年發行的第五張專輯《STRAY SHEEP》位列IFPI全球銷量榜第7名，爲日本歌手最高紀錄。", url: "Lemon"), 
        Staff(image: "久石讓", name: "久石讓", intro: "久石讓（日語：久石 譲／ひさいし じょう Hisaishi Jō，1950年12月6日—），本名藤澤守（藤澤 守／ふじさわ まもる Fujisawa Mamoru），是日本作曲家、編曲家、指揮家、鋼琴家。長野縣中野市出生，國立音樂大學作曲科畢業。其女兒麻衣為歌手。\n\n藝名「久石讓」名稱源自他的偶像——美國黑人音樂家及製作人昆西·瓊斯。他選用與「昆西·瓊斯」發音相近的漢字「久石讓」（Kuishi Jō），再將「久石」由音讀改為訓讀，就變成了現在的藝名（Hisaishi Jō）。\n\n個人主要音樂活動以創作電影配樂為主，特別是宮崎駿、北野武、大林宣彥等導演的作品。在2015年前久石讓曾八度獲得日本電影金像獎最佳音樂獎，及七度獲得日本電影金像獎音樂獎，並於2009年獲得日本政府授予紫綬褒章。\n\n除了電影配樂，久石讓亦致力於古典音樂創作，樂種包括交響曲、協奏曲、弦樂四重奏以及其他簡約主義樂曲。其中較著名的作品有《第五維度》與《Orbis》，分別向貝多芬《第五號交響曲：命運》與《第九號交響曲：合唱》致敬。"), 
        Staff(image: "木村拓哉", name: "木村拓哉", intro: "木村拓哉（日語：木村 拓哉／きむら たくや Kimura Takuya，1972年11月13日—）是日本歌手、演員、配音員，已解散的日本偶像團體SMAP的前成員。東京都出生，經紀公司為傑尼斯事務所。2000年時與歌手工藤靜香結婚，並分別於2001年和2003年生下木村心美與木村光希兩個女兒。\n\n木村拓哉主演的連續劇如《長假》、《戀愛世代》、《美麗人生》及《HERO》等作品受到觀眾喜愛，歷年來是月九劇收視的保證。")
    ]
    var body: some View {
        ScrollView {
            ScrollView (.horizontal, showsIndicators: false) {
                Spacer()
                HStack {
                    Spacer()
                    ForEach(staffs.indices) { index in
                        Button {
                            number = index
                        } label: {
                            StaffRow(staff: staffs[index])
                        }
                    }
                }
            }
            .listStyle(PlainListStyle())
            .background(IntroView().background)
            Text(staffs[number].name)
                .font(.largeTitle)
                .bold()
                .foregroundColor(.white)
            Image(staffs[number].image)
                .resizable()
                .scaledToFit()
                .frame(height: 300)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            Text("關於_\(staffs[number].name)：\n\n" + staffs[number].intro)
                .foregroundColor(.white)
                .padding(EdgeInsets(top: 20, leading: 20, bottom: 20,trailing: 20))
            if staffs[number].url != "null" {
                VideoPlayer(player: AVPlayer(url: Bundle.main.url(forResource: staffs[number].url, withExtension: "mp4")!))
                    .frame(width: 500, height: 300)
                    .padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
            }
        }
        .listStyle(PlainListStyle())
        .background(IntroView().background)
    }
}

struct Staffs_List_Preview: PreviewProvider {
    static var previews: some View {
        Staffs_List()
            .previewLayout(.sizeThatFits)
    }
}
