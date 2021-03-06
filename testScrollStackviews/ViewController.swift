//
//  ViewController.swift
//  testScrollStackviews
//
//  Created by Michael Hurwicz on 11/1/16.
//  Copyright © 2016 Irthlingz. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var mainScroll: UIScrollView!
    
    let stackHeight: CGFloat = 30.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainScroll.delegate = self
        print("----- viewDidLoad -----")
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.swiped(_:)))
        swipeDown.direction = UISwipeGestureRecognizerDirection.Down
        self.view.addGestureRecognizer(swipeDown)
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.swiped(_:)))
        swipeUp.direction = UISwipeGestureRecognizerDirection.Up
        self.view.addGestureRecognizer(swipeUp)
    }
    
    func swiped(gesture: UIGestureRecognizer)
    {
        if let swipeGesture =  gesture as? UISwipeGestureRecognizer
        {
            switch swipeGesture.direction
            {
            case UISwipeGestureRecognizerDirection.Down:
                print("DOWN")
                if (mainScroll.contentOffset.y >= stackHeight) {
                    mainScroll.contentOffset.y = mainScroll.contentOffset.y - stackHeight
                }
            case UISwipeGestureRecognizerDirection.Up:
                print("UP \(mainScroll.contentOffset.y)")
                if (mainScroll.contentOffset.y <= stackHeight*16 ) {
                    mainScroll.contentOffset.y = mainScroll.contentOffset.y+stackHeight
                }
            default:
                break
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

