//
//  SectionTitleSection.swift
//  YukPlay
//
//  Created by Agus Cahyono on 28/03/20.
//  Copyright © 2020 Agus Cahyono. All rights reserved.
//

import UIKit

struct SectionTitleSection: Sections {
    
    var numberOfItems = 1
     var canHandleNavigation = false
    
    private let title: String
    private var showAllHide: Bool = false
    private var height: CGFloat
    
    init(height:CGFloat = 30, title: String, showAllHide: Bool = false) {
        self.title = title
        self.showAllHide = showAllHide
        self.height = height
    }
    
    func layoutSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(self.height))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        return section
    }
    
    func configureCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        let cell: SectionTitleCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.titleSection.text = title
        cell.btnShowAll.isHidden = self.showAllHide
        return cell
    }
    
    func reuseIdentifier() -> String {
        return SectionTitleCell.defaultReuseIdentifier
    }
    
}
