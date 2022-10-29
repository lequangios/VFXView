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
        snowView.snowCount = 150
        snowView.snowRadius = 5
        //snowView.start()
    }


}

