//
//  XIBView.swift
//  Lesson11HW
//
//  Created by Vika on 01.04.2024.
//

import UIKit

open class XIBView: UIView, NibLoadable {
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        loadFromNib()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        loadFromNib()
        
        awakeFromNib()
    }
    
    public convenience init() {
        self.init(frame: .zero)
    }
}
