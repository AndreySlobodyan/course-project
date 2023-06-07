

import UIKit
import SDWebImage
import youtube_ios_player_helper
class OverviewViewController: UIViewController {
    
    
    var modelOverview: ModelOverviewViewController = ModelOverviewViewController()
    
    
    
    @IBOutlet weak var videoPlayer: YTPlayerView!
    
    
    @IBOutlet weak var PosterImage: UIImageView!
    
    @IBOutlet weak var titlelabel: UILabel!
    
    @IBOutlet weak var overiewLabel: UILabel!
    
    @IBOutlet weak var likeButton: ModelOverviewViewController!
    
    
    

    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        
        navigationController?.isNavigationBarHidden = true
        
        PosterImage.layer.cornerRadius = 25
        
        
        
        
        
        
            titlelabel.textColor = UIColor.white
        titlelabel.text = modelOverview.movie?.title
            overiewLabel.textColor = UIColor.white
        overiewLabel.text = modelOverview.movie?.overview
            
        
        
        modelOverview.getImageURL { imageURL in
            self.PosterImage.sd_setImage(with: imageURL)
        }
            
        modelOverview.videoKey { key in
            self.videoPlayer.load(withVideoId: key)
        }
        
      
    }
    
    
    
    
    
    
    
    @IBAction func SaveMovie(_ sender: ModelOverviewViewController) {
        
        DataManager.shared.saveMovie(movie: modelOverview.movie)
        
        sender.toggle()
        
    }
    
    
}
