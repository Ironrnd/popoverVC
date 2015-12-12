//
//  FromViewTapPPC.swift
//  popoverVC
//
//  Created by Andrew Belozerov on 21.11.15.
//  Copyright © 2015 Andrew Belozerov. All rights reserved.
//

import UIKit

class FromViewTapPPC: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    var name = "Программно сделаный popover" {
        didSet {
            label?.text = name
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = name
    }
    
 
    
    override var preferredContentSize: CGSize {
        get {
            if label != nil  && presentingViewController != nil {
                let size = label.sizeThatFits(presentingViewController!.view.bounds.size)
                let size20 = CGSize.init(width: size.width + 30, height: size.height + 60)
                return size20
            } else {
                return super.preferredContentSize
            }
            
        }
        
        set { super.preferredContentSize = newValue }
    }

    
}
