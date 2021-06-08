import UIKit

class GenericBaseVC<Container: UIView>: UIViewController {

    var container: Container { view as! Container }
    
    override func loadView() {
        super.loadView()
        if view is Container {
            return
        }
        view = Container()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override var prefersHomeIndicatorAutoHidden: Bool {
        return true
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
    override var shouldAutorotate: Bool {
        return false
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        return .portrait
    }
    
    deinit { print("deinit:\t\(classForCoder)") }
}
