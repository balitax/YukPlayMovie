//
//  ListMenuCell.swift
//  YukPlay
//
//  Created by Agus Cahyono on 29/03/20.
//  Copyright © 2020 Agus Cahyono. All rights reserved.
//

import UIKit

class ListMenuCell: UICollectionViewCell {
    
    @IBOutlet weak var containerView: UIView!
    
    override var isSelected: Bool {
        didSet {
            self.containerView.backgroundColor = isSelected ? UIColor.darkGray : UIColor(hexString: "#1C1C1C")
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}

extension ListMenuCell: ReusableView, NibLoadableView { }
