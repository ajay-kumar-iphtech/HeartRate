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
    @IBOutlet weak var avgButton: UIButton!
    
    
    
    //MARK: Life cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
       
        leftBottomView.layer.cornerRadius = 10
        rightBottomView.layer.cornerRadius = 10
        
        avgButton.clipsToBounds = true
        applyCornerRadiusToRightSide(of: avgButton, cornerRadius: 20)
        
        
        addHorizontalLineToAvgButton()
        
    }
    
    func addHorizontalLineToAvgButton() {
        
           let lineLayer = CALayer()
           lineLayer.backgroundColor = UIColor.darkGray.cgColor
           let lineWidth: CGFloat = 1.0
           let lineY = avgButton.center.y
           let lineX = avgButton.frame.origin.x + avgButton.frame.size.width / 2.0 + 40
           lineLayer.frame = CGRect(x: lineX, y: lineY, width: avgButton.frame.size.width + 400, height: lineWidth)
           graphView.layer.addSublayer(lineLayer)
        
       }
       
       func applyCornerRadiusToRightSide(of view: UIView, cornerRadius: CGFloat) {
           
           let maskPath = UIBezierPath(
               roundedRect: view.bounds,
               byRoundingCorners: [.topRight, .bottomRight],
               cornerRadii: CGSize(width: cornerRadius, height: cornerRadius)
           )
           let maskLayer = CAShapeLayer()
           maskLayer.path = maskPath.cgPath
           view.layer.mask = maskLayer
           
       }


}
