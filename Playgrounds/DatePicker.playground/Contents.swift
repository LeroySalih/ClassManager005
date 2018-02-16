import UIKit
import PlaygroundSupport

class DatePickerData : NSObject,
    UIDatePickerViewDataSource,
    UIDatePickerViewDelegate {
    let fruits = ["Apple", "Orange", "Banana"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return fruits.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return fruits[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print ("Changed")
    }
}

let pickerData = PickerData()
let pickerView = UIPickerView()
pickerView.backgroundColor = .white
pickerView.dataSource = pickerData
pickerView.delegate = pickerData
pickerView.reloadAllComponents()

PlaygroundPage.current.liveView = pickerView
