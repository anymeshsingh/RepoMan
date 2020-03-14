//
//  LoadingViewController.swift
//  repository-manager
//
//  Created by Animesh Singh on 10/03/20.
//  Copyright © 2020 Animesh Singh. All rights reserved.
//

import Cocoa

class LoadingViewController: NSViewController {
    @IBOutlet weak var loadingIndicator: NSProgressIndicator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        loadingIndicator.isHidden = false
        loadingIndicator.isIndeterminate = true
        loadingIndicator.usesThreadedAnimation = true
        loadingIndicator.startAnimation(nil)
    }
    
    override func viewWillDisappear() {
//        loadingIndicator.stopAnimation(nil)
    }
    
}
