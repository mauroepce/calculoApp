//
//  ViewController.swift
//  calculo
//
//  Created by Birdi on 29-07-21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var discount: UILabel!
    
    @IBOutlet weak var valuetxt: UITextField!
    @IBOutlet weak var percentagetxt: UITextField!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(tecladoUp), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(tecladoDown), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func tecladoUp(){
        let sizeScreen = UIScreen.main.nativeBounds.height
        if sizeScreen == 1136 {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y = -50
            }
            
        }
      
    }
    
    @objc func tecladoDown(){
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    @IBAction func calcule(_ sender: UIButton) {
        guard let value = valuetxt.text else { return }
        guard let percentage = percentagetxt.text else { return }
        
        let val = (value as NSString).floatValue
        let percent =  (percentage as NSString).floatValue
        
        let disc =  val * percent/100
        let res = val - disc
        
        result.text = "$\(res)"
        discount.text = "$\(disc)"
        self.view.endEditing(true)
    }
    
    @IBAction func clean(_ sender: UIButton) {
        valuetxt.text = ""
        percentagetxt.text = ""
        result.text = "$ 0.0"
        discount.text = "$ 0.0"
    }
    

    }
    

