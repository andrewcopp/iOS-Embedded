//
//  LeftAlignedCollectionViewFlowLayout.swift
//  Embedded
//
//  Created by Andrew Copp on 5/19/16.
//  Copyright © 2016 Andrew Copp. All rights reserved.
//

import UIKit

class LeftAlignedCollectionViewFlowLayout: UICollectionViewFlowLayout {

    override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var layoutAttributes = super.layoutAttributesForElementsInRect(rect)
        
        layoutAttributes?.forEach { currentLayoutAttributes in
            if let index = layoutAttributes?.indexOf(currentLayoutAttributes) where index > 0, let previousLayoutAttributes = layoutAttributes?[index - 1] {
                let previousFrame = previousLayoutAttributes.frame
                let currentFrame = currentLayoutAttributes.frame
                if CGRectGetMinX(previousFrame) < CGRectGetMinX(currentFrame) {
                    let nextFrame = CGRect(origin: CGPoint(x: CGRectGetMaxX(previousFrame) + 4.0, y: CGRectGetMinY(currentFrame)), size: currentFrame.size)
                    currentLayoutAttributes.frame = nextFrame
                }
            }
        }
        
        return layoutAttributes
    }
    
}
