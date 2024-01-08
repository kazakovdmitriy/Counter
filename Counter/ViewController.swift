//
//  ViewController.swift
//  Counter
//
//  Created by Дмитрий on 05.01.2024.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet weak private var historyTextView: UITextView!
    @IBOutlet weak private var counterLabel: UILabel!
    
    // MARK: - Private Properties
    private var counter = 0
    
    // MARK: - Overrides Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        historyTextView.text += "\n"
    }
    
    // MARK: - IB Actions
    @IBAction private func plusCounterButtonTapped() {
        counter += 1
        changeCounterLabel(with: counter)
        addHistoryMessage(text: "значение изменено на +1")
    }
    
    @IBAction private func minusCounterButtonTapped(_ sender: Any) {
        if counter > 0 {
            counter -= 1
            changeCounterLabel(with: counter)
            addHistoryMessage(text: "значение изменено на -1")
        } else {
            addHistoryMessage(text: "попытка уменьшить значение счётчика ниже 0")
        }
    }
    
    @IBAction private func zeroCounterButtonTapped(_ sender: Any) {
        counter = 0
        changeCounterLabel(with: counter)
        addHistoryMessage(text: "значение сброшено")
    }
    
    // MARK: - Private Methods
    private func changeCounterLabel(with counter: Int) {
        counterLabel.text = "Значение счётчика: \(counter)"
    }
    
    private func addHistoryMessage(text: String) {
        
        let currentDate = Date()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yy HH:mm"
        
        let dateString = dateFormatter.string(from: currentDate)
        
        historyTextView.text += "[\(dateString)]: \(text)\n"
    }
    
    
}

