//
//  ViewController.swift
//  menu-test
//
//  Created by 张聪 on 2020/8/3.
//  Copyright © 2020 Touch. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var menus: [String]?
    var btns = [UIButton]()
    var selectedIndex = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        menus = ["cars","news","fruits"]
        
        //ui
        //设置按钮默认状态
        //设置按钮事件响应
        setupUI()
    }


}
extension ViewController {
    func setupUI() {
        print("...")
        guard let menus = menus else {
            return
        }
        for (index,item) in menus.enumerated() {
            print(item,index)
            let x = index * 100
            let y = 50
            let width = 100
            let height = 50
            let btn = UIButton(type: .custom)
            btn.frame = CGRect(x: x, y: y, width: width, height: height)
            btn.tag = 1000+index
            btn.addTarget(self, action: #selector(click), for: .touchUpInside)
            if index == selectedIndex {
                btn.setupBtn(title: item, color: .red)
            }else{
                btn.setupBtn(title: item, color: .black)
            }
            view.addSubview(btn)

            btns.append(btn)
        }
    }
    @objc func click(btn: UIButton) {
        selectedIndex = btn.tag - 1000
        btn.setTitleColor(UIColor.red, for: .normal)
        for btnItem in btns {
            if btnItem != btn{
                btnItem.setTitleColor(.black, for: .normal)

            }
        }
        
    }
    
}
extension UIButton {
    func setupBtn(title: String,color: UIColor) {
        self.setTitleColor(color, for: .normal)
        self.setTitle(title, for: .normal)
    }
    

}

