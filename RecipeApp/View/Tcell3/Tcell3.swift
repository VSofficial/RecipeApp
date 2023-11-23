//
//  Tcell2.swift
//  RecipeApp
//
//  Created by Varun Sharma on 30/08/23.
//

import UIKit

class Tcell3: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var extras = ["Oil",
                 "Oil",
                 "Spices"
                 ]
    
    
    
    var noimageImages = [UIImage(named: "oil"),UIImage(named: "oil"),UIImage(named: "spices")]
    

    @IBOutlet weak var collectionView3: UICollectionView!
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        extras.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView3.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! CollectionViewCell
        
        cell.collectionImage.image = noimageImages[indexPath.row]
        cell.collectionLabel.text = extras[indexPath.row]
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
        confirmationModel.extra.append(extras[indexPath.row])
        
        
        
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
        
        collectionView3.showsVerticalScrollIndicator = false
        collectionView3.showsHorizontalScrollIndicator = false
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 20 // Set the vertical spacing between rows
        layout.minimumInteritemSpacing = 20
        layout.itemSize = CGSize(width: 100, height: 100)
        
        collectionView3.collectionViewLayout = layout
        
        collectionView3.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "collectionCell")
        collectionView3.delegate = self
        collectionView3.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
