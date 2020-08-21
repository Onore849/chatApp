//
//  LoginViewController.swift
//  Original15-chatApp
//
//  Created by 野澤拓己 on 2020/08/19.
//  Copyright © 2020 Takumi Nozawa. All rights reserved.
//

import UIKit
import Lottie
import Firebase


class LoginViewController: UIViewController {
    
    // animationクラスの呼び出し
    let animationView = AnimationView()
    
    // Outlet
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passWordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func loginAction(_ sender: Any) {
        
        startAnimation()
        
        // ログインの実装
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passWordTextField.text!) { (user, error) in
            
            if error != nil {
                
                print(error)
                
            } else {
                
                print("ログイン成功！")
                self.stopAnimation()
                self.shouldPerformSegue(withIdentifier: "chat", sender: nil)
                
            }
        }
        
        
        
    }
    
// MARK: -アニメーション機能の実装
    func startAnimation() {
        
        let animation = Animation.named("loading")
        
        // animationViewの位置と大きさ
        animationView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height / 1.5)
        
        animationView.animation = animation
        animationView.contentMode = .scaleAspectFill
        animationView.loopMode = .loop
        animationView.play()
        
        view.addSubview(animationView)
        
    }
    
    func stopAnimation() {
        
        animationView.removeFromSuperview()
    
    }
    
    
    
    


}
