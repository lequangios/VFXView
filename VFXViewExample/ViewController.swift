//
//  ViewController.swift
//  VFXViewExample
//
//  Created by Le Quang on 9/19/20.
//

import UIKit
import VFXView

class ViewController: UIViewController {

    @IBOutlet weak var snowView: VFXSnowView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        snowView.particleColor = UIColor(red: 255.0, green: 255.0, blue: 255.0, alpha: 0.5)
        snowView.particleLength = 150
        snowView.startAnimation()
    }


}

