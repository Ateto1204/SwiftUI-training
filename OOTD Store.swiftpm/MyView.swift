import SwiftUI

struct MyView: View {
    @State private var login = false
    @State private var showLoginView = false
    @State private var status = "登入"
    @State private var showAlert = false
    public static var username = "unknown"
    public static var accounts = [account.demoAccount]
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.white)
                if !login {
                    VStack (spacing: 40) {
                        Text("請先登入")
                            .font(.title)
                            .bold()
                            .foregroundColor(.black)
                        HStack (spacing: 20) {
                            ButtonView(login: $login, status: "註冊")
                            ButtonView(login: $login, status: "登入")
                        }
                    }
                    .background(Color(.white))
                } else {
                    VStack (alignment: .leading, spacing: 40) {
                        Text("我的帳號")
                            .foregroundColor(Color(.black))
                            .font(.title)
                            .bold()
                            .padding(EdgeInsets(top: 25, leading: 25, bottom: 0, trailing: 200))
                        List {
                            HStack (spacing: 0) {
                                Group {
                                    Text("我的帳戶：")
                                    Text(MyView.username)
                                }
                                .foregroundColor(.black)
                                .listRowBackground(Color(.white))
                            }
                            .listRowBackground(Color(.white))
                            NavigationLink {
                                cartView()
                            } label: {
                                Text("我的購物車")
                                    .foregroundColor(.black)
                            }
                            .listRowBackground(Color(.white))
                            Button {
                                showAlert = true
                                login = false
                            } label: {
                                Text("登出")
                                    .foregroundColor(.black)
                            }
                            .listRowBackground(Color.white)
                        }
                        .listStyle(PlainListStyle())
                        .listRowBackground(Color(.white))
                    }
                    .background(Color(.white))
                }
            }
            .background(Color(.white))
            .alert("成功登出", isPresented: $showAlert) {
                Button ("OK") {
                }
            }
        }
    }
}

struct ButtonView: View {
    @Binding public var login: Bool
    @State private var buttonPressed = false
    public var status: String
    
    var body: some View {
        Button {
            buttonPressed = true
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 70, height: 40)
                Text(status)
                    .foregroundColor(.white)
            }
        }
        .sheet(isPresented: $buttonPressed) {
            loginView(status: status, login: $login)
        }
    }
}

struct account {
    let username: String
    var password: String
    var accumulation: Int
}

extension account {
    static let demoAccount = account(username: "unknown", password: "null", accumulation: 0)
}

struct loginView: View {
    public let status: String
    @Binding public var login: Bool
    @State private var buttonPressed = false
    @State private var user = ""
    @State private var pwd = ""
    @State private var alertMsg = "null"
    
    var body: some View {
        ZStack {
            Color(.white)
            VStack {
                VStack(spacing: 20) {
                    Text(status)
                        .font(.title)
                        .bold()
                        .foregroundColor(.black)
                    TextField(text: $user) {
                        Text("帳號")
                            .foregroundColor(.gray)
                    }
                    .foregroundColor(.black)
                    TextField(text: $pwd) {
                        Text("密碼")
                            .foregroundColor(.gray)
                    }
                    .foregroundColor(.black)
                }
                .padding(EdgeInsets(top: 50, leading: 0, bottom: 0, trailing: 0))
                Spacer()
                Button {
                    checkCredentials()
                    buttonPressed = true
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 12)
                            .frame(width: 100, height: 50)
                        Text("完成")
                            .foregroundColor(.white)
                    }
                }
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 50, trailing: 0))
            }
            .padding(EdgeInsets(top: 0, leading: 25, bottom: 0, trailing: 25))
            .alert(alertMsg, isPresented: $buttonPressed) {
                Button ("OK") {
                    buttonPressed = false
                }
            }
        }
    }
    private func checkCredentials() {
        guard !user.isEmpty && !pwd.isEmpty else {
            alertMsg = "帳號或密碼不能為空白"
            return
        }
        if status == "登入" {
            for item in MyView.accounts.indices {
                if MyView.accounts[item].username == user {
                    if MyView.accounts[item].password == pwd {
                        alertMsg = "登入成功"
                        MyView.username = user
                        login = true
                    } else {
                        alertMsg = "密碼不正確"
                    }
                    break
                } else {
                    alertMsg = "帳號不存在"
                }
            }
        } else {
            alertMsg = "註冊成功"
            MyView.accounts.append(account(username: user, password: pwd, accumulation: 0))
            MyView.username = user
            login = true
        }
    }
}

struct cartView: View {
    @State private var showAlert: Bool = false
    @State private var AlertMsg: String = "購物車中沒有商品"
    public static var total = 0
    public static var cart = [Good(title: "", imageCode: "", oldPrice: 0, newPrice: 0, imageLength: 0)]
    var body: some View {
        ZStack {
            Color(.white)
            VStack (alignment: .trailing) {
                display()
                Button {
                    if cartView.total == 0 {
                        AlertMsg = "購物車中沒有商品"
                    } else {
                        AlertMsg = "成功下單！"
                    }
                    showAlert = true
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 70, height: 40)
                        Text("結帳")
                            .foregroundColor(.white)
                    }
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 20))
                }
                .alert(AlertMsg, isPresented: $showAlert) {
                    Button ("OK") {
                        showAlert = false
                    }
                }
            }
        }
        .background(Color(.white))
    }
    func display() -> some View {
        ZStack {
            Color(.white)
            List {
                ForEach(cartView.cart.indices) { item in 
                    if item != 0 {
                        HStack {
                            Image("\(cartView.cart[item].imageCode)-1")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 100, height: 100)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            VStack (alignment: .leading, spacing: 15) {
                                Text("\(cartView.cart[item].title)")
                                    .font(.title2)
                                    .foregroundColor(.black)
                                HStack (spacing: 15) {
                                    Group {
                                        Text("Size: \(cartView.cart[item].size)")
                                        Text("$\(cartView.cart[item].newPrice)")
                                    }
                                    .foregroundColor(.black)
                                }
                            }
                        }
                    }
                }
                .background(Color(.white))
                .listRowBackground(Color(.white))
                Text("total: $\(cartView.total)")
                    .foregroundColor(.black)
                    .background(Color(.white))
                    .listRowBackground(Color(.white))
            }
            .background(Color(.white))
            .listStyle(PlainListStyle())
            .listRowBackground(Color(.white))
        }
    }
}
