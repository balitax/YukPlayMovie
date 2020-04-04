//
//  MoreMovieGridListCell.swift
//  YukPlay
//
//  Created by Agus Cahyono on 03/04/20.
//  Copyright © 2020 Agus Cahyono. All rights reserved.
//

import UIKit

class MoreMovieGridListCell: UITableViewCell, ReusableView, NibLoadableView {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var heightCollection: NSLayoutConstraint!
    
    var sections = [Sections]() {
        didSet {
            setupCollectionView()
        }
    }
    
    lazy var collectionViewLayout: UICollectionViewLayout = {
        var sections = self.sections
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, environment) -> NSCollectionLayoutSection? in
            return sections[sectionIndex].layoutSection()
        }
        return layout
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    fileprivate func setupCollectionView() {
        collectionView.collectionViewLayout = collectionViewLayout
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.isScrollEnabled = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(ShowCaseBannerCell.self)
        collectionView.register(SectionTitleCell.self)
        
        collectionView.reloadData()
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            self.collectionView.layoutIfNeeded()
            self.heightCollection.constant = self.collectionView.contentSize.height
        }
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension MoreMovieGridListCell: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        sections[section].numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        sections[indexPath.section].configureCell(collectionView: collectionView, indexPath: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
}

extension MoreMovieGridListCell: UICollectionViewDelegate {}
