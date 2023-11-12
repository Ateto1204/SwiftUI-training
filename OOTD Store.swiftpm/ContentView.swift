import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            AdView()
                .tabItem { 
                    Label("推薦", systemImage: "heart")
                }
            GoodsView()
                .tabItem {
                    Label("商品", systemImage: "tshirt")
                }
            MyView()
                .tabItem {
                    Label("我的", systemImage: "person.fill")
                }
            MoreView()
                .tabItem {
                    Label("更多", systemImage: "ellipsis")
                }
        }
    }
}
