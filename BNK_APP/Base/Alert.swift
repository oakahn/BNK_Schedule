import UIKit
class Alerts {
    
    class func withMessage(viewController: UIViewController? = UIApplication.topViewController(), title: String, msg: String) {
        let titleAttr = NSMutableAttributedString(string: title,  attributes: [NSAttributedString.Key.font:UIFont.kanitH8MediumStyle])
        
        let msgAttr = NSMutableAttributedString(string: msg,  attributes: [NSAttributedString.Key.font:UIFont.kanitCaptionLightStyle])
        let alert = UIAlertController(title: title, message: msg, preferredStyle: UIAlertController.Style.alert)
        alert.setValue(titleAttr, forKey: "attributedTitle")
        alert.setValue(msgAttr, forKey: "attributedMessage")
        alert.addAction(UIAlertAction(title: "ตกลง", style: UIAlertAction.Style.default, handler: nil))
        viewController?.present(alert, animated: true, completion: nil)
    }
    
    class func alertWithCallback(viewController: UIViewController? = UIApplication.topViewController(), title: String, msg: String,
                                 onDefaultSelected: @escaping () -> Void) {
        let titleAttr = NSMutableAttributedString(string: title,  attributes: [NSAttributedString.Key.font:UIFont.kanitH8MediumStyle])
        
        let msgAttr = NSMutableAttributedString(string: msg,  attributes: [NSAttributedString.Key.font:UIFont.kanitCaptionLightStyle])
        let alert = UIAlertController(title: title, message: msg, preferredStyle: UIAlertController.Style.alert)
        alert.setValue(titleAttr, forKey: "attributedTitle")
        alert.setValue(msgAttr, forKey: "attributedMessage")
        alert.addAction(UIAlertAction(title: "ตกลง", style: UIAlertAction.Style.default, handler: { _ in
            onDefaultSelected()
        }))
        viewController?.present(alert, animated: true, completion: nil)
    }
    
    class func blockMessage(viewController: UIViewController? = UIApplication.topViewController(), title: String, msg: String) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        viewController?.present(alert, animated: true, completion: nil)
    }
    
    class func alertWithOKCallback(viewController: UIViewController? = UIApplication.topViewController(), title: String, msg: String,
                                   onOKSelected: @escaping () -> Void,
                                   onCancelSelected: @escaping () -> Void) {
        let titleAttr = NSMutableAttributedString(string: title,  attributes: [NSAttributedString.Key.font:UIFont.kanitH8MediumStyle])
        
        let msgAttr = NSMutableAttributedString(string: msg,  attributes: [NSAttributedString.Key.font:UIFont.kanitCaptionLightStyle])
        
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        alert.setValue(titleAttr, forKey: "attributedTitle")
        alert.setValue(msgAttr, forKey: "attributedMessage")
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: { _ in
            onCancelSelected()
        }))
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { _ in
            onOKSelected()
        }))
        viewController?.present(alert, animated: true, completion: nil)
        
    }
    
    class func alertWithOKCallback(vc: UIViewController? = UIApplication.topViewController(), title: String, msg: String, okStringButton: String , cancelStringButton: String ,
                                   onOKSelected: @escaping () -> Void,
                                   onCancelSelected: @escaping () -> Void) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: cancelStringButton , style: UIAlertAction.Style.default, handler: { action in
            onCancelSelected()
        }))
        alert.addAction(UIAlertAction(title: okStringButton , style: UIAlertAction.Style.default, handler: { action in
            onOKSelected()
        }))
        vc?.present(alert, animated: true, completion: nil)
    }
    
    class func alertWithOKCallback(vc: UIViewController? = UIApplication.topViewController(), title: String, msg: String, okStringButton: String ,okTextColor: UIColor,cancelTextColor: UIColor, cancelStringButton: String ,
                                   onOKSelected: @escaping () -> Void,
                                   onCancelSelected: @escaping () -> Void) {
        let setTitle = NSMutableAttributedString(string: title,  attributes: [NSAttributedString.Key.font:UIFont.kanitH8MediumStyle])
        
        let setMsg = NSMutableAttributedString(string: msg,  attributes: [NSAttributedString.Key.font:UIFont.kanitSize13LightStyle])
        
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let ok = UIAlertAction(title: okStringButton , style: UIAlertAction.Style.default, handler: { action in
            onOKSelected()
        })
        let cancel = UIAlertAction(title: cancelStringButton , style: UIAlertAction.Style.default, handler: { action in
            onCancelSelected()
        })
        ok.setValue(okTextColor, forKey: "titleTextColor")
        cancel.setValue(cancelTextColor, forKey: "titleTextColor")
        alert.setValue(setTitle, forKey: "attributedTitle")
        alert.setValue(setMsg, forKey: "attributedMessage")
        alert.addAction(cancel)
        alert.addAction(ok)
        vc?.present(alert, animated: true, completion: nil)
    }
    
    class func alertWithCallbackSudden(viewController: UIViewController? = UIApplication.topViewController(), title: String, msg: String,
                                       onDefaultSelected: @escaping () -> Void) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "", style: UIAlertAction.Style.default, handler: { action in
            onDefaultSelected()
        }))
        viewController?.present(alert, animated: true, completion: nil)
    }
    
    class func alertAndHide(viewController: UIViewController? = UIApplication.topViewController(), title: String, msg: String) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        viewController?.present(alert, animated: true, completion: nil)
        
        let when = DispatchTime.now() + 2
        DispatchQueue.main.asyncAfter(deadline: when){
            alert.dismiss(animated: true, completion: nil)
        }
    }
}

