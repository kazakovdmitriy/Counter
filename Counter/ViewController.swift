//
//  ViewController.swift
//  Counter
//
//  Created by Дмитрий on 05.01.2024.
//

import UIKit

class ViewController: UIViewController {
    
    private var counter = 0
    
    @IBOutlet weak var historyTextView: UITextView!
    @IBOutlet weak var counterLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        historyTextView.text += "\n"
    }
    
    private func changeCounterLable(with counter: Int) {
        counterLabel.text = "Значение счётчика: \(counter)"
    }
    
    private func addHistoryMessage(text: String) {
        
        let currentDate = Date()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yy HH:mm"
        
        let dateString = dateFormatter.string(from: currentDate)
        
        historyTextView.text += "[\(dateString)]: \(text)\n"
    }

    @IBAction func plusCounterButton() {
        counter += 1
        changeCounterLable(with: counter)
        addHistoryMessage(text: "значение изменено на +1")
    }
    
    @IBAction func minusCounterButton(_ sender: Any) {
        if counter > 0 {
            counter -= 1
            changeCounterLable(with: counter)
            addHistoryMessage(text: "значение изменено на -1")
        } else {
            addHistoryMessage(text: "попытка уменьшить значение счётчика ниже 0")
        }
    }
    
    @IBAction func zeroCounterButton(_ sender: Any) {
        counter = 0
        changeCounterLable(with: counter)
        addHistoryMessage(text: "значение сброшено")
    }
    
    
}

