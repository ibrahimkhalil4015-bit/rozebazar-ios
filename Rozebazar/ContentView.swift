import SwiftUI

struct ContentView: View {
    @State private var isActive = false
    
    var body: some View {
        ZStack {
            if isActive {
                WebViewContainer(url: URL(string: "https://www.rozebazar.com")!)
                    .transition(.opacity)
            } else {
                SplashView(isActive: $isActive)
            }
        }
        .animation(.easeOut(duration: 0.5), value: isActive)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
