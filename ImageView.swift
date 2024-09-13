//
//  ImageView.swift
//  AiRLITZ
//
//  Created by Nancy Liddle on 7/31/24.
//

import Foundation
import SwiftUI

//takes image to access URL as parameter
struct ImageVieww: View {
    @ObservedObject private var imageViewModel: ImageViewModel
    
    //sends url to ImageViewModel()
    init(urlString: String?) {
        imageViewModel = ImageViewModel(urlString: urlString)
    }
    
    //creates view for users to see image
    var body: some View {
        Image(uiImage: imageViewModel.image ?? UIImage())
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}


