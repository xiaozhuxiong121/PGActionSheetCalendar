//
//  PGActionSheetCalendarHeader.swift
//  PGActionSheetCalendar
//
//  Created by piggybear on 2017/10/12.
//  Copyright © 2017年 piggybear. All rights reserved.
//

import UIKit
typealias ButtonHandler = (_ components: DateComponents?)->()

class PGActionSheetCalendarHeader: UIView {
    
    var cancelButtonHandler: ButtonHandler?
    var sureButtonHandler: ButtonHandler?
    var cancelButton: UIButton!
    var sureButton: UIButton!
    var titleLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSureButton()
        setupCancelButton()
        setupTitleLabel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCancelButton() {
        cancelButton = UIButton()
        cancelButton.setTitle("取消", for: .normal)
        cancelButton.setTitleColor(UIColor.gray, for: .normal)
        cancelButton.setTitleColor(UIColor.darkGray, for: .highlighted)
        cancelButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        self.addSubview(cancelButton)
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        let leftConstraint = NSLayoutConstraint(item: cancelButton, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 5)
        let centerY = NSLayoutConstraint(item: cancelButton, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: 0)
        self.addConstraints([leftConstraint, centerY])
        
        let widthConstraint = NSLayoutConstraint(item: cancelButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 50)
        let heightConstraint = NSLayoutConstraint(item: cancelButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 40)
        cancelButton.addConstraints([widthConstraint, heightConstraint])
        cancelButton.addTarget(self, action: #selector(cancelButtonAction), for: .touchUpInside)
    }
    
    private func setupSureButton() {
        sureButton = UIButton()
        sureButton.setTitle("确定", for: .normal)
        sureButton.setTitleColor(UIColor.blue.withAlphaComponent(0.6), for: .normal)
        sureButton.setTitleColor(UIColor.blue.withAlphaComponent(0.8), for: .highlighted)
        sureButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        self.addSubview(sureButton)
        sureButton.translatesAutoresizingMaskIntoConstraints = false
        let sureButtonRightConstraint = NSLayoutConstraint(item: sureButton, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1.0, constant: -5)
        let sureButtonCenterY = NSLayoutConstraint(item: sureButton, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: 0)
        self.addConstraints([sureButtonRightConstraint, sureButtonCenterY])
        let sureButtonWidthConstraint = NSLayoutConstraint(item: sureButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 50)
        let sureButtonHeightConstraint = NSLayoutConstraint(item: sureButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 40)
        sureButton.addConstraints([sureButtonWidthConstraint, sureButtonHeightConstraint])
        sureButton.addTarget(self, action: #selector(sureButtonAction), for: .touchUpInside)
    }
    
    private func setupTitleLabel() {
        titleLabel = UILabel()
        titleLabel.font = UIFont.boldSystemFont(ofSize: 17)
        titleLabel.textColor = UIColor(red: 113 / 255, green: 113 / 255, blue: 113 / 255, alpha: 1.0)
        self.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        let centerY = NSLayoutConstraint(item: titleLabel, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: 0)
         let centerX = NSLayoutConstraint(item: titleLabel, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 0)
        self.addConstraints([centerX, centerY])
    }
    
    @objc private func sureButtonAction() {
        if sureButtonHandler != nil {
            self.sureButtonHandler!(nil)
        }
    }
    
    @objc private func cancelButtonAction() {
        if cancelButtonHandler != nil {
            self.cancelButtonHandler!(nil)
        }
    }
}
