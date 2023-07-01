//
//  ModelOverviewViewControler.swift
//  TMDb
//
//  Created by mac on 25.04.2023.
//

import Foundation
import UIKit


class ModelOverviewViewController: UIButton {
    
    var movie: Movie?

    func getImageURL(completion: @escaping ((URL?) -> Void)) {
        var URLString = ""
        
        if let backdropPath = self.movie?.backdropPath {
            URLString = Constants.Network.imageURLString + backdropPath
            
            let imageURL = URL(string: URLString)
            completion(imageURL)
        } else {
            completion(nil)
        }
    }


    func videoKey(completion: @escaping ((String) -> Void)) {
        guard let id = movie?.id else { return }
        
        NetworkManager.shared.requestVideo(id) { videos in
            guard let key = videos.first?.key else { return }
            completion(key)
        }
    }

    
    
    
    
    

    let heartImage = UIImage(systemName: "heart.fill")?.withTintColor(.red, renderingMode: .alwaysOriginal)
        
        
    let emptyHeartImage = UIImage(systemName: "heart")
        
    
    func toggle() {
        
        if self.currentImage == heartImage {
            self.setImage(emptyHeartImage, for: .normal)
        } else {
            self.setImage(heartImage, for: .normal)
            
            }
        
        // Add an animation of the button resizing on click
        let animation = CABasicAnimation(keyPath: "transform.scale")
        animation.toValue = 0.7
        animation.duration = 0.1
        animation.repeatCount = 1
        animation.autoreverses = true
        self.layer.add(animation, forKey: nil)
    }
}





