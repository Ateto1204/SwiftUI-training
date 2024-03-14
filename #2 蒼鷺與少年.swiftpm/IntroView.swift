import SwiftUI
import AVFoundation
import AVKit

struct IntroView: View {
    let background = Color(red: 121/255, green: 205/255, blue: 205/255)
    var body: some View {
        TabView {
            NavigationStack {
                CharList()
            }
            .tabItem {
                Label("Characters", systemImage: "person.fill")
            }
            
            ContentView()
            .tabItem {
                Label("Staffs", systemImage: "person.2.badge.gearshape.fill")
            }
            
            PlotView()
            .tabItem {
                Label("Plot", systemImage: "book")
            }
        }
    }
}

struct Music: View {
    @State public var looper: AVPlayerLooper?
    @State public var player = AVQueuePlayer()
    var body: some View {
        Text("")
            .onAppear {
                let url = Bundle.main.url(forResource: "地球儀", withExtension: "mp4")!
                let playerItem = AVPlayerItem(url: url)
                self.looper = AVPlayerLooper(player: player, templateItem: playerItem)
                player.play()
            }
    }
}

struct PlotView: View {
    var body: some View {
        ZStack {
            IntroView().background
            VStack {
                Text("自己去電影院看＝＝")
                    .bold()
                    .foregroundColor(.white)
                VideoPlayer(player: AVPlayer(url: Bundle.main.url(forResource: "電影解析", withExtension: "mp4")!))
                    .frame(width: 500, height: 300)
                    .padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
            }
        }
    }
}

struct Char {
    let image: String
    let name: String
    let vol: String
    let intro: String
}
extension Char {
    static let demoChar = Char(image: "真人", name: "牧真人", vol: "山時聰真", intro: "Hello World!")
    
}

