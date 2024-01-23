//
//  ViewController.swift
//  HeartRateUI
//
//  Created by iPHTech 28 on 19/01/24.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: IBOutlets
    @IBOutlet weak var graphView: UIView!
    @IBOutlet weak var leftBottomView: UIView!
    @IBOutlet weak var rightBottomView: UIView!
    
    
    
    //MARK: Life cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
       
        leftBottomView.layer.cornerRadius = 10
        rightBottomView.layer.cornerRadius = 10
    }
    
    
    
    

}
