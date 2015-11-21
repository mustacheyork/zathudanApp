//
//  ViewController.swift
//  zathudanApp
//
//  Created by Kanako Kobayashi on 2015/11/21.
//  Copyright © 2015年 Kanako Kobayashi. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var inputText: UITextField!
    
    let requestUrl = "https://api.apigw.smt.docomo.ne.jp/dialogue/v1/dialogue?xxxxxxxxxxxxxxxxxxxxxxxxx"
    
    /*
    * メッセージを表示する処理
    */
    override func viewDidLoad() {
        super.viewDidLoad()
        // 起動時は、メッセージを送信しない
        send("")

    }

    /*
    * 入力欄のメッセージを取得
    */
    @IBAction func chat(sender: AnyObject) {
        send(self.inputText.text as! AnyObject)
    }
    
    /*
    * 雑談対話APIに、メッセージを送信
    */
    func send(comment: AnyObject) {
        Alamofire.request(.POST, requestUrl, encoding: .JSON, parameters: ["utt": comment])
            .responseJSON { response in
                if let json = response.result.value {
                    self.message.text = json["utt"] as? String
                }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

