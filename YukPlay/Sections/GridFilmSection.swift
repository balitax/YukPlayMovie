//
//  GridFilmSection.swift
//  YukPlay
//
//  Created by Agus Cahyono on 29/03/20.
//  Copyright © 2020 Agus Cahyono. All rights reserved.
//

import UIKit

struct GridFilmSection: Sections {
    
    var numberOfItems = 0
    var canHandleNavigation = true
    var column: Int = 0
    
    init(countData: Int, column: Int) {
        self.numberOfItems = countData
        self.column = column
    }
    
    func layoutSection() -> NSCollectionLayoutSection {
        
        var setWidthColumn: CGFloat = 0
        var setHeight: CGFloat = 0
        if column == 2 {
            setWidthColumn = 0.5
            setHeight = 0.75
        } else if column == 3 {
            setWidthColumn = 0.33
            setHeight = 0.5
        } else {
            setWidthColumn = 0.5
            setHeight = 0.75
        }
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(setWidthColumn),
                                             heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .fractionalWidth(setHeight))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                         subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 18, leading: 0, bottom: 18, trailing: 0)
        return section
    }
    
    func configureCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        let cell: ShowCaseBannerCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.imgBanner.layer.cornerRadius = 8
        cell.imgBanner.clipsToBounds = true
        return cell
    }
    
    func reuseIdentifier() -> String {
        ShowCaseBannerCell.defaultReuseIdentifier
    }
    
    
}
