//
//  ViewController.swift
//  ConvoAI
//
//  Created by Ram Kumar on 30/05/24.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var queryTV: UITextView!
    @IBOutlet weak var resultTV: UITextView!
    @IBOutlet weak var logoImage: UIImageView!
    
    let openAIClass = OpenAIConnector()
    override func viewDidLoad() {
        super.viewDidLoad()
        queryTV.returnKeyType = .done
        // Do any additional setup after loading the view.
        
        self.queryTV.layer.borderColor = UIColor.darkGray.cgColor
              self.queryTV.layer.borderWidth = 2
        
        self.resultTV.layer.borderColor = UIColor.darkGray.cgColor
              self.resultTV.layer.borderWidth = 2
    }
    
    // The purpose of this function is to handle the Enter key press event.
    // Handles the generation of an AIResponse and updates the text view accordingly.
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            print("Enter Key Pressed")
            if !queryTV.text.isEmpty {
                let text = queryTV.text ?? ""
                let result = openAIClass.processPrompt(prompt: "\(text)")
                DispatchQueue.main.async {
                    self.resultTV.text = result
                }
            }
            textView.resignFirstResponder()
            return false
        }
        return true
    }
}

