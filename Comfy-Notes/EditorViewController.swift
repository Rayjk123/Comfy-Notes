//
//  editorViewController.swift
//  Comfy-Notes
//
//  Created by Branden Lee on 3/9/17.
//  Copyright © 2017 Panda Life. All rights reserved.
//

import UIKit
import Firebase

class EditorViewController: UIViewController, UITextViewDelegate, UITextFieldDelegate{
    
    var noteInfo: UITextView = UITextView()
    var noteTitle: UITextField = UITextField()
    
    override func viewDidLoad(){
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        setupView()
    }
    
    func setupView(){
        noteTitle = UITextField()
        noteTitle.frame = CGRect(x: 0, y:0, width: UIScreen.main.bounds.width - 40, height: 200)
        noteTitle.translatesAutoresizingMaskIntoConstraints = false
        noteTitle.placeholder = "Title"
        noteTitle.font = UIFont(name: "Open Sans", size: 200)
        self.view.addSubview(noteTitle)
        
        noteTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        noteTitle.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        
        noteInfo = UITextView()
        noteInfo.text = "Start Notes"
        noteInfo.textColor = UIColor.lightGray
        
        noteInfo.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(noteInfo)
        
        noteInfo.topAnchor.constraint(equalTo: noteTitle.bottomAnchor, constant: 20).isActive = true
        noteInfo.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        noteInfo.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        noteInfo.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 20).isActive = true
        
        
        
        
    }
    
    
    
}
