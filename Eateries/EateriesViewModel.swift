//
//  EasteriesViewModel.swift
//  Eateries
//
//  Created by Weiye Zhou on 29/4/21.
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
            let EateriesImage = Image("nonexistent")
            return EateriesImage
        }
        if let EateriesImage = imageEateriesView[url]{
            return EateriesImage
        }
        guard let imageData = try? Data(contentsOf: url),
              let uiImage = UIImage(data: imageData) else{
              let EateriesImage = Image("nonexistent")
            return EateriesImage
        }
        let EateriesImage = Image(uiImage: uiImage)
        imageEateriesView[url] = EateriesImage
        return EateriesImage
    }
}
