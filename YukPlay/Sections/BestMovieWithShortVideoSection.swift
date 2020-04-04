//
//  BestMovieWithShortVideoSection.swift
//  YukPlay
//
//  Created by Agus Cahyono on 02/04/20.
//  Copyright © 2020 Agus Cahyono. All rights reserved.
//

import UIKit

struct BestMovieWithShortVideoSection: Sections {
    
    var numberOfItems = 1
     var canHandleNavigation = false
    
    func layoutSection() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                             heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 4, leading: 0, bottom: 0, trailing: 4)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .fractionalWidth(1.25))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                         subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        return section
    }
    
    func configureCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        let cell: SectionWithShortVideoCell = collectionView.dequeueReusableCell(for: indexPath)
        return cell
    }
    
    func reuseIdentifier() -> String {
        SectionWithShortVideoCell.defaultReuseIdentifier
    }
    
    
}
