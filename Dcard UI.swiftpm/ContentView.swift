import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            ZStack (alignment: .top) {
                
                let backgroundColor = Color(red: 242/255, green: 243/255, blue: 244/255)
                let dcardBlue = Color(red: 0, green: 106/255, blue: 166/255)
                let searchBox = Color(red: 0, green: 92/255, blue: 144/255)
                let searchFont = Color(red: 108/255, green: 161/255, blue: 190/255)
                
                backgroundColor
                    .ignoresSafeArea()
                
                VStack (spacing: 5) {
                    
                    ZStack (alignment: .bottom) {
                        Rectangle()
                            .frame(height: 80)
                            .foregroundColor(dcardBlue)
                        VStack (spacing: 0) {
                            
                            HStack (spacing: 0) {
                                Rectangle()
                                    .frame(width: 10, height: 20)
                                    .foregroundColor(dcardBlue)
                                ZStack (alignment: .leading) {
                                    Rectangle()
                                        .frame(height: 25)
                                        .foregroundColor(searchBox)
                                        .clipShape(RoundedRectangle(cornerRadius: 5))
                                    HStack (spacing: 3) {
                                        Image("SearchIcon")
                                            .resizable()
                                            .frame(width: 20, height: 20)
                                        Text("Iphone 保護貼")
                                            .font(.system(size: 13))
                                            .foregroundColor(searchFont)
                                    }
                                }
                                Rectangle()
                                    .frame(width: 10, height: 20)
                                    .foregroundColor(dcardBlue)
                            }
                            Rectangle()
                                .frame(height: 5)
                                .foregroundColor(dcardBlue)
                        }
                    }
                    
                    ZStack {
                        let widthSize = UIScreen.main.bounds.width
                        Rectangle()
                            .frame(height: 38)
                            .foregroundStyle(.white)
                        HStack (spacing: widthSize/5) {
                            
                            Text("推薦")
                                .foregroundColor(.gray)
                                .font(.system(size: 15))
                                .bold()
                            VStack {
                                Rectangle()
                                    .frame(width: widthSize/5, height: 2)
                                Text("全部")
                                    .foregroundColor(.black)
                                    .font(.system(size: 15))
                                    .bold()
                                Rectangle()
                                    .frame(width: widthSize/5, height:2)
                                    .foregroundColor(dcardBlue)
                            }
                            Text("追蹤")
                                .foregroundColor(.gray)
                                .font(.system(size: 15))
                                .bold()
                            
                            Text("主題")
                                .foregroundColor(.gray)
                                .font(.system(size: 15))
                                .bold()
                        }
                    }
                    
                    ZStack (alignment: .leading) {
                        Rectangle()
                            .frame(height: 25)
                            .foregroundColor(backgroundColor)
                        
                        HStack {
                            Rectangle()
                                .frame(width: 3, height: 25)
                                .foregroundColor(backgroundColor)
                            HStack (spacing: 3) {
                                Image("Fire")
                                    .resizable()
                                    .frame(width: 15, height: 15)
                                Text(" 熱門")
                                    .font(.system(size: 12))
                                    .foregroundColor(.gray)
                                    .bold()
                                Image("Arrow")
                                    .resizable()
                                    .frame(width: 15, height: 15)
                            }
                        }
                    }
                    
                    Image("Ad")
                        .resizable()
                        .scaledToFill()
                    
                    ZStack (alignment: .leading) {
                        Rectangle()
                            .frame(height: 105)
                        HStack {
                            Rectangle()
                                .frame(width: 10, height: 100)
                            VStack (alignment: .leading, spacing: 5) {
                                HStack (spacing: 0) {
                                    Image("User1")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                    Text(" 好物・平價小管家")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 12))
                                    Image("Flag")
                                        .resizable()
                                        .frame(width: 16, height: 16)
                                    Text("・21 小時前 ")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 12))
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 4)
                                            .frame(width: 30, height: 16)
                                            .foregroundColor(.gray)
                                        Text("置頂")
                                            .font(.system(size: 11))
                                    }
                                }
                                Text("What's in my bag? 外出必備好物大公開")
                                    .foregroundColor(.black)
                                    .font(.system(size: 14))
                                    .bold()
                                Text("大家好～我是平價小管家～大家是否和小管家...")
                                    .foregroundColor(.black)
                                    .font(.system(size:12))
                                HStack (spacing: 15) {
                                    HStack (spacing: 3) {
                                        Image("Love")
                                            .resizable()
                                            .frame(width: 18, height: 18)
                                        Text("302")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 12))
                                            .bold()
                                    }
                                    HStack (spacing: 3) {
                                        Image("Message")
                                            .resizable()
                                            .frame(width: 20, height: 20)
                                        Text("5")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 12))
                                            .bold()
                                    }
                                    HStack (spacing: 3) {
                                        Image("Keep")
                                            .resizable()
                                            .frame(width: 20, height: 20)
                                        Text("收藏")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 12))
                                            .bold()
                                    }
                                }
                            }
                        }
                        ZStack (alignment: .trailing) {
                            HStack {
                                VStack (alignment: .trailing, spacing: 10) {
                                    Text("...")
                                        .foregroundColor(.gray)
                                        .bold()
                                    Image("Image1")
                                        .resizable()
                                        .frame(width: 60, height: 60)
                                }
                                Rectangle()
                                    .frame(width: 5, height: 105)
                            }
                            Spacer()
                                .frame(alignment: .trailing)
                        }
                    }
                    
                    ZStack (alignment: .leading) {
                        Rectangle()
                            .frame(height: 105)
                        HStack {
                            
                            Rectangle()
                                .frame(width:10, height: 105)
                            
                            VStack (alignment: .leading, spacing: 5) {
                                HStack (spacing: 3) {
                                    Image("FemaleUser")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                    Text("心情・13 小時前")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 12))
                                }
                                Text("朱李一家 小朱開始團購了？")
                                    .foregroundColor(.black)
                                    .font(.system(size: 14))
                                    .bold()
                                Text("看到小朱開始被撻伐失去初衷這件事，我想說..，其實吧，...")
                                    .foregroundColor(.black)
                                    .font(.system(size:12))
                                HStack (spacing: 15) {
                                    HStack (spacing: 5) {
                                        HStack (spacing: -3) {
                                            Image("Love")
                                                .resizable()
                                                .frame(width: 18, height: 18)
                                            Image("Laugh")
                                                .resizable()
                                                .frame(width: 15, height: 15)
                                        }
                                        Text("844")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 12))
                                            .bold()
                                    }
                                    
                                    HStack (spacing: 3) {
                                        Image("Message")
                                            .resizable()
                                            .frame(width: 20, height: 20)
                                        Text("133")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 12))
                                            .bold()
                                    }
                                    
                                    HStack (spacing: 3) {
                                        Image("Keep")
                                            .resizable()
                                            .frame(width: 20, height: 20)
                                        Text("收藏")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 12))
                                            .bold()
                                    }
                                }
                            }
                        }
                        ZStack (alignment: .trailing) {
                            HStack (spacing: 0) {
                                VStack (alignment: .trailing) {
                                    Text("...")
                                        .foregroundColor(.gray)
                                        .bold()
                                    Rectangle()
                                        .frame(width: 20, height: 60)
                                }
                                Rectangle()
                                    .frame(width: 12, height: 105)
                            }
                            Spacer()
                                .frame(alignment: .trailing)
                        }
                    }
                    
                    ZStack (alignment: .leading) {
                        Rectangle()
                            .frame(height: 105)
                        HStack {
                            
                            Rectangle()
                                .frame(width: 10, height: 105)
                            
                            HStack (spacing: 35) {
                                VStack (alignment: .leading, spacing: 5) {
                                    HStack (spacing: 3) {
                                        Image("MaleUser")
                                            .resizable()
                                            .frame(width: 20, height: 20)
                                        Text("追星・21 小時前")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 12))
                                    }
                                    Text("＃新聞 布魯斯威利失智一年了......")
                                        .foregroundColor(.black)
                                        .font(.system(size: 14))
                                        .bold()
                                    Text("去年卻傳出他因罹患「失語症」宣布息影，之...")
                                        .foregroundColor(.black)
                                        .font(.system(size:12))
                                    HStack (spacing: 15) {
                                        HStack (spacing: 3) {
                                            HStack (spacing: -3) {
                                                Image("Love")
                                                    .resizable()
                                                    .frame(width: 18, height: 18)
                                                Image("Sad")
                                                    .resizable()
                                                    .frame(width: 15, height: 15)
                                                Image("Wow")
                                                    .resizable()
                                                    .frame(width: 15, height: 15)
                                            }
                                            Text("1644")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 12))
                                                .bold()
                                        }
                                        
                                        HStack (spacing: 3) {
                                            Image("Message")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                            Text("49")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 12))
                                                .bold()
                                        }
                                        
                                        HStack (spacing: 3) {
                                            Image("Keep")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                            Text("收藏")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 12))
                                                .bold()
                                        }
                                    }
                                }
                            }
                        }
                        ZStack (alignment: .trailing) {
                            HStack (spacing: 0) {
                                VStack (alignment: .trailing) {
                                    Text("...")
                                        .foregroundColor(.gray)
                                        .bold()
                                    Image("Image2")
                                        .resizable()
                                        .frame(width: 60, height: 60)
                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                                }
                                Rectangle()
                                    .frame(width: 10, height: 105)
                            }
                            Spacer()
                                .frame(alignment: .trailing)
                        }
                    }
                }
            }
            
            VStack {
                Spacer()
                    .frame(alignment: .bottom)
                VStack (alignment: .trailing) {
                    VStack {
                        HStack (spacing: 0) {
                            Image("Post")
                                .resizable()
                                .frame(width: 45, height: 45)
                            Rectangle()
                                .frame(width: 12, height: 45)
                        }
                        Rectangle()
                            .frame(width: 50, height: 5)
                    }
                    ZStack (alignment: .bottom) {
                        Rectangle()
                            .frame(height: 100)
                        VStack (spacing: 0) {
                            let widthSize = UIScreen.main.bounds.width
                            HStack (alignment: .bottom, spacing: widthSize/8) {
                                Image("Home")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                Image("Explore")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                Image("Card")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                Image("Shop")
                                    .resizable()
                                    .frame(width: 34, height: 33)
                                ZStack (alignment: .topTrailing) {
                                    Image("Bell")
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                    Text("4")
                                        .font(.system(size: 12))
                                        .frame(width: 15, height: 15)
                                        .background(Color.red)
                                        .clipShape(Circle())
                                        .offset(x: 5, y: -3)
                                }
                                Image("More")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                            }
                            Rectangle()
                                .frame(height: 60)
                        }
                    }
                }
            }
        }
    }
}
