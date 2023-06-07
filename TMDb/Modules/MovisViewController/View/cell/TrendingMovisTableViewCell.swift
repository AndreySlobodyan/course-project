

import UIKit
import SDWebImage

class TrendingMovisTableViewCell: UITableViewCell {

    
    @IBOutlet weak var Poster: UIImageView!
    
    
    @IBOutlet weak var Title: UILabel!
    
   
    
    @IBOutlet weak var ReleaseDate: UILabel!
    
    
    @IBOutlet weak var VoteAaverage: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        Poster.layer.cornerRadius = 15
        
    }

    
    func configurWith (_ item: Movie  ) {
        
        var imageURLString = ""
        
        if let backdropPath = item.backdropPath{
            
             imageURLString = "https://image.tmdb.org/t/p/w500" + backdropPath
            let imageURL = URL(string:imageURLString)
            
            
            Title.text = item.originalTitle
            ReleaseDate.text = item.releaseDate
            let doubleValue: Double = item.voteAverage ?? 0
            let stringValue = String(doubleValue)
            VoteAaverage.text = stringValue
            Poster.sd_setImage(with:  imageURL)
            
            }
        
        
      
    }
    
    
}
