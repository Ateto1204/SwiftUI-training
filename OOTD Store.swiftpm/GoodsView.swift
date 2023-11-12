import SwiftUI

struct GoodsView: View {
    let tops = [
        Good(title: "寬鬆復古亨利領針織衫", imageCode: "p1", oldPrice: 1380, newPrice: 900, imageLength: 9), 
        Good(title: "彩色棉結針織小高領套頭衫", imageCode: "p2", oldPrice: 1350, newPrice: 690, imageLength: 9), 
        Good(title: "寬鬆插肩袖亨利領針織衫", imageCode: "p3", oldPrice: 1490, newPrice: 1200, imageLength: 9), 
        Good(title: "寬鬆衣領半拉鍊套頭運動衫", imageCode: "p4", oldPrice: 1750, newPrice: 1050, imageLength: 9), 
        Good(title: "寬鬆重磅棉質高領運動衫", imageCode: "p5", oldPrice: 1480, newPrice: 850, imageLength: 9), 
        Good(title: "寬鬆圓領口袋針織衫", imageCode: "p6", oldPrice: 1490, newPrice: 850, imageLength: 9)
    ]
    let bottoms = [
        Good(title: "寬鬆氣球牛仔褲", imageCode: "pp1", oldPrice: 1780, newPrice: 1400, imageLength: 8), 
        Good(title: "寬鬆直筒軍裝工裝褲", imageCode: "pp2", oldPrice: 1450, newPrice: 1180, imageLength: 10), 
        Good(title: "寬鬆側袋氣球工作褲", imageCode: "pp3", oldPrice: 1650, newPrice: 900, imageLength: 9), 
        Good(title: "寬鬆口袋刺繡工裝牛仔褲", imageCode: "pp4", oldPrice: 1890, newPrice: 1180, imageLength: 9)
    ]
    let outers = [
        Good(title: "寬鬆軍用MA-1夾克外套", imageCode: "c1", oldPrice: 2180, newPrice: 1450, imageLength: 9), 
        Good(title: "2 way尼龍抓絨雙面立領外套", imageCode: "c2", oldPrice: 3450, newPrice: 3080, imageLength: 9), 
        Good(title: "寬鬆燈芯絨領牛仔夾克", imageCode: "c3", oldPrice: 2050, newPrice: 1250, imageLength: 9), 
        Good(title: "Hect Set-up Coach Jacket", imageCode: "c4", oldPrice: 2880, newPrice: 2290, imageLength: 9), 
        Good(title: "Freak's Store M65軍用外套", imageCode: "c5", oldPrice: 3480, newPrice: 2880, imageLength: 9)
    ]
    let bags = [
        Good(title: "CPCM防潑水郵差包", imageCode: "b1", oldPrice: 1650, newPrice: 1150, imageLength: 7), 
        Good(title: "Freak's Store衍縫斜背包", imageCode: "b2", oldPrice: 2280, newPrice: 1790, imageLength: 8), 
        Good(title: "Quilt Shoulder Bag", imageCode: "b3", oldPrice: 1780, newPrice: 1340, imageLength: 7), 
        Good(title: "TNF紫標Field Demi Duffle Bag", imageCode: "b4", oldPrice: 4280, newPrice: 3480, imageLength: 8)
    ]
    let ads = ["AD1", "AD2", "AD3", "AD4", "AD5", "AD6", "AD7"]
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.white)
                VStack (alignment: .leading) {
                    Text("熱銷商品")
                        .foregroundColor(Color(.black))
                        .font(.title)
                        .bold()
                        .padding(EdgeInsets(top: 25, leading: 25, bottom: 0, trailing: 200))
                    ScrollView {
                        VStack (spacing: 60) {
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack {
                                    ForEach(ads.indices) { item in
                                        if item != 0 {
                                            Image("AD\(item)")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(height: 250)
                                                .clipShape(RoundedRectangle(cornerRadius: 15))
                                        }
                                    }
                                }
                            }
                            goodsRow(title: "TOPS", goods: tops)
                            goodsRow(title: "BOTTOMS", goods: bottoms)
                            goodsRow(title: "OUTERS", goods: outers)
                            goodsRow(title: "BAGS", goods: bags)
                        }
                    }
                    .listStyle(PlainListStyle())
                    .background(Color(.white))
                    .padding(EdgeInsets(top: 25, leading: 25, bottom: 25, trailing: 25))
                }
                .background(Color(.white))
            }
        }
    }
}

