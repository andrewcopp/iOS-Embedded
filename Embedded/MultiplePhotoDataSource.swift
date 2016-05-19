//
//  MultiplePhotoDataSource.swift
//  Embedded
//
//  Created by Andrew Copp on 5/19/16.
//  Copyright © 2016 Andrew Copp. All rights reserved.
//

import UIKit

class MultiplePhotoDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    let colors: [UIColor]
    
    init(colors: [UIColor]) {
        self.colors = colors
        super.init()
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath)
        
        cell.backgroundColor = colors[indexPath.row]
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: 40.0, height: 40.0)
    }
    
}
