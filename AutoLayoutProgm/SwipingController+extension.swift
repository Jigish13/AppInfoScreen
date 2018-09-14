//
//  SwipingController+extension.swift
//  AutoLayoutProgm
//
//  Created by Sneh on 11/09/18.
//  Copyright © 2018 The Gateway Corp. All rights reserved.
//

import UIKit

extension SwipingController{
    //MARK: Code to handle screen orientation
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        
        coordinator.animate(
            alongsideTransition: { (_) in
                self.collectionViewLayout.invalidateLayout()
                
                //There is bug in iPhone X for first page...
                if self.pageControl.currentPage == 0 {
                    self.collectionView?.contentSize = .zero
                }
                else{
                    let indexPath = IndexPath(item: self.pageControl.currentPage, section: 0)
                    self.collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
                }
        },
            completion: { (_) in
                
        })
    }
}
