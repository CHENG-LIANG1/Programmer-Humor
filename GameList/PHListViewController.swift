//
//  PHListViewController.swift
//  GameList
//
//  Created by 梁程 on 2021/10/19.
//

import UIKit


class PHListViewController: UIViewController {

    let jokeTableView: UITableView = {
        let tv = UITableView()
        
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.separatorStyle = .none
        tv.estimatedRowHeight = 100
        tv.backgroundColor = .clear        
        tv.rowHeight = UITableView.automaticDimension
        return tv
    }()
    
    var jokeListData: JokeListData?
    var jokeContentList: [String] = []
    
    func GetListOfJokes(onCompletion:@escaping () -> ()){
        let urlString = "https://v2.jokeapi.dev/joke/programming?amount=10"
        
        URLSession.shared.dataTask(with: URL(string: urlString)!, completionHandler: { [self]data, response, error in
            if error == nil {
                do{
                    self.jokeListData = try JSONDecoder().decode(JokeListData.self, from: data!)
 
                    for joke in jokeListData!.jokes {
                        let jokeType = joke.type
                        
                        if jokeType == "single"{
                            jokeContentList.append(joke.joke!)
                        }else if jokeType == "twopart"{
                            let setup = (joke.setup)!
                            let delivery = (joke.delivery)!
                            
                            let jokeContent = "Q: \(setup)\n \nA: \(delivery)"
                            jokeContentList.append(jokeContent)
                        }
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
        self.navigationController?.navigationBar.isHidden = true
        jokeTableView.delegate = self
        jokeTableView.dataSource = self
        jokeTableView.register(JokeCell.self, forCellReuseIdentifier: "JokeCell")
        let image = UIImage(named: "bgGradient")
        let bgColor = UIColor.init(patternImage: image!)
        
        GetListOfJokes {
            self.jokeTableView.reloadData()
        }
        
        view.backgroundColor = bgColor
        view.addSubview(jokeTableView)
        jokeTableView.snp.makeConstraints { make in
            make.top.equalTo(view)
            make.bottom.equalTo(view)
            make.left.equalTo(view)
            make.right.equalTo(view)
        }
    }
    
}

extension PHListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "JokeCell", for: indexPath) as! JokeCell
        cell.selectionStyle = .none
        
        if jokeContentList.count > 0 {
            cell.jokeTextView.text = jokeContentList[indexPath.row]
        }


        return cell
    }
    
    
}
