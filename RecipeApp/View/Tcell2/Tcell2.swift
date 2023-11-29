//
//  Tcell2.swift
//  RecipeApp
//
//  Created by Varun Sharma on 30/08/23.
//

import UIKit

class Tcell2: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var herbs = ["Cilantro (Coriander)",
                 "Mint",
                 "Curry Leaves"
                 ]
    
    
    
    var noimageImages = [UIImage(named: "cor"),UIImage(named: "mint"),UIImage(named: "curry")]
    

    @IBOutlet weak var collection2: UICollectionView!
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        herbs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! CollectionViewCell
        
        cell.collectionImage.image = noimageImages[indexPath.row]
        cell.collectionLabel.text = herbs[indexPath.row]
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth: CGFloat = 300 // Specify your desired width
        let cellHeight: CGFloat = 300 // Specify your desired height
        
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if let cell = collectionView.cellForItem(at: indexPath) {
                    cell.layer.borderColor = UIColor.red.cgColor // Change border color on selection
                    cell.layer.borderWidth = 2.0
                }
        confirmationModel.veggies.append(herbs[indexPath.row])
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
        if let cell = collectionView.cellForItem(at: indexPath) {
               cell.layer.borderColor = UIColor.clear.cgColor // Reset border color on deselection
               cell.layer.borderWidth = 0.0
           }
        
        
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        collection2.showsVerticalScrollIndicator = false
        collection2.showsHorizontalScrollIndicator = false
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 20 // Set the vertical spacing between rows
        layout.minimumInteritemSpacing = 20
        layout.itemSize = CGSize(width: 100, height: 100)
        
        collection2.collectionViewLayout = layout
        
        collection2.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "collectionCell")
        collection2.delegate = self
        collection2.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
