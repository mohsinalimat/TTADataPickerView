//
//  ViewController.swift
//  TTADataPickerViewDemo
//
//  Created by TobyoTenma on 13/03/2017.
//  Copyright © 2017 TobyoTenma. All rights reserved.
//

import UIKit

let dateFormatter = DateFormatter()

class ViewController: UIViewController {
    
//    let pickerView = TTADataPickerView(title: "TTADataPickerView", type: .text)

    @IBOutlet weak var showLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // config the TTADataPickerView's apperance
        let apperance = TTADataPickerView.appearance()
        apperance.setConfirmButtonAttributes(att: [NSForegroundColorAttributeName: UIColor.red])
        apperance.setCancelButtonAttributes(att: [NSForegroundColorAttributeName: UIColor.blue])
        apperance.setToolBarTintColor(color: .yellow)
        apperance.setToolBarBarTintColor(color: .orange)
        apperance.setTitleFont(font: UIFont.systemFont(ofSize: 20))
        apperance.setTitleColor(color: .cyan)
        
    }
    
    // show the text type pickerView
    @IBAction func showTextType(_ sender: UIButton) {
        // configure pickerView type and the title with the initializer
        let pickerView = TTADataPickerView(title: "TTADataPickerView", type: .text)
        // configure pickerView type with this property
        pickerView.type = .text
        // configure the delegate
        pickerView.delegate = self
        // when the pickerView type is .text, configure this property to tell the pickerView what you want to select
        pickerView.textItemsForComponent = [["First", "Second", "Third", "Fourth", "Fifth", "Sixth", "Seventh", "Eighth", "Ninth", "Tenth"], ["First", "Second", "Third", "Fourth", "Fifth", "Sixth", "Seventh", "Eighth", "Ninth", "Tenth"], ["First", "Second", "Third", "Fourth", "Fifth", "Sixth", "Seventh", "Eighth", "Ninth", "Tenth"]]
        // call show() or show(with completion: (() -> Void)? = nil) to show the pickerView from the bottom of the screen
        pickerView.show()
    }
    // show the date type pickerView
    @IBAction func showDateType(_ sender: UIButton) {
        let pickerView = TTADataPickerView(title: "TTADataPickerView", type: .text)
        pickerView.type = .date
        pickerView.delegate = self
        pickerView.show { 
            UIView.animate(withDuration: 0.3, animations: { 
                self.view.backgroundColor = UIColor(white: 1.0, alpha: 0.96)
            })
        }
    }
    // show the time type pickerView
    @IBAction func showTimeType(_ sender: UIButton) {
        let pickerView = TTADataPickerView(title: "TTADataPickerView", type: .text)
        pickerView.type = .time
        pickerView.delegate = self
        pickerView.show()
    }
    // show the dateTime type pickerView
    @IBAction func showDateTimeType(_ sender: UIButton) {
        let pickerView = TTADataPickerView(title: "TTADataPickerView", type: .text)
        pickerView.type = .dateTime
        pickerView.delegate = self
        pickerView.show()
    }

}

// MARK: - TTADataPickerViewDelegate

extension ViewController: TTADataPickerViewDelegate {
    // when the pickerView type is `.text`, you clicked the done button, you will get the titles you selected just now from the `titles` parameter
    func dataPickerView(_ pickerView: TTADataPickerView, didSelectTitles titles: [String]) {
        showLabel.text = titles.joined(separator: " ")
    }
    // when the pickerView type is NOT `.text`, you clicked the done button, you will get the date you selected just now from the `date` parameters
    func dataPickerView(_ pickerView: TTADataPickerView, didSelectDate date: Date) {
        // actually you need configure the dateFormatter dateStyle and timeStyle to get the currect date from the `date` parameter
        if pickerView.type == .date {
            dateFormatter.dateStyle = .medium
        } else if pickerView.type == .time {
            dateFormatter.timeStyle = .medium
        } else if pickerView.type == .dateTime {
            dateFormatter.dateStyle = .medium
            dateFormatter.timeStyle = .medium
        }
        showLabel.text = dateFormatter.string(from: date)
    }
    // when the pickerView  has been changed, this function will be called, and you will get the row and component which changed just now
    func dataPickerView(_ pickerView: TTADataPickerView, didChange row: Int, inComponent component: Int) {
        print(#function)
    }
    // when you clicked the cancel button, this function will be called firstly
    func dataPickerViewWillCancel(_ pickerView: TTADataPickerView) {
        print(#function)
    }
    // when you clicked the cancel button, this function will be called at the last
    func dataPickerViewDidCancel(_ pickerView: TTADataPickerView) {
        print(#function)
    }
}

