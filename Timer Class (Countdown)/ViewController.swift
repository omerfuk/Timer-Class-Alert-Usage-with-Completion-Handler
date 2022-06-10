//
//  ViewController.swift
//  Timer Class (Countdown)
//
//  Created by Ömer Faruk Kılıçaslan on 10.06.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var timerClass = Timer()
    var counter = 0
    

    @IBOutlet weak var textLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        counter = 10
        textLabel.text = "Timer : \(counter)"
        timerClass = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(timerCounter), userInfo: nil, repeats: true)
        

    }
    
    @objc func timerCounter() {
        
        counter -= 1
        textLabel.text = "Timer : \(counter)"
        if counter == 0 {
         timerClass.invalidate()
            textLabel.text = "Time is OVER"
            
            
            let alert = callAlert(title1: "Warning", message1: "Time IS OVER")
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func callAlert(title1: String, message1: String) -> UIAlertController {
        let alert = UIAlertController(title: title1, message: message1, preferredStyle: .alert)
        
        let stayInFirstViewAction = UIAlertAction(title: "Stay", style: .default, handler: nil)
        let goToSecondViewAction = UIAlertAction(title: "GO", style: .destructive) { alert in
            
            self.performSegue(withIdentifier: "toSecondVC", sender: nil)
        }
        
        
        alert.addAction(stayInFirstViewAction)
        alert.addAction(goToSecondViewAction)
        
        
        return alert
        
    }


}

