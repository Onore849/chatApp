//
//  NewRegisterViewController.swift
//  Original15-chatApp
//
//  Created by 野澤拓己 on 2020/08/21.
//  Copyright © 2020 Takumi Nozawa. All rights reserved.
//

import UIKit
import Firebase
import Lottie

class NewRegisterViewController: UIViewController {
    
    // outlet
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passWordTextField: UITextField!
    
    // animationの実行
    let animationView = AnimationView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    // 新規登録のアクション
    @IBAction func registerNewUser(_ sender: Any) {
        
        startAnimation()
        
        // 新規登録
        Auth.auth().createUser(withEmail: emailTextField.text!, password: passWordTextField.text!) { (user, error) in
            
            if error != nil{
                
              print(error)
                
            }else {
                
                print("ユーザの作成が成功しました")
                
                // animationのストップ
                self.stopAnimation()
                self.performSegue(withIdentifier: "chat", sender: nil)
            }
        }
        
        
    }
    
    func startAnimation() {
        
        let animation = Animation.named("loading")
        animationView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height/1.5)
        
        animationView.animation = animation
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.play()
        
        view.addSubview(animationView)
    }
    
    func stopAnimation() {
        
        animationView.removeFromSuperview()
        
    }
    
    


}
