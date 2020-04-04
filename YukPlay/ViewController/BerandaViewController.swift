//
//  BerandaViewController.swift
//  YukPlay
//
//  Created by Agus Cahyono on 28/03/20.
//  Copyright © 2020 Agus Cahyono. All rights reserved.
//

import UIKit
import ViewAnimator

class BerandaViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var sections: [Sections] = []
    
    lazy var collectionViewLayout: UICollectionViewLayout = {
        var sections = self.sections
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, environment) -> NSCollectionLayoutSection? in
            return sections[sectionIndex].layoutSection()
        }
        return layout
    }()
    
    private lazy var indicator : UIActivityIndicatorView = {
        let _indicator = UIActivityIndicatorView()
        _indicator.color = .white
        _indicator.style = .large
        _indicator.hidesWhenStopped = true
        _indicator.center = self.view.center
        return _indicator
    }()
    
    private let animations: [AnimationType] = {
        let animation = [AnimationType.from(direction: .bottom, offset: 30.0)]
        return animation
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(indicator)
        indicator.startAnimating()
        
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            self.sections = [
                BannerSlideFeatureSection(self),
//                SectionTitleSection(title: "YukPlay Eksklusif"),
//                FeaturedMovieVerticalSection(),
//                SectionTitleSection(title: "Baru ditambahkan", showAllHide: true),
//                FeaturedMovieVerticalSection(),
//                SectionTitleSection(title: "Trailer Pendek", showAllHide: true),
//                FeaturedMovie2ColumnSection(),
//                SectionTitleSection(title: "Tontonan Pilihan Keluarga", showAllHide: true),
//                BestMovieWithShortVideoSection(),
//                SectionTitleSection(title: "Cocok buat #DiRumahAja", showAllHide: true),
//                FeaturedMovieVerticalSection(),
            ]
            self.indicator.stopAnimating()
            self.setupCollectionView()
            self.collectionView.reloadData()
            self.collectionView.animate(animations: self.animations)
            
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        let logo = UIImage(named: "logo")
        let imageView = UIImageView(image:logo)
        self.navigationItem.titleView = imageView
    }
    
    fileprivate func setupCollectionView() {
        collectionView.collectionViewLayout = collectionViewLayout
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(ShowCaseBannerCell.self)
        collectionView.register(SectionTitleCell.self)
        collectionView.register(BannerSlideFeaturedCell.self)
        collectionView.register(SectionWithShortVideoCell.self)
    }
    
}

extension BerandaViewController: UICollectionViewDataSource {
    
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
        if sections[indexPath.section].canHandleNavigation {
            let detail = self.storyboard?.instantiateViewController(identifier: "detail") as! DetailFilmViewController
            self.navigationController?.pushViewController(detail, animated: true)
            collectionView.deselectItem(at: indexPath, animated: true)
        }
    }
    
}

extension BerandaViewController: UICollectionViewDelegate {}

