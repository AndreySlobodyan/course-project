

import UIKit
import SDWebImage
import youtube_ios_player_helper

class OverviewViewController: UIViewController {
    
    
    var modelOverview: ModelOverviewViewController = ModelOverviewViewController()
    
    @IBOutlet weak var videoPlayer: YTPlayerView!
    
    @IBOutlet weak var posterImage: UIImageView!
    
    @IBOutlet weak var titlelabel: UILabel!
    
    @IBOutlet weak var overiewLabel: UILabel!
    
    @IBOutlet weak var likeButton: ModelOverviewViewController!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        navigationController?.isNavigationBarHidden = true
        posterImage.layer.cornerRadius = 25
        titlelabel.textColor = UIColor.white
        titlelabel.text = modelOverview.movie?.title
            overiewLabel.textColor = UIColor.white
        overiewLabel.text = modelOverview.movie?.overview
            
        
        
        modelOverview.getImageURL { imageURL in
            self.posterImage.sd_setImage(with: imageURL)
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
