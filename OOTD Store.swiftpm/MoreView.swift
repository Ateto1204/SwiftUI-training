import SwiftUI

struct MoreView: View {
    var body: some View {
        ZStack {
            Color(.white)
            VStack (alignment: .leading) {
                Text("資料來源")
                    .font(.title)
                    .bold()
                    .foregroundColor(.black)
                    .padding(EdgeInsets(top: 25, leading: 25, bottom: 0, trailing: 200))
                ScrollView (showsIndicators: false) {
                    ZStack {
                        Color(.white)
                        VStack (spacing: 40) {
                            linkView(url: "https://www.instagram.com/pengi.japan/?utm_source=ig_web_button_share_sheet&igshid=OGQ5ZDc2ODk2ZA==", name: "Pengi", imageName: "pengi")
                            linkView(url: "https://www.daytona-park.com/", name: "Freak's Store", imageName: "freakstore")
                            linkView(url: "https://www.instagram.com/nerd_select/?utm_source=ig_web_button_share_sheet&igshid=OGQ5ZDc2ODk2ZA==", name: "NERD", imageName: "nerd")
                        }
                        .padding()
                    }
                }
            }
        }
        .background(Color(.white))
    }
}

struct linkView: View {
    public let url: String
    public let name: String
    public let imageName: String
    var body: some View {
        Link(destination: URL(string: url)!, label: {
            VStack (spacing: 15) {
                ZStack {
                    Circle()
                        .stroke(lineWidth: 4)
                        .frame(width: 128, height: 128)
                        .foregroundColor(.yellow)
                    Circle()
                        .frame(width: 120, height: 120)
                        .foregroundColor(.white)
                    Image(imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120, height: 120)
                        .clipShape(Circle())
                }
                Text(name)
            }
        })
        .underline()
        .foregroundColor(.blue)
    }
}
