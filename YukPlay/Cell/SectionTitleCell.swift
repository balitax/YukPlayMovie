//
//  SectionTitleCell.swift
//  YukPlay
//
//  Created by Agus Cahyono on 28/03/20.
//  Copyright © 2020 Agus Cahyono. All rights reserved.
//

import UIKit

class SectionTitleCell: UICollectionViewCell, ReusableView, NibLoadableView {

    @IBOutlet weak var titleSection: UILabel!
    @IBOutlet weak var btnShowAll: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
