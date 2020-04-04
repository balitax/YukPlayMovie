//
//  BannerSlideFeaturedCell.swift
//  YukPlay
//
//  Created by Agus Cahyono on 29/03/20.
//  Copyright © 2020 Agus Cahyono. All rights reserved.
//

import UIKit
import Kingfisher

let width = UIScreen.main.bounds.size.width
let height = UIScreen.main.bounds.size.height

protocol BannerSlideFeaturedDelegate: class {
    func didSelectedBannerFilm(_ id: Int)
}

class BannerSlideFeaturedCell: UICollectionViewCell {
    
    @IBOutlet weak var bannerSlide: ZCycleView!
    
    var urlImageBanner = [
        "https://upload.wikimedia.org/wikipedia/id/7/7a/Spider-Man_3%2C_International_Poster.jpg",
        "https://upload.wikimedia.org/wikipedia/id/7/7a/Spider-Man_3%2C_International_Poster.jpg",
        "https://upload.wikimedia.org/wikipedia/id/7/7a/Spider-Man_3%2C_International_Poster.jpg",
        "https://upload.wikimedia.org/wikipedia/id/7/7a/Spider-Man_3%2C_International_Poster.jpg"
    ]
    
    weak var delegate: BannerSlideFeaturedDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        bannerSlide.delegate = self
        bannerSlide.placeholderImage = #imageLiteral(resourceName: "placeholderImg")
        bannerSlide.setUrlsGroup(urlImageBanner)
        bannerSlide.itemSize = CGSize(width: width - 160, height: height / 2)
        bannerSlide.itemSpacing = 40
        bannerSlide.itemZoomScale = 1.1
        bannerSlide.timeInterval = 4
        
    }
    
}

extension BannerSlideFeaturedCell: ReusableView, NibLoadableView { }

extension BannerSlideFeaturedCell: ZCycleViewProtocol {
    
    func cycleViewConfigureDefaultCellImage(_ cycleView: ZCycleView, imageView: UIImageView, image: UIImage?, index: Int) {
        imageView.image = image
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
    }
    
    func cycleViewConfigureDefaultCellImageUrl(_ cycleView: ZCycleView, imageView: UIImageView, imageUrl: String?, index: Int) {
        imageView.setImageURL(imageUrl!)
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
    }
    
    func cycleViewConfigureDefaultCellText(_ cycleView: ZCycleView, titleLabel: UILabel, index: Int) {
        titleLabel.isHidden = true
    }
    
    func cycleViewConfigurePageControl(_ cycleView: ZCycleView, pageControl: ZPageControl) {
        pageControl.isHidden = true
    }
    
    func cycleViewDidSelectedIndex(_ cycleView: ZCycleView, index: Int) {
        self.delegate?.didSelectedBannerFilm(index)
    }
    
}
