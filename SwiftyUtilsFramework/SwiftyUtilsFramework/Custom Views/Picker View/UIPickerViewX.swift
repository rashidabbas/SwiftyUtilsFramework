//
//  UIPickerViewX.swift
//  TaazaChicken
//
//  Created by Rashid Abbas on 26/04/2018.
//  Copyright © 2018 WorldCallTelecom. All rights reserved.
//

import UIKit
public protocol PickerItemSelectionDelegate {
    func itemSelected(textField: UITextField, index: Int , value: PickerViewModel , cellIndex: IndexPath?)
}

open class UIPickerViewX: UIPickerView , UIPickerViewDataSource, UIPickerViewDelegate {
    
    public var itemSelectedDelegate: PickerItemSelectionDelegate?
    
    private var pickOption: [PickerViewModel]!
    private var pickerTextField: TitleTextField?
    private var indexPath: IndexPath?
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(with cellIndexPath: IndexPath? = nil, title: String , textfield: TitleTextField , view: UIView , items: [PickerViewModel]) {
        self.init()
        delegate = self
        pickOption = items
        self.pickerTextField = textfield
        indexPath = cellIndexPath
        self.pickerTextField?.inputView = self
        setToolbar(title: title , view: view)
    }
    
    private func setToolbar(title: String ,view: UIView)  {
        let width = view.frame.size.width
        let height = view.frame.size.height
        let frame = CGRect(x: 0, y: view.frame.size.height/6, width: view.frame.size.width, height: 40.0)
        let toolBar = UIToolbar(frame: frame)
        
        toolBar.layer.position = CGPoint(x: view.frame.size.width/2, y: view.frame.size.height-20.0)
        
        toolBar.barStyle = UIBarStyle.blackTranslucent
        
        toolBar.tintColor = UIColor.white
        
        toolBar.backgroundColor = UIColor.black
        
        let defaultButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.cancel, target: self, action: #selector(handleCancel))
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(handleDone(sender:)))
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: self, action: nil)
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: width / 3, height: height))
        
        label.font = UIFont(name: "Helvetica", size: 12)
        
        label.backgroundColor = UIColor.clear
        
        label.textColor = UIColor.white
        
        label.text = title
        
        label.textAlignment = NSTextAlignment.center
        
        let textBtn = UIBarButtonItem(customView: label)
        
        toolBar.setItems([defaultButton,flexSpace,textBtn,flexSpace,doneButton], animated: true)
        
        pickerTextField?.inputAccessoryView = toolBar
        
    }
    
    
    @objc func handleDone(sender: UIBarButtonItem) {
        pickerTextField?.resignFirstResponder()
        let selectedIndex = selectedRow(inComponent: 0)
        itemSelectedDelegate?.itemSelected(textField: pickerTextField!, index: selectedIndex, value: pickOption[selectedIndex], cellIndex: indexPath)
        pickerTextField?.text = pickOption[selectedIndex].title
        pickerTextField?.stringTag = pickOption[selectedIndex].id
    }
    
    @objc func handleCancel(sender: UIBarButtonItem) {
        pickerTextField?.resignFirstResponder()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickOption.count
    }
    
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickOption[row].title
    }
}
