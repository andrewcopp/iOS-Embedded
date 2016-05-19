//
//  ViewController.swift
//  Embedded
//
//  Created by Andrew Copp on 5/19/16.
//  Copyright © 2016 Andrew Copp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let items = [UIColor.redColor(), [UIColor.orangeColor(), UIColor.yellowColor(), UIColor.greenColor(), UIColor.magentaColor(), UIColor.cyanColor(), UIColor.grayColor()], UIColor.blueColor(), UIColor.purpleColor()]

    var likedContentSummaryViewManager: LikedContentSummaryViewManager?
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        likedContentSummaryViewManager = LikedContentSummaryViewManager(likedContent: items)
        
        let likedContentSummaryView = likedContentSummaryViewManager?.likedContentSummaryView
        likedContentSummaryView?.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(likedContentSummaryView!)
        
        view.addConstraint(NSLayoutConstraint(item: likedContentSummaryView!, attribute: .Top, relatedBy: .Equal, toItem: topLayoutGuide, attribute: .Top, multiplier: 1.0, constant: 20.0))
        view.addConstraint(NSLayoutConstraint(item: likedContentSummaryView!, attribute: .CenterX, relatedBy: .Equal, toItem: view, attribute: .CenterX, multiplier: 1.0, constant: 0.0))
        view.addConstraint(NSLayoutConstraint(item: likedContentSummaryView!, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 260.0))
        view.addConstraint(NSLayoutConstraint(item: likedContentSummaryView!, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 260.0))
    }
    
}

