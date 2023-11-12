import SwiftUI

struct AdView: View {
    let images = [
        Image("AD1"), 
        Image("AD2"), 
        Image("AD3"), 
        Image("AD4"), 
        Image("AD5"), 
        Image("AD6"), 
        Image("AD7")
    ]
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.white)
                VStack (alignment: .leading) {
                    Text("最新消息")
                        .foregroundColor(.black)
                        .font(.title)
                        .bold()
                        .padding(EdgeInsets(top: 25, leading: 25, bottom: 0, trailing: 200))
                    List {
                        ForEach(images.indices) { item in
                            NavigationLink {
                                showAd(image: images[item])
                            } label: {
                                images[item]
                                    .resizable()
                                    .scaledToFill()
                                    .frame(height: 250)
                                    .clipShape(RoundedRectangle(cornerRadius: 15))
                            }
                        }
                        .listRowBackground(Color(.white))
                        .background(Color(.white))
                    }
                    .listStyle(PlainListStyle())
                    .listRowBackground(Color(.white))
                    .background(Color(.white))
                }
                .background(Color(.white))
            }
            .background(Color(.white))
        }
        .background(Color(.white))
    }
}

struct showAd: View {
    let image: Image
    var body: some View {
        ZStack {
            Color(.white)
            image
                .resizable()
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .scaledToFit()
        }
        .background(Color(.white))
    }
}
