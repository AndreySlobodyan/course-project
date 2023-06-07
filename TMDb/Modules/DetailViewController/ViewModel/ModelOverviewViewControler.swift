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
        var imageURLString = ""
        
        if let backdropPath = self.movie?.backdropPath {
            imageURLString = "https://image.tmdb.org/t/p/w500" + backdropPath
            
            let imageURL = URL(string: imageURLString)
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
        
        // Добавляем анимацию изменения размера кнопки при нажатии
        let animation = CABasicAnimation(keyPath: "transform.scale")
        animation.toValue = 0.7
        animation.duration = 0.1
        animation.repeatCount = 1
        animation.autoreverses = true
        self.layer.add(animation, forKey: nil)
    }
}





