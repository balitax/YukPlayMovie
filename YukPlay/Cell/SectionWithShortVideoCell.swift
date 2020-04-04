//
//  SectionWithShortVideoCell.swift
//  YukPlay
//
//  Created by Agus Cahyono on 02/04/20.
//  Copyright © 2020 Agus Cahyono. All rights reserved.
//

import UIKit
import YoutubePlayerView
import AVFoundation


class SectionWithShortVideoCell: UICollectionViewCell {
    
    @IBOutlet weak var videoContainer: YoutubePlayerView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    lazy var sections: [Sections] = [
        FeaturedMovieVerticalOnShortVideo(),
    ]
    
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
        
        let playerVars: [String: Any] = [
            "controls": 1,
            "modestbranding": 1,
            "playsinline": 1,
            "origin": "https://youtube.com"
        ]
        videoContainer.delegate = self
        videoContainer.loadWithVideoId("aMVg3kxtrQs", with: playerVars)
        
        
        setupCollectionView()
        
    }
    
    fileprivate func setupCollectionView() {
        collectionView.collectionViewLayout = collectionViewLayout
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(ShowCaseBannerCell.self)
    }
    
}

extension SectionWithShortVideoCell: YoutubePlayerViewDelegate {
    
    func playerViewDidBecomeReady(_ playerView: YoutubePlayerView) {
        print("Ready")
        playerView.fetchPlayerState { (state) in
            print("Fetch Player State: \(state)")
        }
    }
    
    func playerView(_ playerView: YoutubePlayerView, didChangedToState state: YoutubePlayerState) {
        print("Changed to state: \(state)")
    }
    
    func playerView(_ playerView: YoutubePlayerView, didChangeToQuality quality: YoutubePlaybackQuality) {
        print("Changed to quality: \(quality)")
    }
    
    func playerView(_ playerView: YoutubePlayerView, receivedError error: Error) {
        print("Error: \(error)")
    }
    
    func playerView(_ playerView: YoutubePlayerView, didPlayTime time: Float) {
        print("Play time: \(time)")
    }
    
    func playerViewPreferredInitialLoadingView(_ playerView: YoutubePlayerView) -> UIView? {
        let view = UIView()
        view.backgroundColor = .darkGray
        return view
    }
}


extension SectionWithShortVideoCell: ReusableView, NibLoadableView { }

extension SectionWithShortVideoCell: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        sections[section].numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        sections[indexPath.section].configureCell(collectionView: collectionView, indexPath: indexPath)
    }
    
}

extension SectionWithShortVideoCell: UICollectionViewDelegate {}

