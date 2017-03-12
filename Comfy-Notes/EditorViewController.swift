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
        view.backgroundColor = UIColor.red
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
     
    override func viewDidLoad(){
        super.viewDidLoad()
        //This stops content from going behind the navigation bar at the top.
        edgesForExtendedLayout = []
        //self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNote))
        setupBasic()
        
        /*
        NotificationCenter.default.addObserver(self, selector: Selector("keyboardWillShow:"), name:NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: Selector("keyboardWillHide:"), name:NSNotification.Name.UIKeyboardWillHide, object: nil)
 */
        
        setupView()
        setupConstraints()
        setupDelegates()
    }
    
    //What happens when we leave this view
    deinit{
        NotificationCenter.default.removeObserver(self)
        
    }
    
    //Set up the beginning stuff stuch as navigation and notification.
    func setupBasic(){
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.done, target: self, action: #selector(finishNote))
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.black
        view.backgroundColor = UIColor.white
        //keyboardDidShow(notification: Notification)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidShow), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidHide), name: .UIKeyboardWillHide, object: nil)
    }
    
    func setupView(){
        //Sets up The Title
        noteTitle = UITextField()
        noteTitle.translatesAutoresizingMaskIntoConstraints = false
        noteTitle.placeholder = "Title"
        noteTitle.font = UIFont(name: "Open Sans", size: 30)
        self.view.addSubview(noteTitle)
        
        //Sets up the TextView
        noteInfo = UITextView()
        noteInfo.text = "Start writing..."
        noteInfo.textColor = UIColor.lightGray
        noteInfo.font = UIFont(name: "Open Sans", size: 20)
        noteInfo.translatesAutoresizingMaskIntoConstraints = false
        noteInfo.becomeFirstResponder()
        self.view.addSubview(noteInfo)
        
        //Set up bottom view
        bottomBarView.translatesAutoresizingMaskIntoConstraints = false
        bottomBarView.backgroundColor = UIColor.niceBlue()
        self.view.addSubview(bottomBarView)
        
        
        
        
    }
    
    func setupConstraints(){
        noteTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
        noteTitle.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        noteTitle.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        noteTitle.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        noteInfo.topAnchor.constraint(equalTo: noteTitle.bottomAnchor, constant: -5).isActive = true
        noteInfo.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 17).isActive = true
        noteInfo.bottomAnchor.constraint(equalTo: bottomBarView.topAnchor).isActive = true
        noteInfo.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        
        bottomBarView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        bottomBarView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        bottomBarView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        bottomBarView.heightAnchor.constraint(equalToConstant: 45).isActive = true
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
        print("Title begin editing")
    }
    
    func keyboardDidShow(notification: Notification){
        print("keyboard did show")
        let info = notification.userInfo!
        let keyboardFrame: CGRect = (info[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let keyboardHeight: CGFloat = keyboardFrame.height
        
        self.noteInfo.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -keyboardHeight)
        //self.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -(keyboardFrame.size.height + 20))
    
    }
    
    func keyboardDidHide(){
        print("keyboard did hide")
    }
    
    
    
    
    
    
}
