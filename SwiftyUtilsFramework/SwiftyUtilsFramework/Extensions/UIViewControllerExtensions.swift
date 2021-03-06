//
//  UIViewControllerExtensions.swift
//  SwiftyUtilsFramework
//
//  Created by Rashid Abbas on 15/11/2018.
//  Copyright © 2018 Rashid Abbas. All rights reserved.
//

import UIKit
import Contacts
import MessageUI
import UserNotifications
import AVKit
import Photos
public extension UIViewController {
    func makeNavBarTransparent() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
    }
    func requestMicrophone(completion: @escaping (Bool) -> ()) {
        AVAudioSession.sharedInstance().requestRecordPermission {(granted: Bool)-> Void in
            print("Permission = \(granted)")
            DispatchQueue.main.async {
                completion(granted)
            }
        }
    }
    func registerForPushNotifications(completion: @escaping (Bool) -> ())  {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert ,  .sound , .badge]) { (success, error) in
            DispatchQueue.main.async {
                if success {
                    completion(true)
                } else {
                    self.showAlert(title: "Notification Permission", message: "you must go to settings and enable notification of kontrol for proper working...", onOkClick: {
                        self.navigationController?.popViewController(animated: true)
                    })
                }
            }
        }
    }
    func checkPhotoLibraryPermission(completion: @escaping (Bool) -> ()) {
        PHPhotoLibrary.requestAuthorization { (status) in
            switch status {
            case .authorized:
                DispatchQueue.main.async {
                    completion(true)
                }
            case .denied, .restricted :
                print("Photo Lib Status = denied , restricted")
                self.showAlert(title: "Photo Permission", message: "you must go to settings, kontrol and allow permission for proper working...", onOkClick: {})
            case .notDetermined:
                PHPhotoLibrary.requestAuthorization { status in
                }
            default:
                print("Photo Lib Status = UnKnown")
            }
        }
    }
    func requestForContactsAccess(completionHandler: @escaping (_ accessGranted: Bool) -> Void) {
        let authorizationStatus = CNContactStore.authorizationStatus(for: CNEntityType.contacts)
        let store = CNContactStore()
        switch authorizationStatus {
        case .authorized:
            DispatchQueue.main.async {
                completionHandler(true)
            }
        case .denied, .restricted:
            print("Contacts Status = denied , restricted")
            self.showAlert(title: "Contacts Permission", message: "you must go to settings, kontrol and allow permission for proper working...", onOkClick: {
                self.navigationController?.popViewController(animated: true)
            })
            DispatchQueue.main.async {
                completionHandler(false)
            }
        case .notDetermined:
            store.requestAccess(for: .contacts) { (status, error) in
                DispatchQueue.main.async {
                    completionHandler(status)
                }
            }
        default:
            print("Contacts Status = Unknown")
        }
    }
    func sendTextMessage(number: [String] , message: String , delegate: MFMessageComposeViewControllerDelegate)  {
        if MFMessageComposeViewController.canSendText() {
            let composeVC = MFMessageComposeViewController()
            composeVC.messageComposeDelegate = delegate
            composeVC.recipients = number
            composeVC.body = message
            present(composeVC, animated: true, completion: nil)
        } else {
            showAlert(title: "Error", message: "SMS services are not available")
        }
    }
    
    func showAlert(title: String = "" , message: String = "" , onOkClick: @escaping (() -> ()) = {})  {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
                onOkClick()
            }))
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    func showConfirmationAlert(title: String = "" , message: String = "" , okTitle: String = "Submit" , cancelTitle: String = "Cancel", okClick: @escaping () -> () , cancelClick: @escaping () -> ())  {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: okTitle, style: .default, handler: { (action) in
            okClick()
            alertController.dismiss(animated: true, completion: nil)
        }))
        alertController.addAction(UIAlertAction(title: cancelTitle, style: .destructive, handler: { (action) in
            cancelClick()
        }))
        present(alertController, animated: true, completion: nil)
    }
    
    func showAPIErrorAlert(title: String = "Error", message: String = "Something went wrong please try again." , okClick: @escaping () -> () , cancelClick: @escaping () -> ())  {
        showConfirmationAlert(title: title, message: message, okTitle: "Try Again", cancelTitle: "cancel", okClick: {
            okClick()
        }, cancelClick: {
            cancelClick()
        })
    }
    func playVideo(url: URL) {
        print(url)
        let player = AVPlayer(url: url)
        let vc = AVPlayerViewController()
        vc.player = player
        
        self.present(vc, animated: true) {
            vc.player?.play()
        }
    }
    
    func showListItemPicker(with cellIndexPath: IndexPath? = nil, title: String , textfield: TitleTextField , view: UIView , items: [PickerViewModel] , delegate: PickerItemSelectionDelegate) -> UIPickerViewX {
        let pickerView = UIPickerViewX(with: cellIndexPath , title: title, textfield: textfield, view: view, items: items)
        pickerView.itemSelectedDelegate = delegate
        return pickerView
    }
    
    func showDatePicker(title: String = "" , datepickerMode: UIDatePicker.Mode = .dateAndTime , dateformat: DateFormatter , onDateSelection: @escaping (String) -> ())  {
        let datePicker = UIDatePicker(frame: .zero)
        datePicker.backgroundColor = UIColor.clear
        datePicker.datePickerMode = datepickerMode
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        // Create the alert and show it
        let alert = UIAlertController(title: title,
                                      customView: datePicker,
                                      fallbackMessage: "This should be a red rectangle",
                                      preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Done", style: .default, handler: { (action) in
            onDateSelection(dateformat.string(from: datePicker.date))
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func topMostViewController() -> UIViewController? {
        if self.presentedViewController == nil {
            return self
        }
        if let navigation = self.presentedViewController as? UINavigationController {
            print("Oh Yes Nav Controller")
            return navigation.visibleViewController?.topMostViewController()
        }
        if let tab = self.presentedViewController as? UITabBarController {
            print("Oh Yes Tab bar Controller")
            if let selectedTab = tab.selectedViewController {
                return selectedTab.topMostViewController()
            }
            return tab.topMostViewController()
        }
        return self.presentedViewController!.topMostViewController()
    }
    
    func openPhotoPicker<T: UIImagePickerControllerDelegate>(delegate: T) where T: UINavigationControllerDelegate {
        print("Click Image")
        checkPhotoLibraryPermission { (isGranted) in
            if isGranted {
                print("Permission Granted")
                self.showProfileImagePickerOptions(delegate: delegate)
            } else {
                print("Permission NOt Granted")
            }
        }
    }
    func showProfileImagePickerOptions<T: UIImagePickerControllerDelegate>(delegate: T) where T: UINavigationControllerDelegate {
        let alertViewController = UIAlertController(title: "", message: "Choose your option", preferredStyle: .actionSheet)
        let camera = UIAlertAction(title: "Camera", style: .default, handler: { (alert) in
            self.openCamera(delegate: delegate)
        })
        let gallery = UIAlertAction(title: "Gallery", style: .default) { (alert) in
            //            UINavigationBar.appearance().barTintColor = UIColor.primaryColor//UIColor.primaryColor
            self.openGallary(delegate: delegate)
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (alert) in
            
        }
        alertViewController.addAction(camera)
        alertViewController.addAction(gallery)
        alertViewController.addAction(cancel)
        self.present(alertViewController, animated: true, completion: nil)
    }
    
    func openCamera<T: UIImagePickerControllerDelegate>(delegate: T) where T: UINavigationControllerDelegate {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
            let pickerController = UIImagePickerController()
            pickerController.allowsEditing = true
            pickerController.delegate = delegate
            pickerController.sourceType = UIImagePickerController.SourceType.camera
            self.present(pickerController, animated: true, completion: nil)
        }
        else {
            showAlert(title: "Warning", message: "You don't have camera", onOkClick: {})
        }
    }
    func openGallary<T: UIImagePickerControllerDelegate>(delegate: T)  where T: UINavigationControllerDelegate {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary) {
            let pickerController = UIImagePickerController()
            pickerController.allowsEditing = true
            pickerController.delegate = delegate
            pickerController.sourceType = UIImagePickerController.SourceType.photoLibrary
            self.present(pickerController, animated: true, completion: nil)
        }
    }
}
