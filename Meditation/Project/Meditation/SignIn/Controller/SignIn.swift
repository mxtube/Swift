//
//  SignIn.swift
//  Meditation
//
//  Created by Кирилл Кузнецов on 21.04.2022.
//

import UIKit
import Alamofire
import SwiftyJSON

class SignIn: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    let baseUrl = AppDelegate().baseUrl
    
    override func viewWillAppear(_ animated: Bool) {
        let ud = UserDefaults.standard
        email.text = ud.string(forKey: "email") ?? ""
    }
    
    @IBAction func signInAction(_ sender: UIButton) {
        guard !email.text!.isEmpty || !password.text!.isEmpty else { return showAlert(message: "Поля пустые") }
        guard !email.text!.isEmpty else { return showAlert(message: "Введите почту") }
        guard !password.text!.isEmpty else { return showAlert(message: "Введите пароль") }
        guard isValidEmail() else { return showAlert(message: "Неверный формат почты")}
        responseToApi()
    }
    
    private func responseToApi() {
        let param: [String: String] = [
            "email": email.text!,
            "password": password.text!
        ]
        AF.request(baseUrl + "/user/login", method: .post, parameters: param, encoder: JSONParameterEncoder.default).response { [self] response in
            switch response.result {
            case .success(let value):
                parseJSON(data: value!)
            case .failure(let error):
                showAlert(message: error.localizedDescription)
            }
        }
    }
    
    private func parseJSON(data: Data) {
        let json = JSON(data)
        let user = User(
            email: json["email"].stringValue,
            token: json["token"].stringValue,
            name: json["nickName"].stringValue,
            avatar: json["avatar"].stringValue
        )
        user.saveToken()
        performSegue(withIdentifier: "mainSegue", sender: nil)
    }
    
    private func showAlert(message: String) {
        let alertController = UIAlertController(title: "Ошибка", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Скрыть", style: .default, handler: nil)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    private func isValidEmail() -> Bool {
        let regEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let predicate = NSPredicate(format:"SELF MATCHES %@", regEx)
        return predicate.evaluate(with: email.text)
    }
}
