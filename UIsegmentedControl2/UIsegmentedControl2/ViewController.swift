//
//  ViewController.swift
//  UIsegmentedControl2
//
//  Created by Валентин Коскин on 27.09.2022.
//

import UIKit

class ViewController: UIViewController {

    var segmentControl = UISegmentedControl()
    var menuArray = ["one", "two", "three"]
    var imageView = UIImageView()
    var imaageArray = [UIImage(named: "album"), UIImage(named: "album1"), UIImage(named: "asdasd")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        imageView.center = view.center
        imageView.image = imaageArray[0]
        view.addSubview(imageView)
        
        segmentControl = UISegmentedControl(items: menuArray)
        segmentControl.frame = CGRect(x: 100, y: 600, width: 200, height: 30)
        view.addSubview(segmentControl)
        
        segmentControl.addTarget(self, action: #selector(selectedValue), for: .valueChanged)
    }
    
    @objc func selectedValue(target: UISegmentedControl) {
        if target == segmentControl {
            let segmentIndex = target.selectedSegmentIndex
            
            imageView.image = imaageArray[segmentIndex]
            
            let pr = target.titleForSegment(at: segmentIndex)
            print(pr ?? "")
        }
    }

}

