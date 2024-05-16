//
//
//  ViewController.swift
//  coderspace-deneme
//
//  Created by ANIL GULGOR on 3.05.2024.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var welcomeText: UILabel!
    
    @IBOutlet weak var descriptionText: UILabel!
    
    @IBOutlet weak var emailText: UILabel!
    
    @IBOutlet weak var emailTextField: EmailTextField!
    

    @IBOutlet weak var loginButton: UIButton!
    
    
    @objc func dismissKeyboard() {
        emailTextField.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.view.addGestureRecognizer(tapGesture)
        
        self.welcomeText.text = "Merhaba, Hoşgeldiniz 👋"
        
        self.descriptionText.text = "E-mailiniz ile Giriş Yapın"
        
        emailText.text = "Email"
        
        setButtonAppearance();
        
        self.emailTextField.delegate = self;
        
        self.emailTextField.setEmailTextFieldPlaceholderAppearance(withForegroundColor: UIColor.lightGray)
        self.emailTextField.setEmailTextFieldTextAppearance(withTextColor: UIColor.white);
        
        
    }
    
    /*
     
     // GET request
     NetworkManager.shared.get(endpoint: "https://api.example.com/movies") { (data, response, error) in
         // handle response
     }

     // POST request
     let newMovie = ["id": 7, "title": "New Movie", "year": 2022, "director": "New Director"]
     NetworkManager.shared.post(endpoint: "https://api.example.com/movies", parameters: newMovie) { (data, response, error) in
         // handle response
     }

     // PUT request
     let updatedMovie = ["id": 7, "title": "Updated Movie", "year": 2022, "director": "Updated Director"]
     NetworkManager.shared.put(endpoint: "https://api.example.com/movies/7", parameters: updatedMovie) { (data, response, error) in
         // handle response
     }
     
     */
    
    @objc func buttonTouchedDownInside(_ sender: UIButton) {
        sender.backgroundColor = UIColor(named: "MyPurpleDark");
        
        NetworkManager.shared.post(endpoint: "http://localhost:3000/login", parameters: ["email": emailTextField.text!]) { data, response, error in
            print(data!);
            print(response!);
            DispatchQueue.main.async {
                // success login attempt scenario
                let storyBoard = UIStoryboard(name: "Main", bundle: nil);
                let initialViewController = storyBoard.instantiateInitialViewController()
                
                if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                    let delegate = windowScene.delegate as? SceneDelegate,
                    let window = delegate.window {
                    window.rootViewController = initialViewController
                    UIView.transition(with: window, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                }
            }
           
            
        }
        
    }
    
    func setButtonAppearance() {
        self.loginButton.backgroundColor = UIColor(named: "MyPurple");
        self.loginButton.titleLabel?.tintColor = UIColor.white;
        self.loginButton.layer.cornerRadius = 8;
        self.loginButton.setTitle("Giriş Yap", for: .normal);
        self.loginButton.tintColor = .lightGray
        
        self.addButtonTarget();

    }
    
    func addButtonTarget() {
        
        self.loginButton.addTarget(self, action: #selector(buttonTouchedDownInside), for: .touchDown)
        
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if (type(of: textField) == EmailTextField.self) {
            UIView.animate(withDuration: 0.3) {
                self.view.frame.origin.y -= 100
                self.view.layoutIfNeeded()
            }
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if (type(of: textField) == EmailTextField.self) {
            UIView.animate(withDuration: 0.3) {
                self.view.frame.origin.y += 100
                self.view.layoutIfNeeded()
            }
        }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    

}

