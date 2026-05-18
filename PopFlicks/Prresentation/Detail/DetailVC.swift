//
//  DetailVC.swift
//  PopFlicks
//
//  Created by Phycom on 18/05/26.
//

import UIKit

class DetailVC: UIViewController {
    //MARK: Outlet
    @IBOutlet weak var collView: UICollectionView!
    
    //MARK: Variables
    var movieID:Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    private func setupCollectionView() {
//        let nib = UINib(nibName: "CastCell", bundle: nil)
//        collView.register(
//            nib,
//            forCellWithReuseIdentifier: "CastCell"
//        )
    }
    
}

extension DetailVC:UICollectionViewDataSource,UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "", for: indexPath) as? CastCell
        
        return cell!
    }
    
    
}
                        
                        
                        
                        

