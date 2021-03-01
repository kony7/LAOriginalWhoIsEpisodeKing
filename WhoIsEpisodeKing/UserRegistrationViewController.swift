//
//  UserRegistrationViewController.swift
//  WhoIsEpisodeKing
//
//  Created by 小西星七 on 2021/03/01.
//

import UIKit

class UserRegistrationViewController: UIViewController {
    
   
    @IBOutlet var redButton: UIButton!
    @IBOutlet var blueButton: UIButton!
    @IBOutlet var greenButton: UIButton!
    @IBOutlet var yellowButton: UIButton!
    @IBOutlet var purpleButton: UIButton!
    @IBOutlet var pinkButton: UIButton!
    @IBOutlet var orangeButton: UIButton!
    
    //テキストフィールドの宣言
    @IBOutlet var userNameTextField: UITextField!
    
    //TableViewの宣言
    @IBOutlet var table: UITableView!
    
    //このゲームの中で使うユーザーデータを格納する配列を宣言
    var userInformationArray:[String] = []
    
    //Userdefaultを宣言
    var saveData: UserDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addInformation() {
    
        //テキストフィールドに書かれている内容を配列に追加
        if userNameTextField.text == ""{
            
            let alert: UIAlertController = UIAlertController(title: "No data", message: "Plese write your name!", preferredStyle: .alert)
            
            let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .cancel, handler:{
                  // ボタンが押された時の処理を書く（クロージャ実装）
                  (action: UIAlertAction!) -> Void in
                 
              })
            
            alert.addAction(cancelAction)
            
            present(alert, animated: true, completion: nil)
            
        }else if let userName = userNameTextField.text{
            
            userInformationArray.append(user(name:userName, color: "red", point: 0))
            
        }
        
    func performSegueToResult(){
            
     //画面遷移
     performSegue(withIdentifier: "set", sender: nil)
        
      }
    }
    
    
    @IBAction func saveUserInformation() {
        
        saveData.setValue(userInformationArray, forKey: "user")
      
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "user"{
          
          //画面遷移を変数に入れる
            let viewController = segue.destination as! DataSelectViewController
          
          //遷移先のsaveDataにこっちのsavedateを代入する
            viewController.saveData = self.saveData
        }
        
    }
    
//    func changeButtonsColor(){
//
//    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
