//
//  ViewController.swift
//  UIsegmentedControl2
//
//  Created by Валентин Коскин on 27.09.2022.
//

import UIKit
/// экран с выбором  картинкок
final class ViewController: UIViewController {

    // MARK: uielements
    
    private var segmentControl = UISegmentedControl()
    private let imageView = UIImageView()
    private let imaageArray = [UIImage(named: "album"), UIImage(named: "album1"), UIImage(named: "asdasd")]
    
    // MARK: constants
    
    private let menuArray = ["one", "two", "three"]
    
    
    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        imageView.center = view.center
        imageView.image = imaageArray[0]
        view.addSubview(imageView)
        
        segmentControl = UISegmentedControl(items: menuArray)
        segmentControl.frame = CGRect(x: 100, y: 600, width: 200, height: 30)
        view.addSubview(segmentControl)
        
        segmentControl.addTarget(self, action: #selector(selectedValueAction), for: .valueChanged)
    }
    
    // MARK: methods
    
    @objc func selectedValueAction(target: UISegmentedControl) {
        if target == segmentControl {
            let segmentIndex = target.selectedSegmentIndex
            
            imageView.image = imaageArray[segmentIndex]
            
            let pr = target.titleForSegment(at: segmentIndex)
            print(pr ?? "")
        }
    }

}

