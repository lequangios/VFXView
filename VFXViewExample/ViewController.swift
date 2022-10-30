//
//  ViewController.swift
//  VFXViewExample
//
//  Created by Le Quang on 9/19/20.
//

import UIKit
import VFXView

class ViewController: UIViewController {

    //@IBOutlet weak var snowView: VFXSnowView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        var snowView = VFXSnowView.init(frame: view.bounds)
        snowView.setupVFXView(with: frame: view.bounds)
        snowView.setupVFXView(with: view.bounds) { view in
            // Do something
        }
        
    }

    
}

