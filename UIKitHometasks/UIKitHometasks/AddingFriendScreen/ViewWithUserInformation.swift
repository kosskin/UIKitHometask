//
//  ViewWithUserInformation.swift
//  UIKitHometasks
//
//  Created by Валентин Коскин on 25.09.2022.
//

import UIKit
//этот класс решил не использовать, так как долго разбираться с добавлением UIPicker
///класс описывает одно информационное поле на экране с добавлением пользователя
class ViewWithUserInformation: UIView {
    private let userInfoLabel: UILabel
    private let userInfoTextField: UITextField
    private let grayLineView: UIView
    
    init(rect: CGRect, name: String, infoInTextField: String) {
        
        //let infoLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 21))
        let infoTextField = UITextField(frame: CGRect(x: 0, y: 0, width: 300, height: 21))
        let grayLine = UIView(frame: CGRect(x: 0, y: 0, width: 450, height: 1))
        self.userInfoLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 21))
        self.userInfoTextField = infoTextField
        self.grayLineView = grayLine
        super.init(frame: rect)
        configViews(name: name)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configViews(name: String) {
        userInfoLabel.frame.origin.x = 5
        userInfoLabel.frame.origin.y = 5
        userInfoLabel.text = name
        
        userInfoTextField.frame.origin.x = userInfoLabel.frame.origin.x
        userInfoTextField.frame.origin.y = userInfoLabel.frame.origin.y + userInfoLabel.frame.width + 10
        
        grayLineView.frame.origin.y = userInfoTextField.frame.origin.y + userInfoTextField.frame.width + 10
        grayLineView.backgroundColor = .gray
        addSubview(userInfoLabel)
        addSubview(userInfoTextField)
        addSubview(grayLineView)
    }
    
}
