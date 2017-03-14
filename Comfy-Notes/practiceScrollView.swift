//
//  editorViewController.swift
//  Comfy-Notes
//
//  Created by Branden Lee on 3/9/17.
//  Copyright © 2017 Panda Life. All rights reserved.
//

import UIKit
import Firebase

class Editor2ViewController: UIViewController, UITextViewDelegate, UITextFieldDelegate{
    
    var noteInfo: UITextView = UITextView()
    var mainView: UIScrollView = UIScrollView()
    var containerView: UIView = UIView()
    var navigationBar: UIView = UIView() //We're going to create our own custom navigation bar
    
    
    let bottomBarView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardShown), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardHidden), name: .UIKeyboardWillHide, object: nil)
        
        //This stops content from going behind the navigation bar at the top.
        edgesForExtendedLayout = []
        setupNavigationBar()
        setupBasicView()
        setupView()
        setupConstraints()
        setupDelegates()
        setupToolbar()
    }
    
    deinit{
        NotificationCenter.default.removeObserver(self)
    }
    
    //sets up the navigation bar. Called in setupBasic
    func setupNavigationBar(){
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.done, target: self, action: #selector(finishNote))
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.black
        let titleTextField = UITextField(frame: CGRect(x:0, y:0, width: UIScreen.main.bounds.width * 0.5, height: 40))
        titleTextField.textAlignment = .center
        titleTextField.placeholder = "Title"
        self.navigationItem.titleView = titleTextField
    }
    
    
    
    //Set up the beginning stuff stuch as navigation and notification.
    func setupBasicView(){
        mainView.backgroundColor = UIColor.white
        mainView.isScrollEnabled = true
        mainView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(mainView)
        
        mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        mainView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        mainView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        mainView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        //containerView.backgroundColor = UIColor.lightPink()
        mainView.addSubview(containerView)
        
        containerView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor).isActive = true
        containerView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 10).isActive = true
        containerView.rightAnchor.constraint(equalTo: mainView.rightAnchor).isActive = true
        containerView.leftAnchor.constraint(equalTo: mainView.leftAnchor).isActive = true
        containerView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height - 70).isActive = true
    }
    
    func setupView(){
        //Sets up the TextView
        noteInfo = UITextView()
        noteInfo.text = "Start writing..."
        noteInfo.textColor = UIColor.lightGray
        noteInfo.font = UIFont(name: "Open Sans", size: 15)
        noteInfo.translatesAutoresizingMaskIntoConstraints = false
        mainView.addSubview(noteInfo)
        noteInfo.becomeFirstResponder()
        
        //Set up bottom view
        bottomBarView.translatesAutoresizingMaskIntoConstraints = false
        bottomBarView.backgroundColor = UIColor.niceBlue()
        mainView.addSubview(bottomBarView)
    }
    
    func setupConstraints(){
        noteInfo.topAnchor.constraint(equalTo: mainView.topAnchor).isActive = true
        noteInfo.leftAnchor.constraint(equalTo: mainView.leftAnchor, constant: 20).isActive = true
        noteInfo.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -20).isActive = true
        noteInfo.rightAnchor.constraint(equalTo: mainView.rightAnchor, constant: -20).isActive = true
        
        bottomBarView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        bottomBarView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        bottomBarView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        bottomBarView.heightAnchor.constraint(equalToConstant: 45).isActive = true
    }
    
    func setupToolbar(){
        let numberToolbar = UIToolbar(frame: CGRect(x:0, y:0, width:self.view.frame.size.width, height:50))
        numberToolbar.barStyle = UIBarStyle.default
        let keyboardDismiss = UIButton(frame: CGRect(x:0, y:0, width:22, height:22))
        keyboardDismiss.setImage(UIImage(named: "keyboard dismiss2"), for: UIControlState.normal)
        keyboardDismiss.addTarget(self, action: #selector(dismissKeyboard), for: .touchUpInside)
        
        let fontChange = UIButton(frame: CGRect(x:0, y:0, width:22, height:22))
        fontChange.setImage(UIImage(named: "Text Edit Icon"), for: UIControlState.normal)
        fontChange.addTarget(self, action: #selector(changeFont), for: .touchUpInside)
        
        
        
        numberToolbar.items = [
            UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.plain, target: self, action: "cancelNumberPad"),
            UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil),
            UIBarButtonItem(customView: fontChange),
            UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil),
            UIBarButtonItem(customView: keyboardDismiss)]
        numberToolbar.sizeToFit()
        noteInfo.inputAccessoryView = numberToolbar
    }
    
    //I made this a separate function because in order for the delegates to work
    //they have to be set after the actual textview and textfield have been initialized.
    func setupDelegates(){
        noteInfo.delegate = self
    }
    
    //Function when the add button is pressed
    func finishNote(){
        print("Hello")
    }
    
    func keyboardShown(notification: NSNotification){
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            let keyboardHeight = keyboardSize.height
            noteInfo.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardHeight, right: 0)
            noteInfo.scrollIndicatorInsets = noteInfo.contentInset
            let selectedRange = noteInfo.selectedRange
            noteInfo.scrollRangeToVisible(selectedRange)
            print("Keyboard Shown")
        }
        print("Keyboard Shown")
    }
    
    func keyboardHidden(notification: NSNotification){
        print("Keyboard Hidden")
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            noteInfo.contentInset = UIEdgeInsets.zero
            noteInfo.scrollIndicatorInsets = noteInfo.contentInset
            let selectedRange = noteInfo.selectedRange
            noteInfo.scrollRangeToVisible(selectedRange)
            print("Keyboard Hidden")
        }
    }
    
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if(textView.text == "Start writing..."){
            textView.text = ""
            textView.textColor = UIColor.black
            print("text View Begin Editing2")
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
    
    func dismissKeyboard(){
        view.endEditing(true)
    }
    
    func changeFont(){
        
    }
    
    
    
    
}
