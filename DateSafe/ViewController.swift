//
//  ViewController.swift
//  DateSafe
//
//  Created by Wangmo Tenzing on 2/23/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        createButton()
    }

    func createButton() {
        let button = UIButton(type: .system)
        button.frame = CGRect(x:100, y:100, width:100, height:50)
        button.backgroundColor = .darkGray
        button.setTitle("Testing", for: .normal)
        
        //button.addTarget(self, action: #selector(buttonAction),for: .touchUpInside)
        
        self.view.addSubview(button)
        
    }
}

