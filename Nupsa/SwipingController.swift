//
//  SwipingController.swift
//  Nupsa
//
//  Created by Vladimir Pertsov on 05.05.2018.
//  Copyright © 2018 Vladimir Pertsov. All rights reserved.
//


import UIKit

extension UIColor {
    static var mainPink = UIColor(red: 232/255, green: 68/255, blue: 133/255, alpha: 1)
}

class SwipingController:UICollectionViewController, UICollectionViewDelegateFlowLayout {
    

    var window: UIWindow?
    
    let imageNames = ["WT1", "WT2", "WT3", "WT4", "WT5"]
    
    let pages = [
        Page(imageName: "WT1", headerText: "Welcome to Nupsa.me ", bodyText: ""),
        Page(imageName: "WT2", headerText: "Service to help you if you suffer from depression or anxiety disorder ", bodyText: ""),
        Page(imageName: "WT3", headerText: "Our technique helps you to change your attitude to disturbances in your life", bodyText: ""),
        Page(imageName: "WT4", headerText: "Nupsa significantly decreases your daily stress level, unleashes vital energy and improves your wellbeing ", bodyText: ""),
        Page(imageName: "WT5", headerText: "", bodyText: "We are proud that you have chosen us and hope Nupsa helps you to feel much better in the nearest weeks")
    ]
    

    
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Finish intro", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.mainPink, for: .normal)
        button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        return button
    }()
    
    @objc private func handleNext() {
    UserDefaults.standard.set(true, forKey: "Walkthrough")
      
       // performSegue(withIdentifier: "MainView", sender: handleNext())
        
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier :"MainView")
       UIApplication.shared.keyWindow?.rootViewController = viewController
        self.present(viewController, animated: true)
       
 
      
     print("and maybe here?")
    }
    
    lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = pages.count
        pc.currentPageIndicatorTintColor = .mainPink
        pc.pageIndicatorTintColor = UIColor(red: 249/255, green: 207/255, blue: 224/255, alpha: 1)
        return pc
    }()
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageNames.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! PageCell
        
        let page = pages[indexPath.item]
        cell.page = page
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
      
    }
    
    fileprivate func setupBottomControls() {
        let bottomControlsStackView = UIStackView(arrangedSubviews: [
            //previousButton,
            
            pageControl, nextButton])
        bottomControlsStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomControlsStackView.distribution = .fillEqually
        
        view.addSubview(bottomControlsStackView)
        
        if #available(iOS 11.0, *) {
            NSLayoutConstraint.activate([
                bottomControlsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
                bottomControlsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                bottomControlsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                bottomControlsStackView.heightAnchor.constraint(equalToConstant: 50)
                ])
        } else {
            // Fallback on earlier versions
        }
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let x = targetContentOffset.pointee.x
        
        pageControl.currentPage = Int(x / view.frame.width)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBottomControls()
        
        collectionView?.backgroundColor = .white
        
        collectionView?.register(PageCell.self, forCellWithReuseIdentifier: "cellId")
        
        collectionView?.isPagingEnabled = true
        print("hello we in swiping controller")
        //      UserDefaults.standard.set(false, forKey: "Walkthrough")
    }
    

}
