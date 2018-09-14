//
//  SwipingController+UICollectionView.swift
//  AutoLayoutProgm
//
//  Created by Sneh on 11/09/18.
//  Copyright © 2018 The Gateway Corp. All rights reserved.
//

import UIKit

extension SwipingController{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0 //By default 10 hoi che so cells na vache 10 ni space dekhai in Grid system...
    }
    
    //CollectionView is sections of items...
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //return 4 //returning No. of items in section
        return pages.count
    }
    
    //Map each items with cell's
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath) as! PageCell //Coz it is PageCell only so it wont crash app...
        
        //cell.backgroundColor = indexPath.item % 2 == 0 ? .red : .green // indexPath.item means indexPath pr je item hse enu index...
        
        //MARK: Control of code will go to Pagecell from here...
        // To check above control or flow, go to Pagecell and add breakpoint in viewDidLoad...00
        
        //NOTE: Dont try this, it is a very bad idea..bcoz after dequeing a cell and recycling it, it will again add imageView
        //        let imageView = UIImageView()
        //        cell.addSubview(imageView)
        
        
        //NOTE: This code is to set diff img's on diff. pages...
        //        let imageName = imageNames[indexPath.item]
        //        cell.myImageView.image = UIImage(named: imageName)
        //        cell.descTextView.text = headerStrigns[indexPath.item]
        
        
        //After using MODEL...
        //        let page = pages[indexPath.item] //Not accessible as it is private
        //        cell.myImageView.image = UIImage(named: page.imageName) //Not accessible as it is private
        //        cell.descTextView.text = page.headerText //Not accessible as it is private (So pass the model obj to view i.e. go to PageCell)
        
        //After seprating view and model...
        let page = pages[indexPath.item]
        cell.page = page
        
        return cell
    }
    
    //For giving size of each item's in collection view
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //return CGSize(width: 100, height: 100)
        return CGSize(width: view.frame.width, height: view.frame.height) //Returns cell of entire screen size
    }
}
