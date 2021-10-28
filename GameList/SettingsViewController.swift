//
//  AboutViewController.swift
//  GameList
//
//  Created by 梁程 on 2021/10/18.
//

import UIKit

class SettingsViewController: UIViewController {
    let offset = 30
    var rewardedVideoAd: BUNativeExpressRewardedVideoAd?
    var activityIndicator: UIActivityIndicatorView?
    
    let settingsLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont(name: "Futura-MediumItalic", size: 40)
        lbl.text = "Settings"
        let image = UIImage(named: "textGradient")
        lbl.textColor = UIColor.init(patternImage: image!)
        return lbl
    }()
    
    let favButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("My Favorites", for: .normal)
        
        let image = UIImage(named: "cellGradient")
        let color = UIColor.init(patternImage: image!)
        
        btn.titleLabel!.font = UIFont(name: "menlo-bold", size: 25)
        
        let image2 = UIImage(named: "bgGradient")
        let color2 = UIColor.init(patternImage: image2!)
        btn.setTitleColor(color2, for: .normal)
        
        btn.setBackgroundColor(color: color, forState: .normal)
        btn.layer.cornerRadius = 15
        Tools.setHeight(btn, 65)
        return btn
    }()
    
    let aboutButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("About Us", for: .normal)
        
        let image = UIImage(named: "cellGradient")
        let color = UIColor.init(patternImage: image!)
        btn.setBackgroundColor(color: color, forState: .normal)
        
        btn.titleLabel!.font = UIFont(name: "menlo-bold", size: 25)
        
        let image2 = UIImage(named: "bgGradient")
        let color2 = UIColor.init(patternImage: image2!)
        btn.setTitleColor(color2, for: .normal)
        
        btn.layer.cornerRadius = 15
        Tools.setHeight(btn, 65)
        return btn
    }()
    
    let shareButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Share Us", for: .normal)
        
        let image = UIImage(named: "cellGradient")
        let color = UIColor.init(patternImage: image!)
        btn.setBackgroundColor(color: color, forState: .normal)
        
        btn.titleLabel!.font = UIFont(name: "menlo-bold", size: 25)
        
        let image2 = UIImage(named: "bgGradient")
        let color2 = UIColor.init(patternImage: image2!)
        btn.setTitleColor(color2, for: .normal)
        
        btn.layer.cornerRadius = 15
        Tools.setHeight(btn, 65)
        return btn
    }()
    
    let adButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Support Us", for: .normal)
        
        let image = UIImage(named: "cellGradient")
        let color = UIColor.init(patternImage: image!)
        btn.setBackgroundColor(color: color, forState: .normal)
        
        btn.titleLabel!.font = UIFont(name: "menlo-bold", size: 25)
        
        let image2 = UIImage(named: "bgGradient")
        let color2 = UIColor.init(patternImage: image2!)
        btn.setTitleColor(color2, for: .normal)
        
        btn.layer.cornerRadius = 15
        Tools.setHeight(btn, 65)
        return btn
    }()
    
    
    
    
    
    func playAd(){
        let rootVC = UIApplication.shared.keyWindow?.rootViewController
        self.rewardedVideoAd?.show(fromRootViewController: rootVC!)
    }
    
    
    @objc func favAction(sender: UIButton){
        sender.showAnimation {
            let vc = FavJokeListViewController()
            vc.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @objc func aboutAction(sender: UIButton){
        sender.showAnimation {
            let vc = AboutViewController()
            vc.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @objc func shareAction(sender: UIButton){
        sender.showAnimation {
            let shareParams = NSMutableDictionary()
            
            shareParams.ssdkSetupShareParams(byText: "Programmer Humor", images: UIImage(named: "logo"), url: URL(string: "https://apps.apple.com/cn/app/mydevicelist/id1584600601"), title: "Programmer Humor", type: .auto )
            
            ShareSDK.showShareActionSheet(nil, items: nil, shareParams: shareParams, onShareStateChanged: nil)
            
        
        }
    }
    
    @objc func playAdAction(sender: UIButton){
        sender.showAnimation {
            let model = BURewardedVideoModel()
            model.userId = "user1"
            self.rewardedVideoAd = BUNativeExpressRewardedVideoAd.init(slotID: K.reward_id, rewardedVideoModel: model)

            self.rewardedVideoAd?.delegate = self
            self.rewardedVideoAd?.loadData()
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let navBar = self.navigationController?.navigationBar
        navBar?.isHidden = true
        
        let image = UIImage(named: "bgGradient")
        let bgColor = UIColor.init(patternImage: image!)
        view.backgroundColor = bgColor
        
        favButton.addTarget(self, action: #selector(favAction(sender:)), for: .touchUpInside)
        aboutButton.addTarget(self, action: #selector(aboutAction(sender:)), for: .touchUpInside)
        shareButton.addTarget(self, action: #selector(shareAction(sender:)), for: .touchUpInside)
        adButton.addTarget(self, action: #selector(playAdAction(sender:)), for: .touchUpInside)

        view.addSubview(settingsLabel)
        settingsLabel.snp.makeConstraints { make  in
            make.top.equalTo(view).offset(80)
            make.centerX.equalTo(view)
        }
        
        view.addSubview(favButton)
        favButton.snp.makeConstraints { make  in
            make.left.equalTo(view).offset(offset)
            make.right.equalTo(view).offset(-offset)
            make.top.equalTo(settingsLabel.snp_bottomMargin).offset(offset)
        }
        
        view.addSubview(aboutButton)
        aboutButton.snp.makeConstraints { make  in
            make.left.equalTo(view).offset(offset)
            make.right.equalTo(view).offset(-offset)
            make.top.equalTo(favButton.snp_bottomMargin).offset(offset)
        }
        
        view.addSubview(shareButton)
        shareButton.snp.makeConstraints { make  in
            make.left.equalTo(view).offset(offset)
            make.right.equalTo(view).offset(-offset)
            make.top.equalTo(aboutButton.snp_bottomMargin).offset(offset)
        }
        
        view.addSubview(adButton)
        adButton.snp.makeConstraints { make in
            make.left.equalTo(view).offset(offset)
            make.right.equalTo(view).offset(-offset)
            make.top.equalTo(shareButton.snp_bottomMargin).offset(offset)
        }
    }
}

extension SettingsViewController: BUNativeExpressRewardedVideoAdDelegate {
    func nativeExpressRewardedVideoAdDidDownLoadVideo(_ rewardedVideoAd: BUNativeExpressRewardedVideoAd) {
        activityIndicator?.stopAnimating()
        playAd()
    }
}
