//
//  FavJokeListViewController.swift
//  GameList
//
//  Created by 梁程 on 2021/10/19.
//

import UIKit

class FavJokeListViewController: UIViewController {
    
    let favLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont(name: "Futura-MediumItalic", size: 40)
        lbl.text = "My Favorites"
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

    var jokeList: [JokeModel] = []
    
    let jokeTableView: UITableView = {
        let tv = UITableView()
        
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.separatorStyle = .none
        tv.estimatedRowHeight = 100
        tv.backgroundColor = .clear
        tv.rowHeight = UITableView.automaticDimension
        return tv
    }()
    
    @objc func backAction(sender: UIButton){
        sender.showAnimation {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let data = UserDefaults.standard.object(forKey: "Jokes") as? NSData {
        jokeList = NSKeyedUnarchiver.unarchiveObject(with: data as Data) as! [JokeModel]
         }
        self.navigationController?.navigationBar.isHidden = true
        let image = UIImage(named: "bgGradient")
        let bgColor = UIColor.init(patternImage: image!)
        view.backgroundColor = bgColor
        
        jokeTableView.delegate = self
        jokeTableView.dataSource = self
        jokeTableView.register(JokeCell.self, forCellReuseIdentifier: "JokeCell")
        
        backButton.addTarget(self, action: #selector(backAction(sender:)), for: .touchUpInside)
        

        

        view.addSubview(favLabel)
        favLabel.snp.makeConstraints { make  in
            make.top.equalTo(view).offset(80)
            make.centerX.equalTo(view)
        }
        
        view.addSubview(backButton)
        backButton.snp.makeConstraints { make  in
            make.right.equalTo(favLabel.snp_leftMargin).offset(-20)
            make.centerY.equalTo(favLabel).offset(3)
        }
    
        view.addSubview(jokeTableView)
        jokeTableView.snp.makeConstraints { make in
            make.top.equalTo(favLabel.snp_bottomMargin).offset(20)
            make.bottom.equalTo(view)
            make.left.equalTo(view)
            make.right.equalTo(view)
        }
    }
    

}


extension FavJokeListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jokeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "JokeCell", for: indexPath) as! JokeCell
        cell.selectionStyle = .none
        
        cell.jokeTextView.text = jokeList[indexPath.row].jokeContent
        
        return cell
    }
    
    
}
