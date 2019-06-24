import UIKit
import Foundation

@IBDesignable class LoadingXibView: BaseXibView {

    private var parentView: UIView?
    
    @IBOutlet weak var acitivityIndicatorViews: UIActivityIndicatorView!
    @IBOutlet weak var activityDescriptionLabels: UILabel!
    @IBOutlet weak var backdropImages: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        super.xibSetup()
    }
    
    init(parentView: UIView, frame: CGRect) {
        if(frame.size.height > 570 || frame.size.height < 500) {
            super.init(frame: frame)
        } else {
            let frameLow = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height)
            super.init(frame: frameLow)
        }
        
        self.parentView = parentView
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func show(message: String,hasBg: Bool) {
        self.backdropImages.isHidden = false
        self.activityDescriptionLabels.text = message
        if hasBg {
            self.activityDescriptionLabels.textColor = UIColor.white
            self.acitivityIndicatorViews.style = UIActivityIndicatorView.Style.white
        } else {
            self.backdropImages.isHidden = true
            self.acitivityIndicatorViews.style = UIActivityIndicatorView.Style.gray
            self.activityDescriptionLabels.textColor = UIColor.lightGray
        }
        self.parentView?.addSubview(self)
        self.acitivityIndicatorViews?.startAnimating()
    }
    
    func hide() {
        self.acitivityIndicatorViews?.stopAnimating()
        self.removeFromSuperview()
    }
    
}


