//
//  FeaturedMovieVerticalSection.swift
//  YukPlay
//
//  Created by Agus Cahyono on 28/03/20.
//  Copyright © 2020 Agus Cahyono. All rights reserved.
//

import UIKit

struct FeaturedMovieVerticalSection: Sections {
    
    var numberOfItems = 10
     var canHandleNavigation = true
    
    func layoutSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.3),
            heightDimension: .fractionalHeight(0.25))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
        
        return section
    }
    
    func configureCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        let cell: ShowCaseBannerCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.imgBanner.layer.cornerRadius = 8
        cell.imgBanner.clipsToBounds = true
        return cell
    }
    
    func reuseIdentifier() -> String {
        return ShowCaseBannerCell.defaultReuseIdentifier
    }
    
}
