//
//  ViewController.swift
//  Flo
//
//  Created by mike oshea on 12/30/18.
//  Copyright © 2018 Future Trends. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var counterView: CounterView!
    @IBOutlet weak var counterLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        counterLabel.text = String(counterView.counter)
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func pushButtonPressed(_ sender: PushButton) {
        if sender.isAddButton {
            counterView.counter += 1
        } else {
            if counterView.counter > 0 {
                counterView.counter -= 1
            }
        }
        counterLabel.text = String(counterView.counter)
    }
    
}

