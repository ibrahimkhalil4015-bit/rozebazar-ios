import SwiftUI

struct SplashView: View {
    @Binding var isActive: Bool
    
    @State private var scale: CGFloat = 0.5
    @State private var opacity: Double = 0.0
    
    var body: some View {
        ZStack {
            Color(red: 237/255.0, green: 28/255.0, blue: 36/255.0) // Red matching the new icon background
                .ignoresSafeArea()
            
            // Try loading from file path or fallback to asset catalog
            if let imagePath = Bundle.main.path(forResource: "app_logo", ofType: "png"),
               let uiImage = UIImage(contentsOfFile: imagePath) {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 320, height: 320)
                    .scaleEffect(scale)
                    .opacity(opacity)
            } else {
                Image("app_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 320, height: 320)
                    .scaleEffect(scale)
                    .opacity(opacity)
            }
        }
        .onAppear {
            withAnimation(.easeOut(duration: 1.5)) {
                self.scale = 1.0
                self.opacity = 1.0
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
}
