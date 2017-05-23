//
//  SampleCollectionViewFlowLayout.swift
//  SampleCollectionView
//
//  Created by Rameez khan  on 26/04/17.
//  Copyright © 2017 Rameez khan . All rights reserved.
//

import UIKit

class SampleCollectionViewFlowLayout: UICollectionViewFlowLayout {
  override init() {
    super.init()
    setUpLayout()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setUpLayout()
  }
  
  override var itemSize: CGSize {
    set {}
    get {
      if UIApplication.shared.statusBarOrientation.isPortrait {
        let itemWidth = ((self.collectionView?.bounds.width)! / 2.0) - self.minimumLineSpacing - minimumInteritemSpacing
        return CGSize(width: itemWidth, height: itemWidth)
      }
      let itemWidth = ((self.collectionView?.bounds.width)! / 3.0) - self.minimumLineSpacing - minimumInteritemSpacing
      return CGSize(width: itemWidth, height: itemWidth)
    }
  }
  
  func setUpLayout() {
    minimumInteritemSpacing = 0
    minimumLineSpacing = 1.0
    scrollDirection = .vertical
  }
  
  override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
    return true
  }
}
