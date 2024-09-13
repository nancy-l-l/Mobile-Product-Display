
import SwiftUI

struct prodDisplay: View {
    var urlString: String
    @State private var imageUrls: [productURL] = []
    init(url: String) {
            self.urlString = url
    }
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea() // Set the entire background to black

            VStack {
                Image("Logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200.0, height: 70.0) // Adjust size as needed
                    .padding(.top, 20) // Move the logo closer to the top
                    .padding(.bottom, 20)
                    .colorInvert()
                ScrollView{
                    VStack(spacing: 10) {
                        ForEach($imageUrls, id: \.image_key) { imageUrl in
                                VStack {
                                    ImageVieww(urlString: imageUrl.image_url.wrappedValue)
                                        .scaledToFit() // Fit the image to the available space
                                        .frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.height * 0.6) // Make the images bigger
                                        .cornerRadius(10)
                                        .shadow(radius: 5)
                                }
                                .padding(.horizontal, 10)
                        }
                    }
                    .padding()
                }
                .onAppear {
                    fetchData()
                }
            }
        }
    }

    func fetchData() {
        product().fetchh(url: urlString) { imageURLs in
            DispatchQueue.main.async {
                self.imageUrls = imageURLs
            }
        }
    }
}

