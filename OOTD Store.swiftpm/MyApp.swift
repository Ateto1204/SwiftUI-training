import SwiftUI

@main
struct MyApp: App {
    @State private var opacity: Double = 10
    var body: some Scene {
        WindowGroup {
            ZStack {
                ContentView()
                // 顯示APP啟動畫面
                launchView()
                    .ignoresSafeArea()
                    .opacity(opacity)
                    .animation(.easeInOut(duration: 4), value: opacity)
                    .onAppear {
                        opacity = 0
                    }
            }
        }
    }
}

// APP啟動畫面
struct launchView: View {
    @State private var opacity: Double = 0
    var body: some View {
        ZStack {
            Color(.white)
            Text("- Welcome -")
                .font(.title)
                .bold()
                .foregroundColor(.black)
                .opacity(opacity)
                .animation(.easeInOut(duration: 4), value: opacity)
                .onAppear {
                    opacity = 10
                }
        }
        .background(Color(.white))
    }
}
