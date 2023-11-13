//
//  ViewController.swift
//  Counter
//
//  Created by Илья Ляшенко on 13.11.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var deleteText: UIButton!
    
    
    @IBOutlet weak var topLevel: UILabel!
    
    @IBOutlet weak var deleteButton: UIButton!
    
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var value: UILabel!
    
    @IBOutlet weak var prescriptionsForActions: UITextView!
    
    @IBOutlet weak var changeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prescriptionsForActions.layer.borderWidth = 1.0
        prescriptionsForActions.layer.borderColor = UIColor.black.cgColor // Do any additional setup after loading the view.
    }
    
    func newDate() -> String {
            let format = DateFormatter()
            format.dateFormat = "dd.MM.yyyy HH:mm:ss"
            return format.string(from: Date())
        }
    
    
    @IBAction func deleteThatText(_ sender: Any) {
        prescriptionsForActions.text = "История изменений:"
    }
    
    
    
    
    @IBAction func deleteValue(_ sender: Any) {
        if let newValue = Int(value.text ?? "0"),
           newValue > 0 {
            value.text = "0"
            prescriptionsForActions.text.append("\n\(newDate()): значение сброшено")
          }
        
        
    }
    
    @IBAction func minusOne(_ sender: Any) {
        if let newValue = Int(value.text ?? "0"),
           newValue > 0 {
            value.text = "\(newValue - 1)"
            prescriptionsForActions.text.append("\n\(newDate()): значение изменено на - 1")}
        else{
            prescriptionsForActions.text.append("\n\(newDate()): попытка изменения значения счетчика ниже 0")
        }}
        
        
        @IBAction func plusOne(_ sender: Any) {
            if let newValue = UInt(value.text ?? "0"){
                value.text = "\(newValue + 1)"
                prescriptionsForActions.text.append("\n\(newDate()): значение изменено на + 1")
            }
        }
        
    }

