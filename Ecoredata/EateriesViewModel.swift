//
//  EateriesViewModel.swift
//  Ecoredata
//
//  Created by Weiye Zhou on 14/5/21.
//

import Foundation
import SwiftUI

//transfer url to image, download and store image
class EateriesViewModel{
    //store image and related url
    var imageEateriesView = Dictionary<URL, Image>()
    //convert url image
    func download(_ imageURLString: String) -> Image {
        guard let url = URL(string: imageURLString) else {
            let image = Image("nonexistent")
            return image
        }
        if let image = imageEateriesView[url]{
            return image
        }
        guard let imageData = try? Data(contentsOf: url),
              let uiImage = UIImage(data: imageData) else{
              let image = Image("nonexistent")
            return image
        }
        let image = Image(uiImage: uiImage)
        imageEateriesView[url] = image
        return image
    }
}
