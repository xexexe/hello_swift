//
//  DGMainViewController.swift
//  DiffGame
//
//  Created by Mark Ran on 2017/8/22.
//  Copyright © 2017年 markran. All rights reserved.
//

import UIKit

class DGMainViewController: UIViewController {
    
    @IBOutlet weak var levelCollectionView: UICollectionView!
    @IBOutlet weak var detailLevelCollectionView: UICollectionView!
    
    let firstLevelCellId = "DGFirstLevelCollectionViewCell"
    let secondLevelCellId = "DGSecondLevelCollectionViewCell"
    
    var levelFlowLayout:DGFirstLevelCollectionViewFlowLayout!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        levelCollectionView.register(UINib.init(nibName: firstLevelCellId ,bundle: nil),
                                     forCellWithReuseIdentifier: firstLevelCellId)
        detailLevelCollectionView.register(UINib.init(nibName: secondLevelCellId, bundle: nil),
                                           forCellWithReuseIdentifier: secondLevelCellId)
        
        initLevelFirstFlowLayout()
        levelCollectionView.collectionViewLayout = levelFlowLayout
//        levelCollectionView.decelerationRate = 0.2
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    func initLevelFirstFlowLayout() {
        levelFlowLayout = DGFirstLevelCollectionViewFlowLayout()
        let screenW = UIScreen.main.bounds.width
        let itemSize = CGSize(width: 400, height: 200)
        let space = screenW - itemSize.width
        levelFlowLayout.itemSize = itemSize
        levelFlowLayout.scrollDirection = .horizontal
        levelFlowLayout.minimumLineSpacing = space
        let inset = (screenW - itemSize.width) * 0.5
        levelFlowLayout.sectionInset = UIEdgeInsetsMake(0, inset, 0, inset)
    }
}

extension DGMainViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == detailLevelCollectionView {
            return 80
        }
        return 3
    }
    
    
    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == detailLevelCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: secondLevelCellId, for: indexPath)
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: firstLevelCellId, for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showGameView", sender: indexPath.row)
    }
}
