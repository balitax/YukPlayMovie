//
//  ShowCaseBannerCell.swift
//  YukPlay
//
//  Created by Agus Cahyono on 28/03/20.
//  Copyright © 2020 Agus Cahyono. All rights reserved.
//

import UIKit
import Kingfisher

class ShowCaseBannerCell: UICollectionViewCell, ReusableView, NibLoadableView {

    @IBOutlet weak var imgBanner: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        imgBanner.layer.cornerRadius = 2
        imgBanner.clipsToBounds = true
        imgBanner.setImageURL(
            "https://m.media-amazon.com/images/M/MV5BMjMxNjY2MDU1OV5BMl5BanBnXkFtZTgwNzY1MTUwNTM@._V1_.jpg")
        
    }

}