struct CharRow: View {
    let char: Char
    var body: some View {
        NavigationStack {
            NavigationLink {
                CharIntro(char: char)
            } label: {
                HStack {
                    Image(char.image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                    VStack (alignment: .leading) {
                        Text(char.name)
                            .font(.largeTitle)
                            .foregroundColor(.white)
                        Text("vol. " + char.vol)
                            .foregroundColor(.white)
                    }
                    Spacer()
                }
                .toolbar(content: {
                    ToolbarItem(placement: .principal) {
                        Text("人物介紹")
                            .bold()
                            .foregroundColor(.white)
                    }
                })
                .background(IntroView().background)
            }
        }
    }
}

struct CharRow_Previews: PreviewProvider {
    static var previews: some View {
        CharRow(char: .demoChar)
            .previewLayout(.sizeThatFits)
    }
}

struct CharIntro: View {
    let char: Char
    var body: some View {
        ZStack {
            IntroView().background
            List {
                Image(char.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 300)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .listRowBackground(IntroView().background)
                Text(char.name)
                    .font(.title)
                    .foregroundColor(.white)
                    .listRowBackground(IntroView().background)
                Text("聲優：" + char.vol)
                    .foregroundColor(.white)
                    .listRowBackground(IntroView().background)
                VStack (alignment: .leading, spacing: 10) {
                    Text("人物介紹：")
                        .foregroundColor(.white)
                    Text(char.intro)
                        .foregroundColor(.white)
                }
                .listRowBackground(IntroView().background)
            }
            .listStyle(PlainListStyle())
            .background(IntroView().background)
        }
        .toolbar(content: {
            ToolbarItem(placement: .principal) {
                Text(char.name)
                    .bold()
                    .foregroundColor(.white)
            }
        })
        .background(IntroView().background)
    }
}

struct CharList: View {
    let chars = [
        Char(image: "真人", name: "牧真人", vol: "山石聰真", intro: "本作主角，生於昭和時代的少年，故事開始時因為太平洋戰爭的空襲失去母親久子，由於父親與久子的妹妹夏子再婚，遷移至母親家族的所在地。經歷生活不順遂時偶遇蒼鷺，展開連串的奇幻冒險經歷。角色設計原型取材自宮崎駿的兒少時期，因為戰爭影響舉家從城市搬遷鄉下地區也是取材自宮崎駿的親身經歷。\n\n心理學家佛洛依德解釋意識與潛意識的關係，「本我」代表慾望、潛意識；「超我」是良知或內在的道德判斷；「自我」就是現實世界中執行事情的那個我。\n\n電影對話裡蒼鷺跟真人說：「我不是你夥伴也不是敵人」，後來霧子也對蒼鷺與真人說：「你們兩個頻率真像」，種種推理來看，真人跟蒼鷺就是同個人，都代表著「自己」。只是蒼鷺代表了不受世俗控制的「本我」，真人代表「自我」，舅公則代表「超我」。"), 
        Char(image: "蒼鷺", name: "蒼鷺", vol: "菅田將暉", intro: "本作關鍵角色，會說話的蒼鷺，引導真人在夢境與「下界」展開冒險。在鳥的外型下隱藏著一張擁有大鼻子、禿頭的男性容貌，時爾以鳥和人的姿態現身。在電影一開始似於反派而在跟真人一同進入「下界」後又變成真人的同伴，協助真人尋找夏子。\n\n藉由心理學家佛洛伊德解釋意識與潛意識的關係，以及電影對話中霧子對真人說他和蒼鷺頻率真像，而推論出真人和蒼鷺其實是同一個人，其中蒼鷺則代表著不受世俗控制的「本我」。"), 
        Char(image: "火美", name: "火美", vol: "Aimyon", intro: "真人在「下界」偶遇的少女，後期揭曉為年輕時的久子。在中文電影手冊版的名字譯為「火美」。\n\n火美本名為牧久子，是真人的母親、夏子的姊姊，於太平洋戰爭期間死於空襲；在這部電影中，媽媽代表著「原本的信念」，而電影一開始媽媽就沒了，象徵原本的信念被摧毀。久子在生前預留一本《你想活出怎樣的人生》給真人，真人翻閱時不停掉淚，從而踏上冒險之路。這一幕就是在說過的太累，內心的本我（蒼鷺）不停來干擾你，你活得手忙腳亂，偶然間想起原本的信念，靜下心捫心自問，你現在成為你想要成為的樣子了嗎？好像沒有，因此你流淚，也決定開始追尋自我。"), 
        Char(image: "夏子", name: "牧夏子", vol: "木村佳乃", intro: "真人的阿姨兼繼母，久子的妹妹。與勝一結婚初期，因為真人不願接受她產生隔閡，後來被捲入「下界」的相關事件，最終與真人消弭隔閡。結局時與勝一育有一子。而在電影中，夏子則為在久子死後（原本的信念破滅）作為新的心念。"), 
        Char(image: "霧子", name: "霧子", vol: "柴咲幸", intro: "服侍真人、久子、夏子家族成員的女僕，容貌與名字與下界的掌船者相似。\n\n霧子婆婆就像是身邊與你最親近的人，她害怕負面的你，卻又擔心失去信念的你深陷內心的深淵，於是她陪著你探索你的內心，試著傾聽了解你；而鵜鶘代表著「外界的壓力」，將你推向墳墓的大門，壓的你喘不過氣；年輕的霧子代表著最親近的人的正能量，為你趕跑那些壓力，在你深陷其中時拉你一把，跟你分享她曾經也有傷疤，那些都會好起來，「大浪過後，就會風平浪靜」。"), 
        Char(image: "父親", name: "牧勝一", vol: "木村拓哉", intro: "真人的父親，故事開始時是工廠營業者，在妻子久子過身後，迎娶久子的妹妹夏子作為續弦。角色設計參考原型為宮崎駿的父親。"), 
        Char(image: "Parrot", name: "鸚鵡", vol: "國村隼", intro: "在電影中於「下界」中以群體方式出現，且有一名領導者，在電影中鸚鵡們欲圖併吞整個「下界」，同時鸚鵡代表著「自己給自己的壓力」，他們總是觀察著真人與火美，當他們在尋找新的信念（夏子）時，又害怕的跑出來阻止真人。反映出在失去原本信念，在群找新的信念前，最大的壓力來源通常都來自於自己。"), 
        Char(image: "Pelican", name: "鵜鶘", vol: "小林薰", intro: "在電影中於「下界」中以群體方式出現，第一次為將真人推入名為「學我者則死」的墳墓大門，第二次則為在哇啦哇啦飄到空中準備投胎時出現並捕食哇啦哇啦，而在被火美驅趕後，其中一隻因火美魔法受重傷的鵜鶘與真人對話，並告訴真人他們並非自願來到「下界」，而會捕食哇啦哇啦是因為「下界」糧食極少，不得已只好捕食哇啦哇啦。"), 
        Char(image: "Walawala", name: "哇啦哇啦", vol: "", intro: "以小精靈的樣貌出現，並以飄上天際來投胎轉世，在電影中當哇啦哇啦飄到空中後會有鵜鶘來捕食哇啦哇啦，而這時火美會過來用魔法驅逐鵜鶘。\n\n哇啦哇啦代表著自信心，這些自信心，會從你的收穫獲得養分而成長茁壯，只不過偶爾還是會有外界的壓力（鵜鶘）來打壓你的自信，這時候就要保持初衷，無畏外界壓力！維持自己的信心！而火美來驅逐鵜鶘則象徵著：一開始的信念（初衷）使你無懼於那些外界的壓力。"), 
        Char(image: "Uncle", name: "大叔父", vol: "火野正平", intro: "久子與夏子的大叔父，同時是真人的曾大叔公。真實身分是維持「下界」平衡的強大巫師。他建造了一座塔。\n\n搖搖欲墜的積木代表著超我（舅公）多年來努力維持的內心世界平衡，但也到了極限，最後積木倒了，平衡崩塌之際，自我（真人）帶著新的信念，回應現實世界（也就是真人帶著夏子媽媽，回到原來的世界），那些看起來可怕的鸚鵡（自己給自己的壓力），在代表內心高牆的建築崩塌後，全都變成了可愛的小鳥，與夏子媽媽蹭臉那一幕，則在比喻自己找到如何與新觀念（信念）的相處模式了吧。")
    ]
    
    var body: some View {
        ZStack {
            IntroView().background
            VStack {
                Text("關於人物介紹與分析其背後想表達的寓意：")
                    .foregroundColor(.white)
                    .font(.title3)
                List {
                    ForEach(chars, id: \.image) { item in 
                        CharRow(char: item)
                    }
                    .listRowBackground(IntroView().background)
                    HStack {
                        Text("電影分析參考連結：")
                            .foregroundColor(.white)
                        Link("蒼鷺與少年觀影心得", destination: URL(string: "https://www.dcard.tw/f/movie/p/253567740?cid=42388ED3-8E5E-49F7-98C3-97EFEDBB09D1")!)
                            .underline()
                            .foregroundColor(.blue)
                    }
                    .listRowBackground(IntroView().background)
                }
                .listStyle(PlainListStyle())
                .background(IntroView().background)
            }
            .background(IntroView().background)
        }
    }
}
