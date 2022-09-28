//
//  ViewController.swift
//  UIKitHometasks
//
//  Created by Валентин Коскин on 22.09.2022.
//
import UIKit

/// ViewController  c использованием UIActivityViewController
class ActivityViewController: UIViewController {
    
    @IBOutlet private weak var buttonToOpenActivityVC: UIButton!
    @IBOutlet private weak var spanchImageView: UIImageView!
    @IBOutlet private weak var spanchButton: UIButton!
    
    private var activityViewController: UIActivityViewController?
    private var itemsArray = ["One", "Two", "Three", "Four"]
    
    let pickerForActivity: UIPickerView = {
        let picker = UIPickerView()
        return picker
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerForActivity.center = view.center
        pickerForActivity.dataSource = self
        pickerForActivity.delegate = self
        view.addSubview(pickerForActivity)
    }
    
    @IBAction func buttonActivityAction(_ sender: UIButton) {
         openActivityVC(parameter: itemsArray)
    }
        
    @IBAction func spanchButtonuAction(_ sender: UIButton) {
        guard let image = UIImage(named: "bob") else { return }
        openActivityVC(parameter: [image])
    }
    
    @objc func openActivityVC(parameter: [Any]) {
        let activityVC = UIActivityViewController(activityItems: parameter, applicationActivities: nil)
        present(activityVC, animated: true, completion: nil)
    }
}

extension ActivityViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return itemsArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let result = "\(itemsArray[row])"
        return result
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if row == 2 {
            openActivityVC(parameter: itemsArray)
        }
    }
}
