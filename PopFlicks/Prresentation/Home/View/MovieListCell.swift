//
//  MovieListCell.swift
//  PopFlicks
//
//  Created by Phycom on 18/05/26.
//

import UIKit
import SDWebImage

class MovieListCell: UITableViewCell {
    
    //MARK: INOutlet
    @IBOutlet weak var lblRating: UILabel!
    @IBOutlet weak var lblreleaseYear: UILabel!
    @IBOutlet weak var lblMovieName: UILabel!
    @IBOutlet weak var imgViewposter: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        setupImageView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @MainActor
    func setupImageView(){
        self.imgViewposter.layer.cornerRadius = self.imgViewposter.frame.size.height / 2.0
    }
    
    @MainActor
    func configureCell(movieData:Result){
        self.lblMovieName.text = movieData.title
        self.lblreleaseYear.text = "Release Date \(movieData.releaseDate)"
        self.lblRating.text = "Rating: \(movieData.voteAverage)"
        self.imgViewposter.sd_setImage(with: URL(string: movieData.posterPath), placeholderImage: nil)
    }
    
}
