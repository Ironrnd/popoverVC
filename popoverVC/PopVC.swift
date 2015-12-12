//
//  ppc.swift
//  popoverVC
//
//  Created by Andrew Belozerov on 20.11.15.
//  Copyright © 2015 Andrew Belozerov. All rights reserved.
//

import UIKit

class PopVC: UIViewController {

    override var preferredContentSize: CGSize {
        get {
            return CGSize(width: 360, height: 180)
            
        }
        
        set { super.preferredContentSize = newValue }
    }

}
