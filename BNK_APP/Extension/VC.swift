import UIKit

extension UIViewController {
    
    func dismiss()  {
        guard let navigationController = self.navigationController else {
            self.dismiss(animated: true, completion: nil)
            return
        }
        navigationController.popViewController(animated: true)
    }
}
