//
//  ViewController.swift
//  MAD157Module8DataPersistence2KarenM
//
//  Created by Karen Mathes on 10/5/20.
//  Copyright © 2020 TygerMatrix Software. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var typeTextHere: UITextView!
    @IBOutlet var displayTextHere: UITextView!
    
    @IBAction func writeMyText(_ sender: Any) {
        let fm = FileManager.default
        let urls = fm.urls(for: .documentDirectory, in: .userDomainMask)
        let url = urls.last?.appendingPathComponent("kamfile2020.text")
        do {
            try typeTextHere.text.write(to: url!, atomically: true, encoding: String.Encoding.utf8)
        } catch {
            print("Error writing file")
        }
        
        //.. to print out the path of the text file kamfile2020.text
        //.. from StackOverflow :) https://stackoverflow.com/questions/1676938/easy-way-to-see-saved-nsuserdefaults#:~:text=You%20will%20see%20the%20contents%20in%20your%20Xcode%20editor.&text=Sorted%20by%20most%20recent%20date,file%20in%20the%20plist%20editor.&text=Go%20to%3A%20%2FUsers%2F%7BUser,%7D%2FLibrary%2FContainers%2Fcom.&text=This%20is%20the%20whole%20path,be%20in%20a%20plist%20file.
            
        let path = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true)
        let folder = path[0]
        NSLog("Your text file is stored in this folder: \(folder)/Preferences")
            
    }
    
    @IBAction func readMyText(_ sender: Any) {
        let fm = FileManager.default
        let urls = fm.urls(for: .documentDirectory, in: .userDomainMask)
        let url = urls.last?.appendingPathComponent("kamfile2020.text")
        do {
            let fileContent = try String(contentsOf: url!, encoding: String.Encoding.utf8)
            displayTextHere.text = fileContent
        } catch{
            print("Error reading file")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        typeTextHere.text = "Type your new text right here"
        displayTextHere.text = String()
   }
  
  

}

