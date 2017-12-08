//
//  PGActionSheetCalendarView.swift
//  PGActionSheetCalendar
//
//  Created by piggybear on 2017/10/12.
//  Copyright © 2017年 piggybear. All rights reserved.
//

import UIKit
import FSCalendar

class PGActionSheetCalendarView: UIView {
    //MARK: - internal property
    var calendar: FSCalendar?
    var cancelButtonHandler: ButtonHandler?
    var sureButtonHandler: ButtonHandler?
    var headerView:PGActionSheetCalendarHeader!
    
    //MARK: - private property
    private let headerHeight:CGFloat = 40
    fileprivate var didSelectDate: Date?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if calendar?.selectedDate != nil {
            self.didSelectDate = calendar?.selectedDate
            calendar?.appearance.todayColor = UIColor.clear
            calendar?.appearance.titleTodayColor = UIColor.blue.withAlphaComponent(0.5)
        }
    }
    
    private func setup() {
        var frame = self.bounds
        frame.size.height = headerHeight
        headerView = PGActionSheetCalendarHeader(frame: frame)
        self.addSubview(headerView)
        
        headerView.backgroundColor = UIColor(red: 236 / 255.0, green: 231 / 255.0, blue: 242 / 255.0, alpha: 1.0)
        headerView.sureButtonHandler = {[unowned self] _ in
            if self.sureButtonHandler != nil {
                let calendar = Calendar.current
                let components: DateComponents = calendar.dateComponents([.year, .month, .day], from: self.didSelectDate!)
              self.sureButtonHandler!(components)
            }
        }
        headerView.cancelButtonHandler = {[unowned self] _ in
            if self.cancelButtonHandler != nil {
                self.cancelButtonHandler!(nil)
            }
        }
        
        var calendarFrame = self.bounds
        calendarFrame.origin.y = headerView.frame.maxY
        calendarFrame.size.height = self.bounds.size.height - headerView.frame.size.height
        calendar = FSCalendar(frame: calendarFrame)
        calendar?.backgroundColor = UIColor.white
        calendar?.appearance.headerDateFormat = "yyyy年MM月"
        calendar?.appearance.headerMinimumDissolvedAlpha = 0
        calendar?.appearance.todayColor = UIColor.blue.withAlphaComponent(0.5)
        calendar?.appearance.selectionColor = UIColor.blue.withAlphaComponent(0.5)
        calendar?.appearance.headerTitleFont = UIFont.boldSystemFont(ofSize: 16.5)
        calendar?.appearance.weekdayFont = UIFont.boldSystemFont(ofSize: 14)
        calendar?.appearance.weekdayTextColor = UIColor.blue.withAlphaComponent(0.5)
        calendar?.appearance.headerTitleColor = UIColor.blue.withAlphaComponent(0.5)
        calendar?.delegate = self
        calendar?.dataSource = self
        self.addSubview(calendar!)
        self.didSelectDate = calendar?.today
    }
}

extension PGActionSheetCalendarView: FSCalendarDataSource {
    func calendar(_ calendar: FSCalendar, titleFor date: Date) -> String? {
        let currentCalendar = Calendar.current
        if currentCalendar.isDateInToday(date) {
            return "今"
        }
        return nil
    }
}

extension PGActionSheetCalendarView: FSCalendarDelegate {
    public func calendar(_ calendar: FSCalendar, didSelect date: Date) {
        calendar.appearance.todayColor = UIColor.clear
        calendar.appearance.titleTodayColor = UIColor.blue.withAlphaComponent(0.5)
        self.didSelectDate = date
    }
}
