

import UIKit
import SDWebImage

class TrendingMovisTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var poster: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var voteAaverage: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        poster.layer.cornerRadius = 15
        
    }
    
    
    func configurWith(_ item: Movie  ){
        
        var URLString = ""
        
        if let backdropPath = item.backdropPath{
            
            URLString = Constants.Network.imageURLString + backdropPath
            let imageURL = URL(string:URLString)
            
            
            title.text = item.originalTitle
            releaseDate.text = item.releaseDate
            let doubleValue: Double = item.voteAverage ?? 0
            let stringValue = String(doubleValue)
            voteAaverage.text = stringValue
            poster.sd_setImage(with:  imageURL)
            
        }
        
        
        
    }
    
    
}
