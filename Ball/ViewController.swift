//  ViewController.swift
//  Ball
//
//  Created by Joel Joseph on 9/22/22.
//
import UIKit

class ViewController: UIViewController {
    
    var timer:Timer?
    
    @IBOutlet weak var ask: UIButton!
    
    let A: [String] = ["no",
             "yes",
             "maybe",
             "according to me...NO",
             "according to me...YES",
             "IDK",
             "Cool"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        self.view.bringSubviewToFront(ask);
        self.becomeFirstResponder()
    }
    //this is for the action of clicking the button
    @IBAction func askAction(_ sender: Any) {
        showAnsewer()
    }
    func showAnsewer(){
        let answer = A[Int.random(in: 0..<A.count)]
        ask.setTitle(answer, for: .normal)
        if(timer == nil){
            timer = Timer.scheduledTimer( timeInterval: 4.0, target: self, selector: #selector(timerFunction), userInfo: nil, repeats: true)
        }
    }
    //timer function
    @objc func timerFunction() {
        print("Timer fired!!")
        ask.setTitle("Ask a question", for: .normal)
        timer?.invalidate()
        timer = nil
        
        
    }
    //view did load cant become frist responder so this overrides it
    override var canBecomeFirstResponder: Bool {
        get {
            return true
        }
    }
    //for the motion detection specifically lookes for a shake
    override func motionEnded(_ motion: UIEvent.EventSubtype, with even: UIEvent?){
        print("Shake called")
        if motion == .motionShake{
            print("in motion event called")
            showAnsewer()
        }
    }
}

