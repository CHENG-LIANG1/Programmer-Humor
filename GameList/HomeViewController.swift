//
//  HomeViewController.swift
//  GameList
//
//  Created by 梁程 on 2021/10/18.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    
    var jokeData: JokeData?
    var jokeContent: String?
    
    
    let jodLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont(name: "Futura-MediumItalic", size: 40)
        lbl.text = "Joke of the day"
        let image = UIImage(named: "textGradient")
        lbl.textColor = UIColor.init(patternImage: image!)
        return lbl
    }()
    
    let jokeTextView: UITextView = {
        let tv = UITextView()
        tv.font = UIFont(name: "menlo-bold", size: 30)
        tv.adjustsFontForContentSizeCategory = true
        tv.isScrollEnabled = false
        tv.isEditable = false
        tv.isSelectable = false
        tv.backgroundColor = .clear
        let image = UIImage(named: "tfGradient")
        tv.textColor = UIColor.init(patternImage: image!)
        return tv
    }()
    
    let favButton: UIButton = {
        let btn = UIButton()
        let btnImageNormal = UIImage(named:"heart")?.withTintColor(K.brandRed).withRenderingMode(.alwaysOriginal)
        let btnImageSelected = UIImage(named:"heart.fill")?.withTintColor(K.brandRed).withRenderingMode(.alwaysOriginal)
        
        btn.imageView?.contentMode = .scaleToFill
        btn.setImage(btnImageNormal, for: .normal)
        btn.setImage(btnImageSelected, for: .selected)
        btn.setImage(btnImageSelected, for: .highlighted)
        
        btn.contentVerticalAlignment = .fill
        btn.contentHorizontalAlignment = .fill
        
        Tools.setHeight(btn, 55)
        Tools.setWidth(btn, 55)
        
        return btn
    }()
    
    let shareButton: UIButton = {
        let btn = UIButton()
        let btnImageNormal = UIImage(named:"share")?.withTintColor(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)).withRenderingMode(.alwaysOriginal)

        btn.imageView?.contentMode = .scaleToFill
        btn.setImage(btnImageNormal, for: .normal)

        btn.contentVerticalAlignment = .fill
        btn.contentHorizontalAlignment = .fill
        
        Tools.setHeight(btn, 55)
        Tools.setWidth(btn, 55)
        
        return btn
    }()

    @objc func favAction(sender: UIButton){
        sender.showAnimation { [self] in
            var jokeArray = [JokeModel]()
            if let data = UserDefaults.standard.object(forKey: "Jokes") as? NSData {
                jokeArray = NSKeyedUnarchiver.unarchiveObject(with: data as Data) as! [JokeModel]
             }
            if sender.isSelected == false {
                sender.isSelected = true
                let joke = JokeModel(content: jokeTextView.text!, isFav: true)
                jokeArray.append(joke)
                
            }else{
                sender.isSelected = false
                let joke = JokeModel(content: jokeTextView.text!, isFav: false)
                
                for i in 0..<jokeArray.count {
                    if jokeArray[i].jokeContent == jokeTextView.text!{
                        jokeArray.remove(at: i)
                    }
                }
            }
            
            let data = NSKeyedArchiver.archivedData(withRootObject: jokeArray)
            UserDefaults.standard.setValue(data, forKey: "Jokes")
        }
    }
    
    @objc func shareAction(sender: UIButton){
        sender.showAnimation {
            let text = self.jokeContent!
            let textShare = [ text ]
            let activityViewController = UIActivityViewController(activityItems: textShare , applicationActivities: nil)
            activityViewController.popoverPresentationController?.sourceView = self.view
            activityViewController.isModalInPresentation = true
            self.present(activityViewController, animated: true, completion: nil)
        }
    }
    
    

    func GetRandomJoke(onCompletion:@escaping () -> ()){
        let urlString = "https://v2.jokeapi.dev/joke/programming"
        
        URLSession.shared.dataTask(with: URL(string: urlString)!, completionHandler: { [self]data, response, error in
            if error == nil {
                do{
                    self.jokeData = try JSONDecoder().decode(JokeData.self, from: data!)
                    
                    let jokeType = jokeData?.type
                    
                    if jokeType == "single"{
                        jokeContent = jokeData?.joke!
                    }else if jokeType == "twopart"{
                        let setup = (jokeData?.setup)!
                        let delivery = (jokeData?.delivery)!
                        
                        jokeContent = "Q: \(setup)\n \nA: \(delivery)"
                    }
                    DispatchQueue.main.async {
                        onCompletion()
                    }
                }catch{
                    //print(error)
                }
            }
        }).resume()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let navBar = self.navigationController?.navigationBar
        navBar?.isHidden = true

        GetRandomJoke {
            self.jokeTextView.text = self.jokeContent
        }
        
        let image = UIImage(named: "bgGradient")
        let bgColor = UIColor.init(patternImage: image!)
        view.backgroundColor = bgColor
        
        favButton.addTarget(self, action: #selector(favAction(sender:)), for: .touchUpInside)
        shareButton.addTarget(self, action: #selector(shareAction(sender:)), for: .touchUpInside)
        
        view.addSubview(jodLabel)
        jodLabel.snp.makeConstraints { make  in
            make.top.equalTo(view).offset(80)
            make.centerX.equalTo(view)
        }
        
        view.addSubview(jokeTextView)
        Tools.setHeight(jokeTextView, Float(K.screenHeight) / 2)
        jokeTextView.snp.makeConstraints { make  in
            make.left.equalTo(view).offset(20)
            make.right.equalTo(view).offset(-20)
            make.centerY.equalTo(view)
        }
        
        view.addSubview(favButton)
        favButton.snp.makeConstraints { make  in
            make.bottom.equalTo(view).offset(-30)
            make.left.equalTo(view).offset(100)
        }
        
        view.addSubview(shareButton)
        shareButton.snp.makeConstraints { make  in
            make.right.equalTo(view).offset(-100)
            make.bottom.equalTo(view).offset(-30)
        }
    }
}
