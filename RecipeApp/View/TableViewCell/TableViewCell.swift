//
//  TableViewCell.swift
//  RecipeApp
//
//  Created by Varun Sharma on 30/08/23.
//

import UIKit

class TableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var labels = ["onion", "tomato", "potato"]
    
    
    var collectionImages = [UIImage(named: "onion"), UIImage(named: "tomato"), UIImage(named: "potato"),]
    
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! CollectionViewCell
        
        cell.collectionImage.image = collectionImages[indexPath.row]
        cell.collectionLabel.text = labels[indexPath.row]
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
        
        confirmationModel.veggies.append(labels[indexPath.row])
        
        
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
        
        collectionView.showsVerticalScrollIndicator = false
        
        collectionView.showsHorizontalScrollIndicator = false
        
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 20 // Set the vertical spacing between rows
        layout.minimumInteritemSpacing = 20
        layout.itemSize = CGSize(width: 100, height: 100)
        collectionView.collectionViewLayout = layout
        
        collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "collectionCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
