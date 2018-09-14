//
//  SwipingController.swift
//  AutoLayoutProgm
//
//  Created by Sneh on 11/09/18.
//  Copyright © 2018 The Gateway Corp. All rights reserved.
//

import UIKit

//PAGES = ITEMS = CELL's in CollectionView

class SwipingController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    // From here we go to AppDelegate File...
    
    //let imageNames = ["global_team","global_team","global_team"]
    //let headerStrigns = ["Join us today in our fun & games!", "Subscribe and get coupons on our daily events","VIP members special sevices"]
    //NOTE: If we remove the 3rd item from above array then prog. crashes and gives ERR = index out of range...
    //SOLUTION: So, MVC comes into picture.
    //Instead of using hardcoded data let us use Model i.e. Page
    
    let pages = [
        Page(imageName: "global_team", headerText: "Join us today in our fun & games!", bodyText: "Are you ready for loads and loads of fun? Dont wait for longer!! We hope to see you soon in our shop..."),
        Page(imageName: "global_team", headerText: "Subscribe and get coupons on our daily events", bodyText: "NO we ARE NOT ready for loads and loads of fun? Dont wait for longer!! We hope to see you soon in our shop... OK THANKS !"),
        Page(imageName: "global_team", headerText: "VIP members special sevices", bodyText: ""),
        Page(imageName: "global_team", headerText: "Join us today in our fun & games!", bodyText: "Are you ready for loads and loads of fun? Dont wait for longer!! We hope to see you soon in our shop..."),
        Page(imageName: "global_team", headerText: "Subscribe and get coupons on our daily events", bodyText: "NO we ARE NOT ready for loads and loads of fun? Dont wait for longer!! We hope to see you soon in our shop... OK THANKS !"),
        Page(imageName: "global_team", headerText: "VIP members special sevices", bodyText: "")]
    
    
    
    
    @objc private func handlePrev(){
        //print("Cclicked next...")
        
        let nextIndex = max(pageControl.currentPage - 1,0)
        
        //IndexPath of row nd section constructor is of table view, while item nd section is of collection view
        let indexPath = IndexPath(item: nextIndex, section: 0)
        
        pageControl.currentPage = nextIndex
        
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    private let previousButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("PREV", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.gray, for: .normal)
        button.addTarget(self, action: #selector(handlePrev), for: .touchUpInside)
        return button
    }()

    
    
    @objc private func handleNext(){
        //print("Cclicked next...")
        
        let nextIndex = min(pageControl.currentPage + 1,pages.count - 1)
        
        //IndexPath of row nd section constructor is of table view, while item nd section is of collection view
        let indexPath = IndexPath(item: nextIndex, section: 0)
        
        pageControl.currentPage = nextIndex
        
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("NEXT", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.mainPink, for: .normal)
        button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        return button
    }()
    
    lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = pages.count
        pc.currentPageIndicatorTintColor = .mainPink
        pc.pageIndicatorTintColor = UIColor(red: 249/255, green: 207/255, blue: 224/255, alpha: 1)
        return pc
    }()
    
    fileprivate func setupButtonControls(){
        let bottomControlsStackView = UIStackView(arrangedSubviews: [previousButton,pageControl,nextButton])
        bottomControlsStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bottomControlsStackView)
        
        bottomControlsStackView.distribution = .fillEqually

        NSLayoutConstraint.activate([
            bottomControlsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomControlsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomControlsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomControlsStackView.heightAnchor.constraint(equalToConstant: 50)
            ])
    }
    
    //To change page control focus as per changing pages, override the following...
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let x = targetContentOffset.pointee.x
        pageControl.currentPage = Int(x/view.frame.width)
        
        //print(x, view.frame.width, x/view.frame.width)
        // x/view.frame.width - will give current page number
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupButtonControls()
        
        collectionView?.backgroundColor = .white
        
        //Register cell with cellID
        //collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellID") //Default reg. cell with this class
        collectionView?.register(PageCell.self, forCellWithReuseIdentifier: "cellID")
        
        collectionView?.isPagingEnabled = true //PAGING throu x values in coordinate system...
    }
}
