//
//  ViewController.swift
//  AutoLayoutProgm
//
//  Created by Sneh on 07/09/18.
//  Copyright © 2018 The Gateway Corp. All rights reserved.
//

import UIKit

extension UIColor {
    static var mainPink = UIColor(red: 232/255, green: 68/235, blue: 133/255, alpha: 1)
}

class ViewController: UIViewController {
    
    
    //Lets avoid polluting viewDidLoad
    let myImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "global_team"))
        //
        // THIS enables autolayout for our ImageView...
        //
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit //Means image ni size same regardless of imageView in which it is
        return imageView
    }()
    
    let descTextView: UITextView = {
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
    
    private let previousButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("PREV", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.gray, for: .normal)
        return button
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("NEXT", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.mainPink, for: .normal)
        return button
    }()
    
    private let pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = 4
        //let pinkColor = UIColor(red: 232/255, green: 68/235, blue: 133/255, alpha: 1)
        pc.currentPageIndicatorTintColor = .mainPink
        pc.pageIndicatorTintColor = UIColor(red: 249/255, green: 207/255, blue: 224/255, alpha: 1)
        return pc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //view.addSubview(myImageView)
        view.addSubview(descTextView)
       
        setupButtonControls()
        
        setupLayout()
    }
    
    fileprivate func setupButtonControls(){
        //view.addSubview(previousButton)
        //previousButton.backgroundColor = .red
        
        //        let yellowView = UIView()
        //        yellowView.backgroundColor = .yellow
        
        //        let greenView = UIView()
        //        greenView.backgroundColor = .green
        
        //        let blueView = UIView()
        //        blueView.backgroundColor = .blue
        
        let bottomControlsStackView = UIStackView(arrangedSubviews: [previousButton,pageControl,nextButton])
        bottomControlsStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bottomControlsStackView)
        
        bottomControlsStackView.distribution = .fillEqually
        // bottomControlsStackView.axis = .vertical //Embed verti in StackView
        
        //        NSLayoutConstraint.activate([])   OR .isActive = true
        NSLayoutConstraint.activate([
            //            previousButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            bottomControlsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomControlsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomControlsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomControlsStackView.heightAnchor.constraint(equalToConstant: 50)
            ])
    }
    
    private func setupLayout(){
        let topImageContainerView = UIView()
        topImageContainerView.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        view.addSubview(topImageContainerView)
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        //Applying multiplier to height constraint will dynamically resize view acc to orientation
        topImageContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        topImageContainerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        //        topImageContainerView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        //        topImageContainerView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        topImageContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topImageContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
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
        descTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor).isActive = true
        descTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24).isActive = true
        descTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24).isActive = true
        descTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
}

