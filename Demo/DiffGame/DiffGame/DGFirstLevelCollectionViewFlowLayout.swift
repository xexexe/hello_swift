//
//  DGFirstLevelCollectionViewFlowLayout.swift
//  DiffGame
//
//  Created by Mark Ran on 2017/8/22.
//  Copyright © 2017年 markran. All rights reserved.
//

import UIKit

class DGFirstLevelCollectionViewFlowLayout: UICollectionViewFlowLayout {
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        var contentFrame: CGRect = CGRect.init()
        contentFrame.size = (collectionView?.frame.size)!
        contentFrame.origin = proposedContentOffset
        
        let array = layoutAttributesForElements(in: contentFrame)
        
        var minCenterX = CGFloat.greatestFiniteMagnitude
        let collectionViewCenterX = proposedContentOffset.x + collectionView!.frame.size.width*0.5
        for attrs in array! {
            if abs(attrs.center.x - collectionViewCenterX) < abs(minCenterX) {
                minCenterX = attrs.center.x - collectionViewCenterX
            }
        }
        var x:CGFloat = proposedContentOffset.x + minCenterX
        if  x <= 0 {
            x = 0
        } else {
            x -= 1
        }
        let point = CGPoint.init(x: x, y: proposedContentOffset.y)
        return point
    }
}
