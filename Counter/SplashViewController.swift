import UIKit
import Foundation


final class SplashViewController: UIViewController {
    private var timer = Timer()
    private let timeInterval = 3.0
    
    
    internal override func viewDidLoad() {
        super.viewDidLoad()
        timer = Timer.scheduledTimer(timeInterval: timeInterval, target: self, selector: #selector(openNextView), userInfo: nil, repeats: false)
        
        mainLabel.alpha = 0.0
        
    }
    
    @IBOutlet weak private var mainLabel: UILabel!
    
    internal override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 2.0) {
            self.mainLabel.alpha = 1.0
        }
    }
    
    @objc private func openNextView() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "MainViewController") as! ViewController
        viewController.modalPresentationStyle = .fullScreen
        present(viewController, animated: true)
    }
}
