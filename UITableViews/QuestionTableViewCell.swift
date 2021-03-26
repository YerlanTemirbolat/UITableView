//
//  QuestionTableViewCell.swift
//  UITableViews
//
//  Created by Admin on 3/25/21.
//

import UIKit

class QuestionTableViewCell: UITableViewCell {
    
    let questionLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        questionLabel.text = "Hello"
        questionLabel.textAlignment = .center
        questionLabel.font = UIFont.systemFont(ofSize: 15)
        questionLabel.numberOfLines = 2
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(questionLabel)
        
        constraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with questionObject: Question) {
        questionLabel.text = questionObject.question
    }

    func setBackgroundColor(with answer: Bool) {
        if answer {
            contentView.backgroundColor = UIColor.init(red: 244/255, green: 250/255, blue: 240/255, alpha: 1)
        } else {
            contentView.backgroundColor = UIColor.init(red: 253/255, green: 193/255, blue: 193/255, alpha: 1)
        }
    }
    
    func constraints() {
        NSLayoutConstraint.activate([
            questionLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 14),
            questionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 9),
            questionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -9),
            questionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -14)
        ])
    }
}
