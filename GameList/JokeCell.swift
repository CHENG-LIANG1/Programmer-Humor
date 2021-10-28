//
//  JokeCell.swift
//  GameList
//
//  Created by 梁程 on 2021/10/19.
//

import UIKit
import SnapKit

class JokeCell: UITableViewCell {
    
    let offset = 20
    
    let containerView: UIView  = {
        let view = UIView()
        let image = UIImage(named: "cellGradient")
        let color = UIColor.init(patternImage: image!)
        view.backgroundColor = color
        view.layer.cornerRadius = 15
        
        return view
    }()
    
    let jokeTextView: UITextView = {
        let tv = UITextView()
        tv.font = UIFont(name: "menlo-bold", size: 20)
        tv.adjustsFontForContentSizeCategory = true
        tv.isScrollEnabled = false
        tv.isEditable = false
        tv.isSelectable = false

        tv.backgroundColor = .clear
        let image = UIImage(named: "bgGradient")
        tv.textColor = UIColor.init(patternImage: image!)
        return tv
    }()


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
         super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let image = UIImage(named: "bgGradient")
        let bgColor = UIColor.init(patternImage: image!)
        contentView.backgroundColor = bgColor
        contentView.addSubview(containerView)
        containerView.snp.makeConstraints { make  in
            make.top.equalTo(contentView).offset(offset / 2)
            make.left.equalTo(contentView).offset(offset)
            make.bottom.equalTo(contentView).offset(-offset / 2)
            make.right.equalTo(contentView).offset(-offset)
        }
        
        containerView.addSubview(jokeTextView)
        jokeTextView.snp.makeConstraints { make  in
            make.top.equalTo(containerView).offset(8)
            make.left.equalTo(containerView).offset(10)
            make.right.equalTo(containerView).offset(-8)
            make.bottom.equalTo(containerView).offset(-10)
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
