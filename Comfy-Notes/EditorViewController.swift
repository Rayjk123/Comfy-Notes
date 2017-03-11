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
    
    let bottomBarView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 44/255, green: 62/255, blue: 80/255, alpha: 1)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
        //This stops content from going behind the navigation bar at the top.
        edgesForExtendedLayout = []
        //self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNote))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.done, target: self, action: #selector(finishNote))
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.black
        view.backgroundColor = UIColor.white
        
        setupView()
        setupDelegates()
    }
    
    func setupView(){
        //Set the delegates so that they can use their respective functions from the delegates assigned next to the class
        
        
        noteTitle = UITextField()
        //noteTitle.frame = CGRect(x: 0, y:0, width: UIScreen.main.bounds.width, height: 50)
        noteTitle.translatesAutoresizingMaskIntoConstraints = false
        noteTitle.placeholder = "Title"
        noteTitle.font = UIFont(name: "Open Sans", size: 30)
        self.view.addSubview(noteTitle)
        
        noteTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
        noteTitle.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        noteTitle.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        noteTitle.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        noteInfo = UITextView()
        noteInfo.text = "Start writing..."
        noteInfo.textColor = UIColor.lightGray
        noteInfo.font = UIFont(name: "Open Sans", size: 20)
        
        noteInfo.translatesAutoresizingMaskIntoConstraints = false
        noteInfo.becomeFirstResponder()
        self.view.addSubview(noteInfo)
        
        noteInfo.topAnchor.constraint(equalTo: noteTitle.bottomAnchor, constant: -5).isActive = true
        noteInfo.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 17).isActive = true
        noteInfo.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        noteInfo.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        
        
        
    }
    
    //I made this a separate function because in order for the delegates to work
    //they have to be set after the actual textview and textfield have been initialized.
    func setupDelegates(){
        noteTitle.delegate = self
        noteInfo.delegate = self
    }
    
    //Function when the add button is pressed
    func finishNote(){
        print("Hello")
    }
    
    
    
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if(textView.text == "Start writing..."){
            textView.text = ""
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if(textView.text == ""){
            textView.text = "Start writing..."
            textView.textColor = UIColor.lightGray
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("lol")
    }
    
    
    
    
    
}
