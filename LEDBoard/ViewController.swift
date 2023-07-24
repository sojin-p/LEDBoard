//
//  ViewController.swift
//  LEDBoard
//
//  Created by 박소진 on 2023/07/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var inputUIView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func tapGestureTapped(_ sender: UITapGestureRecognizer) {
        
        inputUIView.isHidden.toggle()
        view.endEditing(true)
        
    }
    
}

