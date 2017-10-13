//
//  ViewController.swift
//  PGCalendar
//
//  Created by piggybear on 2017/10/12.
//  Copyright © 2017年 piggybear. All rights reserved.
//

import UIKit
import PGActionSheetCalendar

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func button1Handler(_ sender: Any) {
        let calendar = PGActionSheetCalendar()
        present(calendar, animated: false, completion: nil)
    }
    
    @IBAction func button2Handler(_ sender: Any) {
        let calendar = PGActionSheetCalendar()
        let label = calendar.titleLabel
        label.text = "PGCalendar"
        calendar.delegate = self
        present(calendar, animated: false, completion: nil)
    }
    
    @IBAction func button3Handler(_ sender: Any) {
        let calendar = PGActionSheetCalendar()
        calendar.delegate = self
        present(calendar, animated: false, completion: nil)
        calendar.cancelButton.setTitleColor(UIColor.red, for: .normal)
        calendar.sureButton.setTitleColor(UIColor.orange, for: .normal)
    }
    
    @IBAction func button4Handler(_ sender: Any) {
        let calendar = PGActionSheetCalendar()
        calendar.didSelectDateComponents = {components in
            print("year = ", components.year!,"month = ", components.month!,  "day = ", components.day!)
        }
         present(calendar, animated: false, completion: nil)
        calendar.calendar.appearance.weekdayTextColor = UIColor.red
        calendar.calendar.appearance.headerTitleColor = UIColor.red
        calendar.calendar.appearance.selectionColor = UIColor.blue
        calendar.calendar.appearance.todayColor = UIColor.orange
        calendar.calendar.appearance.todaySelectionColor = UIColor.black
    }
}

extension ViewController: PGActionSheetCalendarDelegate {
    func calendar(_ calendar: PGActionSheetCalendar, didSelectDate components: DateComponents) {
        print("year = ", components.year!,"month = ", components.month!,  "day = ", components.day!)
    }
}

