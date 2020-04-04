//
//  AkunSayaViewController.swift
//  YukPlay
//
//  Created by Agus Cahyono on 29/03/20.
//  Copyright © 2020 Agus Cahyono. All rights reserved.
//

import UIKit
import SafariServices

class AkunSayaViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    lazy var sections: [Sections] = [
        SpaceBetweenSection(height: 1),
        ProfileUserSection(),
        SpaceBetweenSection(height: 1),
        SectionTitleSection(height: 30, title: "BAHASA", showAllHide: true),
        SpaceBetweenSection(height: 1),
        ListMenuSection(),
        SpaceBetweenSection(height: 1),
        SectionTitleSection(height: 30, title: "PENGATURAN", showAllHide: true),
        SpaceBetweenSection(height: 1),
        ListMenuSection(),
        ListMenuSection(),
        SpaceBetweenSection(height: 1),
        SectionTitleSection(height: 30, title: "BANTUAN", showAllHide: true),
        SpaceBetweenSection(height: 1),
        ListMenuSection(),
        ListMenuSection(),
        ListMenuSection(),
        SpaceBetweenSection(height: 1),
        CenterButtonSection(height: 30),
        SpaceBetweenSection(height: 1),
    ]
    
    lazy var collectionViewLayout: UICollectionViewLayout = {
        var sections = self.sections
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, environment) -> NSCollectionLayoutSection? in
            return sections[sectionIndex].layoutSection()
        }
        return layout
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationItem.title = "Akun Saya"
    }
    
    fileprivate func setupCollectionView() {
        collectionView.collectionViewLayout = collectionViewLayout
        collectionView.backgroundColor = UIColor(hexString: "#1C1C1C")
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(MyProfileCell.self)
        collectionView.register(SectionTitleCell.self)
        collectionView.register(ListMenuCell.self)
        collectionView.register(SpaceBetweenCell.self)
        collectionView.register(CenterButtonCell.self)
    }
    
}


extension AkunSayaViewController: UICollectionViewDataSource {
    
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

extension AkunSayaViewController: UICollectionViewDelegate {
    
    func showGoogle() {
        if let url = URL(string: "https://www.google.com") {
            let config = SFSafariViewController.Configuration()
            config.entersReaderIfAvailable = true
            let vc = SFSafariViewController(url: url, configuration: config)
            present(vc, animated: true)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if sections[indexPath.section].canHandleNavigation {
            self.showGoogle()
            collectionView.deselectItem(at: indexPath, animated: true)
        }
    }
}

