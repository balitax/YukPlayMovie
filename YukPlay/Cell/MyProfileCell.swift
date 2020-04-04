//
//  MyProfileCell.swift
//  YukPlay
//
//  Created by Agus Cahyono on 29/03/20.
//  Copyright © 2020 Agus Cahyono. All rights reserved.
//

import UIKit

class MyProfileCell: UICollectionViewCell {
    
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var fullname: UILabel!
    @IBOutlet weak var email: UILabel!
    
    @IBOutlet weak var containerView: UIView!
    
    override var isSelected: Bool {
        didSet {
            self.containerView.backgroundColor = isSelected ? UIColor.darkGray : UIColor(hexString: "#1C1C1C")
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.imgProfile.layer.cornerRadius = self.imgProfile.frame.size.width / 2
        self.imgProfile.clipsToBounds = true
        
    }
    
}

extension MyProfileCell: ReusableView, NibLoadableView { }
