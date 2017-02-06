//
//  ViewController.swift
//  CSSwiftExtension
//
//  Created by Chris Hu on 16/12/22.
//  Copyright © 2016年 com.icetime17. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var imageView: UIImageView!
    var anotherImageView: UIImageView!
    
    var btnTest: UIButton!
    
    var tapGesture: UITapGestureRecognizer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        testBlurImageView()
        
        testAnotherImageView()
        
        addBtnTest()
    }
    
    private func addBtnTest() {
        btnTest = UIButton(frame: CGRect(x: 50, y: 50, width: 100, height: 30))
        btnTest.backgroundColor = UIColor.black
        view.addSubview(btnTest)
        btnTest.setTitle("Test", for: .normal)
        btnTest.addTarget(self, action: .actionBtnTest, for: .touchUpInside)
        
        btnTest.cs_acceptEventInterval = 2
        
        btnTest.cs.setBackgroundColor(UIColor.blue, for: .normal)
        btnTest.cs.setBackgroundColor(UIColor.red, for: .highlighted)
    }
    
    private func testBlurImageView() {
//        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 300, height: 500), blurEffectStyle: .light)
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 300, height: 500))
        imageView.backgroundColor = UIColor(hexString: 0x123456, alpha: 0.5)
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
        imageView.center = view.center
        imageView.image = UIImage(named: "Model.jpg")
    }

    func testAnotherImageView() {
        anotherImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 300, height: 500))
        anotherImageView.backgroundColor = UIColor(hexString: 0x123456, alpha: 0.5)
        anotherImageView.contentMode = .scaleAspectFit
        view.addSubview(anotherImageView)
        anotherImageView.center = view.center
        anotherImageView.image = UIImage(named: "Model.jpg")?.cs.grayScale
        anotherImageView.alpha = 0.5
        
//        anotherImageView.loadGif(name: "Railway")
//        anotherImageView.image = UIImage.gif(name: "Railway")
        
        
        cs_print(anotherImageView.isUserInteractionEnabled)
        
        anotherImageView.isUserInteractionEnabled = true
        tapGesture = UITapGestureRecognizer(target: self, action: .actionTapGesture)
        anotherImageView.addGestureRecognizer(tapGesture)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func actionBtnTest() {
        btnTest.cs.setCornerRadius(radius: 20)
        
        guard let aView = AView.cs.loadFromNib("AView") as? AView else { return }
        aView.frame = CGRect(x: 0, y: 0, width: 150, height: 150)
        aView.center = view.center
        view.addSubview(aView)
        aView.lbTitle.text = "TestView"
        
        aView.lbTitle.backgroundColor = UIColor.cs.random
    }

    func actionTapGesture() {
        cs_print(#function)
        
        anotherImageView.cs.removeGestureRecognizers()
    }
}


// MARK: - Selector
private extension Selector {
    static let actionBtnTest = #selector(ViewController.actionBtnTest)
    static let actionTapGesture = #selector(ViewController.actionTapGesture)
}


