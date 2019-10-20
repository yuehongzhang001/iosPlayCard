//
//  ViewController.swift
//  PlayCard
//
//  Created by yuehong zhang on 2019-08-14.
//  Copyright © 2019 yuehong zhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var frontView: UIImageView!
    @IBOutlet weak var backView: UIImageView!
    var backOrFront:Bool = true
    var count = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        flipCard()
    }
    
    func flipCard(){
        if backOrFront{
            backView.image = UIImage(named: "card10")
            backOrFront = false
        }else{
            backView.image = UIImage(named: "back")
            backOrFront = true
        }
        changeCount()
        reloadInputViews()
        if count < 10{
            SoundManager.playSound(.flip)
        }else{
            SoundManager.playSound(.match)
        }
    }
    func changeCount(){
        count += 1
        countLabel.text = "You have flipped \(count)/10 times"
        if count == 10{
            alert()
        }
    }
    
    func alert(){
        let alert = UIAlertController(title: "HI!", message: "You have played 10 times", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(alertAction)
        present(alert, animated: true, completion: nil)
    }
}

