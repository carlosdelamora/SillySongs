//
//  MainViewController.swift
//  SillySong
//
//  Created by Carlos De la mora on 12/7/16.
//  Copyright © 2016 Carlos De la mora. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    
    //The outles
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var lyricsTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        nameTextField.delegate = self
        nameTextField.autocapitalizationType = UITextAutocapitalizationType(rawValue: 0)!
        nameTextField.returnKeyType = .done
    }
    
    //editing did begin action for text field
    //clear the nameTextField and lyricsView text view
    @IBAction func reset(_ sender: Any) {
        nameTextField.text = ""
        lyricsTextView.text = ""
    }
    
    //editing did end action
    //display the lyrics once we are doe editing
    @IBAction func displayLyrics(_ sender: Any) {
        let name = nameTextField.text
        if let name = name {
            let lyrics = lyricsForName(bananaFanaTemplate, name)
            lyricsTextView.text = lyrics
        }
    }
    
}

extension MainViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}

func shortFormOfName(_ name: String ) -> String{
    var shortName : String
    let name = name.localizedLowercase
    let setOfVowels = CharacterSet(charactersIn: "aeiou")
    if let index = name.rangeOfCharacter(from: setOfVowels)?.lowerBound {
        shortName = String(name.characters.suffix(from: index))
    }else{
        shortName = name
    }
    return shortName
}

func lyricsForName(_ lyricsTemplate:String, _ fullName: String )-> String{
    let shortName = shortFormOfName(fullName)
    let replaceFullName = lyricsTemplate.replacingOccurrences(of: "<FULL_NAME>", with: fullName)
    let replaceShortAndFull = replaceFullName.replacingOccurrences(of: "<SHORT_NAME>", with: shortName)
    return replaceShortAndFull
}

let bananaFanaTemplate = [
    "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
    "Banana Fana Fo F<SHORT_NAME>",
    "Me My Mo M<SHORT_NAME>",
    "<FULL_NAME>"].joined(separator: "\n")

