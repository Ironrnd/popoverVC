//
//  ViewController.swift
//  popoverVC
//
//  Created by Andrew Belozerov on 20.11.15.
//  Copyright © 2015 Andrew Belozerov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var blueView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self, action: "tapHandler:")
        blueView.addGestureRecognizer(tap)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ppcs" {
            
            if let testPPVC = segue.destinationViewController as? PopVC{
                
                
                if let ppc = testPPVC.popoverPresentationController {
                    ppc.delegate = self
                }
                //testPPVC.textLabel.text = "ta-da!"
            }

            
        }
    }

}

extension ViewController: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return .None
    }
}

extension ViewController {
    func tapHandler(tap: UITapGestureRecognizer) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let fvtppc = storyboard.instantiateViewControllerWithIdentifier("FromVTppc") as! FromViewTapPPC
        fvtppc.modalPresentationStyle = .Popover
        
        
        if let ppc = fvtppc.popoverPresentationController {
            ppc.delegate = self
            ppc.permittedArrowDirections = .Any
            ppc.sourceView = tap.view
            //ppc.sourceRect = CGRect(x: (tap.view?.bounds.size.width)! / 2, y: (tap.view?.bounds.size.height)! / 2, width: 1, height: 1)
            
            let location = tap.locationInView(blueView)
            ppc.sourceRect = CGRect(x: location.x, y: location.y, width: 1, height: 1)
            
        }
        
        fvtppc.name = "Сообщение, переданное из серого"
        
        presentViewController(fvtppc, animated: true, completion: nil)
        
    }
}

