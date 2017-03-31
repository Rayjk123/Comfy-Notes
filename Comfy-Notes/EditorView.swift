//
//  EditorView.swift
//  Comfy-Notes
//
//  Created by Branden Lee on 3/23/17.
//  Copyright © 2017 Panda Life. All rights reserved.
//

import UIKit

class EditorView: UIView{
    var shouldSetupConstraints = true
    var backgroundImage: UIImageView!
    
    var boldButton: UIButton!
   
    
    
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        
        
        self.addSubview(backgroundImage)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        if(shouldSetupConstraints) {
            // AutoLayout constraints
            shouldSetupConstraints = false
        }
        super.updateConstraints()
    }
    
    func setupImages(){
        backgroundImage = UIImageView(image: UIImage(named: "UIViewEditDark"))
        boldButton.setTitle("B", for: .normal)
        boldButton.titleLabel?.font = UIFont(name: "Open Sans Bold", size: 10)
    }
    
    func updateAllConstraints(){
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        backgroundImage.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        backgroundImage.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        backgroundImage.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    }
    
    
    
    
    
    
    
    
    
}
