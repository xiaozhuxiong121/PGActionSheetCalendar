//
//  PGActionSheetCalendar.swift
//  PGActionSheetCalendar
//
//  Created by piggybear on 2017/10/12.
//  Copyright © 2017年 piggybear. All rights reserved.
//

import UIKit
import FSCalendar

internal struct ScreenSize {
    static let width: CGFloat = UIScreen.main.bounds.size.width
    static let height: CGFloat = UIScreen.main.bounds.size.height
}

public class PGActionSheetCalendar: UIViewController {
    //MARK: - public property
    public var calendar: FSCalendar {
        return self.calendarView.calendar!
    }
    public var cancelButton: UIButton {
        return self.calendarView.headerView.cancelButton
    }
    public var sureButton: UIButton {
        return self.calendarView.headerView.sureButton
    }
    public var titleLabel: UILabel {
        return self.calendarView.headerView.titleLabel
    }
    public var delegate: PGActionSheetCalendarDelegate?
    public var didSelectDateComponents: ((_ components: DateComponents)->())?
    
    //MARK: - private property
    fileprivate var calendarView: PGActionSheetCalendarView!
    fileprivate let calendarHeight: CGFloat = 300
    fileprivate var overlayView: UIView?
    fileprivate var contentView: UIView!
    
    //MARK: - system cycle
    public convenience init() {
        self.init(nibName: nil, bundle: nil)
        
        self.modalPresentationStyle = .custom
        overlayView = UIView(frame: self.view.bounds)
        overlayView?.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        overlayView?.alpha = 0
        self.view.addSubview(overlayView!)
        let tap = UITapGestureRecognizer(target: self, action: #selector(overlayViewTapHandler))
        overlayView?.addGestureRecognizer(tap)
        
        
        let frame = CGRect(x: 0, y:  ScreenSize.height, width: ScreenSize.width, height: calendarHeight)
        contentView = UIView(frame: frame)
        contentView.backgroundColor = UIColor.white
        self.view.addSubview(contentView)
        calendarView = PGActionSheetCalendarView(frame: frame)
        contentView.addSubview(calendarView)
        calendarView.cancelButtonHandler = {[unowned self] _ in
            self.overlayViewTapHandler()
        }
        calendarView.sureButtonHandler = {[unowned self] components in
            if self.delegate != nil {
                self.delegate?.calendar!(self, didSelectDate: components!)
            }
            if self.didSelectDateComponents != nil {
                self.didSelectDateComponents!(components!)
            }
            self.overlayViewTapHandler()
        }
    }
    
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        var bottom: CGFloat = 0
        if #available(iOS 11.0, *) {
            bottom = self.view.safeAreaInsets.bottom
        }
        let frame = CGRect(x: 0,
                           y: 0,
                           width: ScreenSize.width,
                           height: calendarHeight)
        self.calendarView.frame = frame
        let contentViewFrame = CGRect(x: 0,
                           y: ScreenSize.height - calendarHeight - bottom,
                           width: ScreenSize.width,
                           height: calendarHeight + bottom)
        UIView.animate(withDuration: 0.3, animations: {
            self.contentView.frame = contentViewFrame
            self.overlayView?.alpha = 1.0
        })
    }
    
    // private method
    @objc func overlayViewTapHandler() {
        var bottom: CGFloat = 0
        if #available(iOS 11.0, *) {
            bottom = self.view.safeAreaInsets.bottom
        }
        let frame = CGRect(x: 0, y:  ScreenSize.height, width: ScreenSize.width, height: calendarHeight + bottom)
        UIView.animate(withDuration: 0.3, animations: {
            self.contentView.frame = frame
            self.overlayView?.alpha = 0
        }) { _ in
            self.dismiss(animated: false, completion: nil)
        }
    }
}

