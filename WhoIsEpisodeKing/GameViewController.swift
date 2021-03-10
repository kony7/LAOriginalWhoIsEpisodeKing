//
//  GameViewController.swift
//  WhoIsEpisodeKing
//
//  Created by 小西星七 on 2021/03/01.
//

import UIKit

class GameViewController: UIViewController {
    
    //Userdefaultを宣言
    var saveData: UserDefaults = UserDefaults.standard

    //このゲームの中で使うユーザーデータを格納する配列を宣言
    var userArray:[user] = []
    
    //アイドル情報を追加する配列
    var idleArray:[idle] = []

    override func viewDidLoad() {
        
        
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
