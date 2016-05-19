//
//  LikedContentSummaryViewManager.swift
//  Embedded
//
//  Created by Andrew Copp on 5/19/16.
//  Copyright © 2016 Andrew Copp. All rights reserved.
//

import UIKit

class LikedContentSummaryViewManager: NSObject, UICollectionViewDataSource {

    @IBOutlet var likedContentSummaryView: UICollectionView!

    var subdataSources: [MultiplePhotoDataSource] = []
    
    let likedContent: [NSObject]
    
    init(likedContent: [NSObject]) {
        self.likedContent = likedContent
        
        super.init()
        
        let object = NSBundle.mainBundle().loadNibNamed("LikedContentSummaryView", owner: self, options: nil)
        
        likedContentSummaryView = object.first as? UICollectionView
        likedContentSummaryView.registerNib(UINib(nibName: "SinglePhotoCell", bundle: NSBundle.mainBundle()), forCellWithReuseIdentifier: "SinglePhotoCell")
        likedContentSummaryView.registerNib(UINib(nibName: "MultiplePhotoCell", bundle: NSBundle.mainBundle()), forCellWithReuseIdentifier: "MultiplePhotoCell")
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return likedContent.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        if let color = likedContent[indexPath.row] as? UIColor {
            let singlePhotoCell = collectionView.dequeueReusableCellWithReuseIdentifier("SinglePhotoCell", forIndexPath: indexPath) as! SinglePhotoCell
            singlePhotoCell.photoView.backgroundColor = color
            return singlePhotoCell
        } else if let colors = likedContent[indexPath.row] as? [UIColor] {
            let multiplePhotoCell = collectionView.dequeueReusableCellWithReuseIdentifier("MultiplePhotoCell", forIndexPath: indexPath) as! MultiplePhotoCell
            multiplePhotoCell.photoCollectionView.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
            
            if let index = subdataSources.indexOf({ $0.colors == likedContent[indexPath.row] }) {
                multiplePhotoCell.photoCollectionView.dataSource = subdataSources[index]
            } else {
                let multiplePhotoDataSource = MultiplePhotoDataSource(colors: colors)
                subdataSources.append(multiplePhotoDataSource)
                multiplePhotoCell.photoCollectionView.dataSource = multiplePhotoDataSource
                multiplePhotoCell.photoCollectionView.delegate = multiplePhotoDataSource
            }
            
            return multiplePhotoCell
        } else {
            fatalError()
        }
        
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let color = likedContent[indexPath.row] as? UIColor
        let height: CGFloat
        if color != nil {
            height = 168.0
        } else {
            let width: CGFloat = collectionView.bounds.size.width - 36.0
            let itemsPerRow = floor((width - 40.0) / 44.0) + 1.0
            let numberOfRows = ceil(CGFloat((likedContent[indexPath.row] as! [UIColor]).count) / itemsPerRow)
            height = numberOfRows * 40.0 + (numberOfRows - 1) * 4.0
        }
        return CGSize(width: CGRectGetWidth(collectionView.bounds), height: height)
    }
    
}
