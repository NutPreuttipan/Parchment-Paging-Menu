//
//  ViewController.swift
//  PageMenu
//
//  Created by Preuttipan Janpen on 3/1/2562 BE.
//  Copyright © 2562 Lphant Solutions. All rights reserved.
//

import UIKit
import Parchment

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var viewPageMenu: UIView!
    
    let pagingTitle = ["Page1","Page2"]
    
    let viewPageMenuController = [View1ViewController(),View2ViewController()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let firstViewController = storyboard.instantiateViewController(withIdentifier: "page1") as! View1ViewController
        let secondViewController = storyboard.instantiateViewController(withIdentifier: "page2") as! View2ViewController
        
        let pagingViewController = FixedPagingViewController(viewControllers: [
            firstViewController,
            secondViewController
            ])
        
        pagingViewController.textColor = UIColor.red
        pagingViewController.selectedTextColor = UIColor.blue
        pagingViewController.borderColor = UIColor.purple
        pagingViewController.indicatorColor = UIColor.yellow
        
        addChild(pagingViewController)
        viewPageMenu.addSubview(pagingViewController.view)
        pagingViewController.didMove(toParent: self)
        pagingViewController.view.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            pagingViewController.view.leadingAnchor.constraint(equalTo: viewPageMenu.leadingAnchor),
            pagingViewController.view.trailingAnchor.constraint(equalTo: viewPageMenu.trailingAnchor),
            pagingViewController.view.bottomAnchor.constraint(equalTo: viewPageMenu.bottomAnchor),
            pagingViewController.view.topAnchor.constraint(equalTo: viewPageMenu.topAnchor)
            ])

//        let pagingViewController = PagingViewController<PagingIndexItem>()
//        pagingViewController.dataSource = self
      
    }
    
//    func numberOfViewControllers<T>(in pagingViewController: PagingViewController<T>) -> Int where T : PagingItem, T : Comparable, T : Hashable {
//        return 2
//    }
//
//    func pagingViewController<T>(_ pagingViewController: PagingViewController<T>, viewControllerForIndex index: Int) -> UIViewController where T : PagingItem, T : Comparable, T : Hashable {
//        return viewPageMenuController[index]
//    }
//
//    func pagingViewController<T>(_ pagingViewController: PagingViewController<T>, pagingItemForIndex index: Int) -> T where T : PagingItem, T : Comparable, T : Hashable {
//        return PagingIndexItem(index: index, title: pagingTitle[index]) as! T
//    }

}

