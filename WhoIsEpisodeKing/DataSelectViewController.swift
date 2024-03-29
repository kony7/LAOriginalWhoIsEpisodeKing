//
//  DataSelectViewController.swift
//  WhoIsEpisodeKing
//
//  Created by 小西星七 on 2021/03/01.
//

import UIKit

class DataSelectViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    //Userdefaultを宣言
    var saveData: UserDefaults = UserDefaults.standard
    
    //TableViewの宣言
    @IBOutlet var table: UITableView!
    
    //アイドル情報を追加する配列
    var idleArray:[idle] = []
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        loadIdleArray()

        table.dataSource = self
        table.delegate = self
       
    }
    
    override func viewDidAppear(_ animated: Bool) {
          
        loadIdleArray()
        table.reloadData()
        
    }
    
    //テーブルビューの設定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //セル数の指定
        return  idleArray.count
//        return 10

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        //"Cell"というIDのセルを取得
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")

        //セル内のタグをつけたパーツにアクセス
        let groupName = cell?.contentView.viewWithTag(1) as! UILabel
        let name = cell?.contentView.viewWithTag(2) as! UILabel
//        let idleImage = cell?.contentView.viewWithTag(3) as! UIImageView
        
        let serialNumber:Int! = indexPath.row
        
//        print("アイドル配列の中身は")
//        print(idleArray[0].group ?? String())
        
        //パーツにテキストと画像を反映
        groupName.text = idleArray[serialNumber].group
        name.text = idleArray[serialNumber].name
//        idleImage.image = idleArray[serialNumber].getImage()
       
        return cell!
           
       }
    
    //画面遷移をするときにTaskWriteViewControllerに編集用の情報を渡す

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
          if segue.identifier == "addDataSegue"{
            
            //画面遷移を変数に入れる
            let viewController = segue.destination as! AddDataViewController
            
            //遷移先のsaveDataにこっちのsavedateを代入する
            viewController.saveData = self.saveData
            
            }else if segue.identifier == "gameStart"{
                
                //画面遷移を変数に入れる
                let viewController = segue.destination as! GameViewController
                
                //遷移先のsaveDataにこっちのsavedateを代入する
                viewController.saveData = self.saveData
                
                }
          }
    
    @IBAction func toAddData(){
        
        //画面遷移
        performSegue(withIdentifier: "addDataSegue", sender: nil)
        
    }
    
    @discardableResult
    func loadIdleArray() -> [idle] {
        guard let data = saveData.data(forKey: "idle") else {
            return []
        }
        guard let idlearray = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? [idle]
            else {
                return []
        }
        
        idleArray = idlearray
        
        return idlearray
        
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
