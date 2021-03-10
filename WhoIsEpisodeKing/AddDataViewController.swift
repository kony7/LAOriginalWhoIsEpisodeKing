//
//  AddDataViewController.swift
//  WhoIsEpisodeKing
//
//  Created by 小西星七 on 2021/03/01.
//

import UIKit

class AddDataViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //Userdefaultを宣言
    var saveData: UserDefaults = UserDefaults.standard
    
    //テキストフィールドの宣言
    @IBOutlet var groupNameTextField: UITextField!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var idleImageView: UIImageView!
    
    //画像を一時的に保存するUIImageView
    var image: UIImage!
    
    //アイドル情報を追加する配列
    var idleArray:[idle] = []
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func imageSelectButton(){
    //ボタンを押したら画像を選択
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            
            let picker = UIImagePickerController()
                     picker.sourceType = .photoLibrary
                     picker.delegate = self
                     
                     picker.allowsEditing = false
                     
                     present(picker, animated: true, completion: nil)
            
        }
        
        image = idleImageView.image
        
    }
    
    @IBAction func doneButton(){
        
        //UIImageのデータをStringの文字列にして保存するかNSDataの型をカスタムクラスに追加してimageNameを消す
        
        if nameTextField.text == "" || groupNameTextField.text == ""{
            
            let alert: UIAlertController = UIAlertController(title: "No data", message: "Plese write your name!", preferredStyle: .alert)
            
            let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .cancel, handler:{
                  // ボタンが押された時の処理を書く（クロージャ実装）
                  (action: UIAlertAction!) -> Void in
                 
              })
            
            alert.addAction(cancelAction)
            
            present(alert, animated: true, completion: nil)
            
        }else if let idleName = nameTextField.text, let groupName = groupNameTextField.text{
            
            idleArray.append(idle(group: groupName, name: idleName, imageName: <#T##String#>))
        
    }
    

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        //画像が読み込まれたらidleImageViewに現す
        idleImageView.image = info[.editedImage] as? UIImage
        dismiss(animated: true, completion: nil)
        
    }
    
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
