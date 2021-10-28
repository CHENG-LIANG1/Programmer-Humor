//
//  AboutViewController.swift
//  GameList
//
//  Created by 梁程 on 2021/10/20.
//

import UIKit

class AboutViewController: UIViewController {

    let headingLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont(name: "Futura-MediumItalic", size: 40)
        lbl.text = "About Us"
        let image = UIImage(named: "textGradient")
        lbl.textColor = UIColor.init(patternImage: image!)
        return lbl
    }()
    
    let backButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "back")?.withTintColor(.white).withRenderingMode(.alwaysOriginal), for: .normal)
        Tools.setWidth(btn, 40)
        Tools.setHeight(btn, 40)
        
        return btn
    }()
    
    let logoImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "logo")
        iv.layer.borderWidth = 10
        iv.clipsToBounds = true
        let image = UIImage(named: "bdGradient")
        iv.layer.borderColor = UIColor.init(patternImage: image!).cgColor
        iv.layer.cornerRadius = 20
        Tools.setHeight(iv, 250)
        Tools.setWidth(iv, 250)
        return iv
    }()
    
    let versionLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont(name: "Futura-MediumItalic", size: 25)
        lbl.text = "Version: 1.0.0"
        let image = UIImage(named: "textGradient")
        lbl.textColor = UIColor.init(patternImage: image!)
        return lbl
    }()
    
    @objc func backAction(sender: UIButton){
        sender.showAnimation {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.isHidden = true
        let image = UIImage(named: "bgGradient")
        let bgColor = UIColor.init(patternImage: image!)
        view.backgroundColor = bgColor
        
        backButton.addTarget(self, action: #selector(backAction(sender:)), for: .touchUpInside)
        
        view.addSubview(headingLabel)
        headingLabel.snp.makeConstraints { make  in
            make.top.equalTo(view).offset(80)
            make.centerX.equalTo(view)
        }
        
        view.addSubview(backButton)
        backButton.snp.makeConstraints { make  in
            make.right.equalTo(headingLabel.snp_leftMargin).offset(-20)
            make.centerY.equalTo(headingLabel).offset(3)
        }
        
        view.addSubview(logoImageView)
        logoImageView.snp.makeConstraints { make  in
            make.centerX.equalTo(view)
            make.centerY.equalTo(view)
        }
        
        view.addSubview(versionLabel)
        versionLabel.snp.makeConstraints { make  in
            make.centerX.equalTo(view)
            make.bottom.equalTo(view).offset(-20)
        }
    }
}
