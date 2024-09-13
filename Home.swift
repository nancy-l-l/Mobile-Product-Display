import Foundation
import SwiftUI
//First Screen: Home Page
struct ContentView: View {
    var body: some View {
        NavigationView { // Wrap everything in a NavigationView
            ZStack {
                Color.black
                    .ignoresSafeArea()
                
                VStack {
                    Spacer()

                    Image("Logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200.0, height: 70.0) // Adjust size as needed
                        .colorInvert()
                    
                    HStack(spacing: 20) {
                        // Stack buttons horizontally with spacing
                        //buttons that navigate users to their respective screens
                        //Display is a function that displays all images from json response when given the url
                        //Go to Celebs file to see display() implementation
                        NavigationLink(destination: display(urlString: "https://ljybqr7llf.execute-api.us-east-2.amazonaws.com/beta/featured/celebs")) {
                            Text("Celebs")
                                .font(.title2)
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.black)
                                .cornerRadius(10)
                        }
                        
                        NavigationLink(destination: display(urlString: "https://ljybqr7llf.execute-api.us-east-2.amazonaws.com/beta/featured/shows")) {
                            Text("Shows")
                                .font(.title2)
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.black)
                                .cornerRadius(10)
                        }
                        
                        NavigationLink(destination: display(urlString: "https://ljybqr7llf.execute-api.us-east-2.amazonaws.com/beta/featured/movies")) {
                            Text("Movies")
                                .font(.title2)
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.black)
                                .cornerRadius(10)
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 20) // Add some space between the image and buttons

                    Spacer()
                }
            }
        }
    }
}

struct Home_View: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
