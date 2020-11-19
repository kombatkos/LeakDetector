//
//  Copyright © 2020 An Tran. All rights reserved.
//

import UIKit
import LeakDetector
import Combine

class RootViewController: LeakDetectableTableViewController {
    
    @IBAction func backFromLeakingViewController(_ segue: UIStoryboardSegue) {
        super.executeLeakDetector(for: segue.source)
    }
}

class NotLeakingChildViewController: UIViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didTapGoBack(_ sender: Any) {
        performSegue(withIdentifier: "goBack", sender: self)
    }
}

class LeakingChildViewController: UIViewController {
        
    //    weak private var delegate: LeakDelegate!
    var delegate: LeakDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
    }
    
    @IBAction func didTapGoBack(_ sender: Any) {
        performSegue(withIdentifier: "goBack", sender: self)
    }

}

extension LeakingChildViewController: LeakDelegate {
    var viewController: UIViewController {
        self
    }
}
