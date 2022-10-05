//
//  ViewController.swift
//  UIKitHometasks
//
//  Created by Валентин Коскин on 22.09.2022.
//
import UIKit

///  экран c использованием UIActivityViewController
final class ActivityViewController: UIViewController {
    
    // MARK: Outlets
    
    @IBOutlet private weak var buttonToOpenActivityButton: UIButton!
    @IBOutlet private weak var spanchImageView: UIImageView!
    @IBOutlet private weak var spanchButton: UIButton!
    
    // MARK: Private properties
    
    private var activityViewController: UIActivityViewController?
    private var items = ["One", "Two", "Three", "Four"]
    private let facebook = FacebookShare()
    
    // MARK: UI elements
    
    private let pickerForActivity: UIPickerView = {
        let picker = UIPickerView()
        return picker
    }()
    
    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerForActivity.center = view.center
        pickerForActivity.dataSource = self
        pickerForActivity.delegate = self
        view.addSubview(pickerForActivity)
    }
    
    // MARK: Methods
    
    @IBAction func buttonActivityAction(_ sender: UIButton) {
         openActivityVC(activityItems: [facebook])
    }
        
    @IBAction func spanchButtonuAction(_ sender: UIButton) {
        guard let image = UIImage(named: "bob") else { return }
        openActivityVC(activityItems: [image])
    }
    
    private func openActivityVC(activityItems: [Any], applicationActivities: [UIActivity]? = nil) {
        let activityVC = UIActivityViewController(activityItems: activityItems,
                                                  applicationActivities: applicationActivities)
        present(activityVC, animated: true, completion: nil)
    }
}

// MARK: UIPickerViewDataSource, UIPickerViewDelegate

extension ActivityViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return items.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let result = "\(items[row])"
        return result
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if row == 2 {
            openActivityVC(activityItems: items)
        }
    }
}

/// FacebookShare
class FacebookShare: NSObject, UIActivityItemSource {
    
    var placeholder = "New post"
    var newsFromFacebook = "For facebook"
    var url = ""
    
    func activityViewControllerPlaceholderItem(_ activityViewController: UIActivityViewController) -> Any {
        placeholder
    }
    
    func activityViewController(_ activityViewController: UIActivityViewController,
                                itemForActivityType activityType: UIActivity.ActivityType?) -> Any? {
        if activityType == .message {
            return newsFromFacebook
        }
        return nil
    }
}
