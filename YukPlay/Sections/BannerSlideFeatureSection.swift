//
//  BannerSlideFeatureSection.swift
//  YukPlay
//
//  Created by Agus Cahyono on 29/03/20.
//  Copyright © 2020 Agus Cahyono. All rights reserved.
//

import UIKit

class BannerSlideFeatureSection: Sections {
    
    var numberOfItems = 1
    var canHandleNavigation = true
    var viewController: UIViewController!
    
    init(_ viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func layoutSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(0.8))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        let section = NSCollectionLayoutSection(group: group)
        
        return section
    }
    
    func configureCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        let cell: BannerSlideFeaturedCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.delegate = self
        return cell
    }
    
    func reuseIdentifier() -> String {
        return BannerSlideFeaturedCell.defaultReuseIdentifier
    }
    
    
}

extension BannerSlideFeatureSection: BannerSlideFeaturedDelegate {
    
    func didSelectedBannerFilm(_ id: Int) {
        let detail = viewController.storyboard?.instantiateViewController(identifier: "detail") as! DetailFilmViewController
        viewController.navigationController?.pushViewController(detail, animated: true)
    }
    
}
