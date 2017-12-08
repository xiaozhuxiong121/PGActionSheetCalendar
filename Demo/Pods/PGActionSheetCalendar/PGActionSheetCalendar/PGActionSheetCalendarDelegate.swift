//
//  PGActionSheetCalendarDelegate.swift
//  PGActionSheetCalendar
//
//  Created by piggybear on 2017/10/12.
//  Copyright © 2017年 piggybear. All rights reserved.
//

import Foundation

@objc public protocol PGActionSheetCalendarDelegate: NSObjectProtocol {
    @objc optional func calendar(_ calendar: PGActionSheetCalendar, didSelectDate components: DateComponents)
}
