//
//  ViewController.swift
//  SampleCollectionView
//
//  Created by Rameez khan  on 26/04/17.
//  Copyright © 2017 Rameez khan . All rights reserved.
//

import UIKit

class ViewController: UIViewController , UICollectionViewDataSource, UICollectionViewDelegate{

  @IBOutlet weak var sampleCollectionView: UICollectionView!
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    sampleCollectionView.dataSource = self
    sampleCollectionView.delegate = self
    sampleCollectionView.register(UINib.init(nibName: "ImageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "Cell")
    NotificationCenter.default.addObserver(self, selector: #selector(orientationChanged(notification:)), name: Notification.Name.UIDeviceOrientationDidChange, object: nil)

  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func orientationChanged(notification: Notification) {
    sampleCollectionView.collectionViewLayout.invalidateLayout()
  }

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 10
  }
  
  // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
  @available(iOS 6.0, *)
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let collectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? ImageCollectionViewCell
    collectionViewCell?.hund.text = "blah"
    collectionViewCell?.cellImageview.backgroundColor = .green
    //Set image here
    //collectionViewCell?.cellImageView.image =
    return collectionViewCell!
  }

}

