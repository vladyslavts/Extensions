//
//  Alert.swift
//  Extensions
//
//  Created by Vladyslav Tsykhmistro on 5/7/19.
//  Copyright © 2019 Vladyslav Tsykhmistro. All rights reserved.
//

import UIKit

enum AlertButton: String {
    case ok = "ok"
    case cancel = "cancel"
    case upgrade = "Update Now!"
    case close = "Close"
    case bookAnother = "Book Another"
    case learnMore = "Learn More"
    case selectRegion = "Select Region"
    case settings = "Settings"
    case changeAccount = "Change account"
    case logOut = "Log out"
}

class Alert {
    
    class func showAlert(title: String, message: String, buttons: [AlertButton] = [.ok], closure: ((_ button: AlertButton) -> Void)? = nil) {
        UIView.appearance(whenContainedInInstancesOf: [UIAlertController.self]).tintColor = UIColor.black
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)
        buttons.forEach { button in
            let action = UIAlertAction(title: button.rawValue, style: .default) { action in
                closure?(button)
            }
            alert.addAction(action)
        }
    }
    
    class func showError(error: Error?) {
        guard let error = error else { return }
        self.showAlert(title: "errorTitle", message: error.localizedDescription)
    }
    
    class func showActionSheet(title: String, message: String, titles: [String] = [""], whereToShow: UIViewController? = nil, closure: ((_ index: Int) -> Void)? = nil) {
        UIView.appearance(whenContainedInInstancesOf: [UIAlertController.self]).tintColor = UIColor.black
        let alert = UIAlertController(title: "\n" + title, message: message, preferredStyle: .actionSheet)
        let vc = whereToShow ?? UIApplication.shared.keyWindow?.rootViewController
        vc?.present(alert, animated: true, completion: nil)
        titles.forEach { title in
            let action = UIAlertAction(title: title, style: .default) { action in
                closure?(titles.firstIndex(of: title) ?? 0)
            }
            alert.addAction(action)
        }
    }
    
}
