//
//  SpaceBetweenSection.swift
//  YukPlay
//
//  Created by Agus Cahyono on 29/03/20.
//  Copyright © 2020 Agus Cahyono. All rights reserved.
//

import UIKit

struct SpaceBetweenSection: Sections {
    
    var numberOfItems = 1
    var canHandleNavigation = false
    
    private var height: CGFloat
    
    init(height: CGFloat) {
        self.height = height
    }
    
    func layoutSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(self.height))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 18, leading: 0, bottom: 18, trailing: 0)
        return section
    }
    
    func configureCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        let cell: SpaceBetweenCell = collectionView.dequeueReusableCell(for: indexPath)
        return cell
    }
    
    func reuseIdentifier() -> String {
        SpaceBetweenCell.defaultReuseIdentifier
    }
    
    
}
