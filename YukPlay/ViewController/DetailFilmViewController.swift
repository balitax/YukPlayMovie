//
//  DetailFilmViewController.swift
//  YukPlay
//
//  Created by Agus Cahyono on 03/04/20.
//  Copyright © 2020 Agus Cahyono. All rights reserved.
//

import UIKit

class DetailFilmViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var kTableHeaderHeight:CGFloat = 200.0
    var headerView: UIView!
    var lastContentOffset: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        self.navBarBgAlpha = 0
        self.navBarTintColor = UIColor.white
        
        let backButton = UIBarButtonItem()
        backButton.title = ""
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func registerCell() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = UIColor.defaultNavBarTintColor
        self.view.backgroundColor = UIColor.defaultNavBarTintColor
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.register(DescriptionMovieCell.self)
        tableView.register(MoreMovieGridListCell.self)
        
        headerView = tableView.tableHeaderView
        tableView.tableHeaderView = nil
        tableView.addSubview(headerView)
        tableView.contentInset = UIEdgeInsets(top: kTableHeaderHeight, left: 0, bottom: 0, right: 0)
        tableView.contentOffset = CGPoint(x: 0, y: -kTableHeaderHeight)
    }
    
    func updateHeaderView() {
        var headerRect = CGRect(x: 0, y: -kTableHeaderHeight, width: tableView.bounds.width, height: kTableHeaderHeight)
        if tableView.contentOffset.y < -kTableHeaderHeight {
            headerRect.origin.y = tableView.contentOffset.y
            headerRect.size.height = -tableView.contentOffset.y
        }
        headerView.frame = headerRect
    }
    
}

extension DetailFilmViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell: DescriptionMovieCell = tableView.dequeueReusableCell(for: indexPath)
            cell.selectionStyle = .none
            return cell
        } else {
            let cell: MoreMovieGridListCell = tableView.dequeueReusableCell(for: indexPath)
            cell.collectionView.reloadData()
            cell.sections = [ GridFilmSection(countData: 11, column: 3) ]
            cell.selectionStyle = .none
            return cell
        }
    }
    
    //MARK:UIScrollViewDelegate
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let contentOffsetY = scrollView.contentOffset.y
        let showNavBarOffsetY = (100 -  view.safeAreaInsets.top) - kTableHeaderHeight
        
        self.updateHeaderView()
        
        //navigationBar alpha
        if contentOffsetY > showNavBarOffsetY  {
            var navAlpha = (contentOffsetY - (showNavBarOffsetY)) / 40.0
            if navAlpha > 1 {
                navAlpha = 1
            }
            navBarBgAlpha = navAlpha
            if navAlpha > 0.8 {
                navBarTintColor = UIColor.white
            } else{
                navBarTintColor = UIColor.white
            }
            self.navigationItem.title = "Avenger War of Final II"
        } else {
            navBarBgAlpha = 0
            self.navigationItem.title = ""
            navBarTintColor = UIColor.white
        }
    }
    
    
}
