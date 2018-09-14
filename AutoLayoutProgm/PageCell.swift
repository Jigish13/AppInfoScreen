//
//  PageCell.swift
//  AutoLayoutProgm
//
//  Created by Sneh on 11/09/18.
//  Copyright © 2018 The Gateway Corp. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
    
    var page: Page? {
        didSet{
            //print(page!.imageName)
            
            //This will prevent app from crashing i.e. if page is nil then none of below code will be exec...So we will use it if nd if it can be unwrapped
            guard let unwrappedPage = page else {
                return
            }
            
            myImageView.image = UIImage(named: unwrappedPage.imageName)
            
            
            
            let attributedText = NSMutableAttributedString(string: unwrappedPage.headerText,
                                                           attributes: [.font: UIFont.boldSystemFont(ofSize: 18)])
            
            attributedText.append(NSAttributedString(string: "\n\n\n\(unwrappedPage.bodyText)", attributes: [
                .font: UIFont.boldSystemFont(ofSize: 13),
                .foregroundColor: UIColor.gray
                ]))
            
            descTextView.attributedText = attributedText
            descTextView.textAlignment = .center
        }
    }
    
    //Lets avoid polluting viewDidLoad
    private let myImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "global_team"))
        //
        // THIS enables autolayout for our ImageView...
        //
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit //Means image ni size same regardless of imageView in which it is
        return imageView
    }()
    
    private let descTextView: UITextView = {
        let textView = UITextView()
        
        let attributedText = NSMutableAttributedString(string: "Join us today in our fun & games!",
                                                       attributes: [.font: UIFont.boldSystemFont(ofSize: 18)])
        
        attributedText.append(NSAttributedString(string: "\n\n\nAre you ready for loads and loads of fun? Dont wait for longer!! We hope to see you soon in our shop...", attributes: [
            .font: UIFont.boldSystemFont(ofSize: 13),
            .foregroundColor: UIColor.gray
            ]))
        
        textView.attributedText = attributedText
        
        //
        //        textView.text = "Join us today in our fun & games!"
        //        textView.font = UIFont.boldSystemFont(ofSize: 18)
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isSelectable = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }() 
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        setupLayout()
    }
    
    private func setupLayout(){
        let topImageContainerView = UIView()
        topImageContainerView.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
        addSubview(topImageContainerView) //NOTE: Here view.addSubView ni krta bcoz its not VC's view but it is PageCell
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        //Applying multiplier to height constraint will dynamically resize view acc to orientation
        topImageContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        topImageContainerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        //        topImageContainerView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        //        topImageContainerView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        topImageContainerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        topImageContainerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        topImageContainerView.addSubview(myImageView)
        myImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
        myImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive = true
        myImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5).isActive = true
        
        
        //This will place image in top left corner
        //imageView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        
        //Now inorder to put in center...we have to apply maths on this image...
        //So AutoLayout comes into picture...
        //.isActive = true aa krvathi anchor constraint true thse...
        //        myImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        //imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        //MARK: Giving padding 100 from the topAnchor of view to ImageView's topAnchor
        //        myImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        
        //        myImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        //        myImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        
        //        descTextView.topAnchor.constraint(equalTo: myImageView.bottomAnchor, constant: 120 ).isActive = true
        addSubview(descTextView)
        descTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor).isActive = true
        descTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24).isActive = true
        descTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24).isActive = true
        descTextView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
