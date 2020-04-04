//
//  PencarianFilmViewController.swift
//  YukPlay
//
//  Created by Agus Cahyono on 29/03/20.
//  Copyright © 2020 Agus Cahyono. All rights reserved.
//

import UIKit
import ViewAnimator

class PencarianFilmViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var searchController: UISearchController!
    
    lazy var sections: [Sections] = []
    
    lazy var collectionViewLayout: UICollectionViewLayout = {
        var sections = self.sections
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, environment) -> NSCollectionLayoutSection? in
            return sections[sectionIndex].layoutSection()
        }
        return layout
    }()
    
    lazy var emptyView: EmptyView = {
        var empty = EmptyView()
        empty.titleView.text = "Mau nonton apa ?"
        empty.descriptionView.text = "Ketik aja nama film atau series yang mau kamu tonton di YukPlay"
        empty.imageView.image = #imageLiteral(resourceName: "ic_search")
        return empty
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
        collectionView.backgroundView = self.emptyView
        addNavigationbar()
        self.view.addSubview(indicator)
    }
    
    func addNavigationbar() {
        self.searchController = UISearchController(searchResultsController:  nil)
        self.searchController.searchResultsUpdater = self
        self.searchController.delegate = self
        self.searchController.searchBar.delegate = self
        self.searchController.hidesNavigationBarDuringPresentation = false
        self.searchController.showsSearchResultsController = true
        self.searchController.obscuresBackgroundDuringPresentation = false
        self.searchController.searchBar.placeholder = "Cari film atau serial"
        self.searchController.searchBar.returnKeyType = .search
        self.navigationItem.titleView = searchController.searchBar
        self.definesPresentationContext = false
    }
    
    fileprivate func setupCollectionView() {
        collectionView.collectionViewLayout = collectionViewLayout
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(ShowCaseBannerCell.self)
        collectionView.register(SectionTitleCell.self)
    }
    
    func doSearchFilm() {
        collectionView.backgroundView = nil
        indicator.startAnimating()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.sections = [
                GridFilmSection(countData: 20, column: 2)
            ]
            self.indicator.stopAnimating()
            self.setupCollectionView()
            self.collectionView.reloadData()
            self.collectionView.animate(animations: self.animations)
            
        }
    }
    
}

extension PencarianFilmViewController: UICollectionViewDataSource {
    
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

extension PencarianFilmViewController: UICollectionViewDelegate {}

extension PencarianFilmViewController: UISearchControllerDelegate, UISearchBarDelegate, UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
       
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.searchController.searchBar.text = searchController.searchBar.text
        self.doSearchFilm()
    }
    
}
