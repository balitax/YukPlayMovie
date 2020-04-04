//
//  StretchyLayout.swift
//  YukPlay
//
//  Created by Agus Cahyono on 03/04/20.
//  Copyright © 2020 Agus Cahyono. All rights reserved.
//

import UIKit

class StretchyLayout: UICollectionViewFlowLayout {
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        let layoutAttributes = super.layoutAttributesForElements(in: rect)
        for layouts in layoutAttributes! {
            if layouts.representedElementKind == UICollectionView.elementKindSectionHeader {
                let offsetY =  collectionView?.contentOffset.y
                let heightY = layouts.frame.size.height - offsetY!
                layouts.frame = CGRect(x: 0, y: offsetY!, width: collectionView!.frame.size.width, height: heightY)
            }
        }
        return layoutAttributes
    }
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
}

