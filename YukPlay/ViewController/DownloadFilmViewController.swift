//
//  DownloadFilmViewController.swift
//  YukPlay
//
//  Created by Agus Cahyono on 29/03/20.
//  Copyright © 2020 Agus Cahyono. All rights reserved.
//

import UIKit

class DownloadFilmViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    lazy var emptyView: EmptyView = {
        var empty = EmptyView()
        empty.titleView.text = "Pintu teater download telah dibuka"
        empty.descriptionView.text = "Semua film dan series yang telah kamu download nanti bakal kesimpen disini, ya."
        empty.imageView.image = #imageLiteral(resourceName: "ic_download")
        return empty
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationItem.title = "Download"
    }
    
    fileprivate func setupCollectionView() {
        collectionView.backgroundColor = .systemBackground
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundView = self.emptyView
        
    }
    
}

extension DownloadFilmViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        UICollectionViewCell()
    }
    
}

extension DownloadFilmViewController: UICollectionViewDelegate { }