struct Good {
    let title: String
    let imageCode: String
    let oldPrice: Int
    let newPrice: Int
    let imageLength: Int
    var size: String
    init(title: String, imageCode: String, oldPrice: Int, newPrice: Int, imageLength: Int) {
        self.title = title
        self.imageCode = imageCode
        self.oldPrice = oldPrice
        self.newPrice = newPrice
        self.imageLength = imageLength
        self.size = "nan"
    }
    init(title: String, imageCode: String, oldPrice: Int, newPrice: Int, size: String, imageLength: Int) {
        self.title = title
        self.imageCode = imageCode
        self.oldPrice = oldPrice
        self.newPrice = newPrice
        self.size = size
        self.imageLength = imageLength
    }
}

struct goodContent: View {
    @State private var page: Int = 1
    @State private var showAlert: Bool = false
    @State private var alertMsg: String = "Sucessful!"
    @State private var selectedSize: Int = 0
    @State var good: Good
    let selections = ["選擇尺寸", "M", "L"]
    var body: some View {
        ZStack {
            Color(.white)
            ScrollView (showsIndicators: false) {
                ZStack {
                    Color(.white)
                    VStack {
                        HStack (spacing: 3) {
                            Button {
                                page -= 1
                                if page == 0 {
                                    page = good.imageLength
                                }
                            } label: {
                                Image(systemName: "arrow.left.square.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 25, height: 25)
                                    .foregroundColor(.gray)
                            }
                            Button {
                                page += 1
                                if page > good.imageLength {
                                    page = 1
                                }
                            } label: {
                                Image("\(good.imageCode)-\(page)")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 400, height: 400)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                Image(systemName: "arrow.right.square.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 25, height: 25)
                                    .foregroundColor(.gray)
                            }
                        }
                        Text(good.title)
                            .font(.title)
                            .bold()
                            .foregroundColor(.black)
                            .padding(EdgeInsets(top: 40, leading: 0, bottom: 0, trailing: 0))
                        HStack (spacing: 25) {
                            Text("$\(good.oldPrice)")
                                .font(.title3)
                                .strikethrough()
                                .foregroundColor(.black)
                            Text("$\(good.newPrice)")
                                .font(.title2)
                                .bold()
                                .foregroundColor(.red)
                        }
                        Picker(selection: $selectedSize) {
                            Text("選擇尺寸").tag(0)
                            Text("M").tag(1)
                            Text("L").tag(2)
                        } label: {
                            Text("選擇尺寸123")
                        }
                        
                        Button {
                            good.size = selections[selectedSize]
                            if good.size == "選擇尺寸" {
                                alertMsg = "請選擇尺寸"
                            } else {
                                alertMsg = "成功加入購物車"
                                cartView.cart.append(good)
                                cartView.total += good.newPrice
                            }
                            showAlert = true
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 8)
                                    .frame(width: 125, height: 50)
                                Text("加入購物車")
                                    .foregroundColor(.white)
                            }
                        }
                        .alert(alertMsg, isPresented: $showAlert) {
                            Button ("OK") {
                                showAlert = false
                            }
                        }
                    }
                }
                .background(Color(.white))
            }
        }
        .background(Color(.white))
    }
}

struct goodsRow: View {
    let title: String
    let goods: [Good]
    var body: some View {
        VStack (spacing: 40) {
            Text(title)
                .font(.title2)
                .bold()
                .foregroundColor(.black)
            HStack {
                Image(systemName: "arrow.left.square.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20)
                    .foregroundColor(.gray)
                ScrollView (.horizontal) {
                    HStack (spacing: 20) {
                        ForEach(goods.indices) { item in
                            NavigationLink {
                                goodContent(good: goods[item])
                            } label: {
                                VStack (spacing: 10) {
                                    Image("\(goods[item].imageCode)-1")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 120, height: 120)
                                        .clipShape(RoundedRectangle(cornerRadius: 15))
                                    Text(goods[item].title)
                                        .foregroundColor(Color(.black))
                                    Text("$\(goods[item].oldPrice)")
                                        .strikethrough(true, color: .gray)
                                        .foregroundColor(.gray)
                                    Text("$\(goods[item].newPrice)")
                                        .foregroundColor(.red)
                                }
                            }
                        }
                    }
                    .listStyle(PlainListStyle())
                    .background(Color(.white))
                }
                .listRowBackground(Color(.white))
                Image(systemName: "arrow.right.square.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20)
                    .foregroundColor(.gray)
            }
            .background(Color(.white))
        }
    }
}
