# Comfy-Notes
A note taking app in progress

##Progress

03/07/17
* Started the project
* Started the UITableView for holding the notes, and started the editor UIViewController

03/11/17
* Got things to work with IQKeyboardManager slightly
* Still working on the editor for the notes
* Having a lot of problem with the UITextView being covered by the keyboard

03/13/17
* Using IQKeyboardManager for my current needs but struggling with it.
* Completely changed the view for the editor by moving around a lot of elements and where they belong.

03/14/17 
* Found out I lost all of my previous README information   ㅠㅠ *cries*
* Mental Breakdown in progress from IQKeyboardManager failing me and always having little issues
* Opened up multiple files of the same UIViewController in order to test some new methods of handling the interactions between the UITextView and the keyboard.
* I just got rid of IQKeyboardManager and finally got my UITextView and keyboard interaction to work after many days of struggling with the same issue.
* Having a very slight problem of allowing the textview to be the first responder because the textview is starting a few pixels up and adjusts itself within around 2 characters. Not sure why it's doing that though. Would be fine if I just allowed the user to tap textview to type instead of opening as a firstresponder. 
