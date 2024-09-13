import SwiftUI

struct display: View {
    let urlString: String
    @State private var imageUrls: [imageURL] = []
    var body: some View {
        NavigationView{
        ZStack {
            //background
            Color.black
                .ignoresSafeArea() // Set the entire background to black

            VStack {
                //logo across top of screen
                Image("Logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200.0, height: 70.0) // Adjust size as needed
                    .padding(.top, 20) // Move the logo closer to the top
                    .padding(.bottom, 20)
                    .colorInvert()

                ScrollView{
                    //scroll through images
                    VStack(spacing: 10) {
                        ForEach(imageUrls, id: \.image_key) { imageUrl in
                            NavigationLink(destination: prodDisplay(url:"https://ljybqr7llf.execute-api.us-east-2.amazonaws.com/beta/shows/\(imageUrl.name)/images")) {
                                //for each object in the json response, url is extracted and passed to ImageVieww()
                                //To see ImageVieww() implementation go to, you guessed it, ImageView
                                //For every item in imageUrls (extracted from JSON response), displays image and image name.
                                //Every image acts as a button that navigates users to another screen by passing url to prodDisplay().
                                //To see prodDisplay(), go to prodDisplay
                                VStack {
                                    ImageVieww(urlString: imageUrl.image_url)
                                        .scaledToFit() // Fit the image to the available space
                                        .frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.height * 0.6) // Make the images bigger
                                        .cornerRadius(10)
                                        .shadow(radius: 5)

                                    Text(imageUrl.name)
                                        .font(.system(size: 20, weight: .heavy, design: .serif))
                                        .foregroundColor(.white)
                                        .frame(maxWidth: .infinity, alignment: .center) // Center the text below the image
                                }
                                .padding(.horizontal, 10)
                            }
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
    }

    func fetchData() {
        Call().fetch(url: urlString) { imageURLs in
            DispatchQueue.main.async {
                self.imageUrls = imageURLs
                //populates imageUrls with every object in JSON response
            }
        }
    }
}

