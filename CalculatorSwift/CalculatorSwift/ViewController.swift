//
//  ViewController.swift
//  CalculatorSwift
//
//  Created by admin on 11/11/2016.
//  Copyright © 2016 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var labelstring = ""
    lazy var label:UILabel = {
        let label = UILabel()
                label.backgroundColor = UIColor.lightGray
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 30)
        label.text = "0"
        return label
    }()
    let kScreenW = UIScreen.main.bounds.width
    let kScreenH = UIScreen.main.bounds.height
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }


}

//MARK:- 设置UI
extension ViewController {
    fileprivate func setupUI() {
        view.backgroundColor = UIColor.black
        let btnW = (kScreenW - 3) / 4
        print(btnW)
        
        let labelH = kScreenH - (btnW * 5 + 4)
        label.frame = CGRect(x: 5, y: 25, width: kScreenW-10, height: labelH - 25)
        view.addSubview(label)
        
        var count = 0
        let arr = [3,11,15,7,19]
        guard let image = UIImage(named: "normal") else { return }
        guard let imageS = UIImage(named: "normal_sign") else { return }
        for i in 0...4 {
            for j in 0...3 {
                let btnX = (btnW + 1.0) * CGFloat(j)
                let btnY = labelH + (btnW + 1) * CGFloat(i)
                let btn = UIButton(frame: CGRect(x: btnX, y: btnY, width: btnW, height: btnW))
                btn.tag = count
               
                if !arr.contains(count) {
                    btn.setTitleColor(UIColor.black, for: .normal)
                }
                
                switch count {
                case 0:
                    setButtonBackgroundimageAndTitle(btn, image, "AC")
                case 1:
                    setButtonBackgroundimageAndTitle(btn, image, "+/-")
                case 2:
                    setButtonBackgroundimageAndTitle(btn, image, "%")
                case 3:
                    setButtonBackgroundimageAndTitle(btn, imageS, "/")
                case 4:
                    setButtonBackgroundimageAndTitle(btn, image, "7")
                case 5:
                    setButtonBackgroundimageAndTitle(btn, image, "8")
                case 6:
                    setButtonBackgroundimageAndTitle(btn, image, "9")
                case 7:
                    setButtonBackgroundimageAndTitle(btn, imageS, "X")
                case 8:
                    setButtonBackgroundimageAndTitle(btn, image, "4")
                case 9:
                    setButtonBackgroundimageAndTitle(btn, image, "5")
                case 10:
                    setButtonBackgroundimageAndTitle(btn, image, "6")
                case 11:
                    setButtonBackgroundimageAndTitle(btn, imageS, "-")
                case 12:
                    setButtonBackgroundimageAndTitle(btn, image, "1")
                case 13:
                    setButtonBackgroundimageAndTitle(btn, image, "2")
                case 14:
                    setButtonBackgroundimageAndTitle(btn, image, "3")
                case 15:
                    setButtonBackgroundimageAndTitle(btn, imageS, "+")
                case 16:
                    btn.removeFromSuperview()
                    let button = UIButton(frame: CGRect(x: btnX-6, y: btnY, width: btnW*2+12, height: btnW))
                    button.setTitleColor(UIColor.black, for: .normal)
                    view.addSubview(button)
                    setButtonBackgroundimageAndTitle(button, image, "0")
                case 17:
                    btn.removeFromSuperview()
                case 18:
                    setButtonBackgroundimageAndTitle(btn, image, ".")
                case 19:
                    setButtonBackgroundimageAndTitle(btn, imageS, "=")
                default:
                    break
                }
                count += 1
                view.addSubview(btn)
            }
        }
    }
    
    //MARK:- 设置button背景图片和title
    private func setButtonBackgroundimageAndTitle(_ btn : UIButton,_ image : UIImage, _ title : String) {
        btn.setTitle(title, for: .normal)
        btn.setBackgroundImage(image, for: .normal)
        btn.addTarget(self, action:#selector(btnAction(_:)), for: .touchUpInside)
    }
    
    //MARK:- 添加button点击方法
    @objc private func btnAction(_ btn : UIButton) {
    
    }
    
   
    
}
