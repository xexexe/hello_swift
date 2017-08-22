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
    
    let firstLevelCellId = "DGFirstLevelCollectionViewCell"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        levelCollectionView.register(UINib.init(nibName: "DGFirstLevelCollectionViewCell",
                                                bundle: nil),
                                     forCellWithReuseIdentifier: firstLevelCellId)
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

}

extension DGMainViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    
    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: firstLevelCellId, for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showGameView", sender: indexPath.row)
    }
}
