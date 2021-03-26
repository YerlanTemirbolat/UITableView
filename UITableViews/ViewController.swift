//
//  ViewController.swift
//  UITableViews
//
//  Created by Admin on 3/25/21.
//

import UIKit

class ViewController: UIViewController {
    
    private let table = UITableView()
    private let questionReuseIdentifier = "cell"
    
    var questionData: [Question] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = "Daily Work Election"
        
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(QuestionTableViewCell.self, forCellReuseIdentifier: questionReuseIdentifier)
        table.delegate = self
        table.dataSource = self
        view.addSubview(table)
        
        constraints()
        createDummyData()
    }
    
    func createDummyData() {
        let question1 = Question(question: "How to register to vote and get an opportunity for next years?")
        let question2 = Question(question: "USA 2021 election was good like we had that in 2008?")
        let question3 = Question(question: "Who has won on the election 2021 and become the president of the USA?")
        let question4 = Question(question: "Joe Biden has been american president for next 8 years?")
        let question5 = Question(question: "Are we ready for the next level for our country, people and states?")
        
        questionData = [question1, question2, question3, question4, question5]
    }

    func constraints() {
        NSLayoutConstraint.activate([
            table.topAnchor.constraint(equalTo: view.topAnchor),
            table.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            table.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -17),
            table.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -UIScreen.main.bounds.height / 2)
        ])
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = table.cellForRow(at: indexPath) as! QuestionTableViewCell
        let questionObject = questionData[indexPath.row]
        if let unwrappedAnswer = questionObject.answer {
            questionObject.answer = !unwrappedAnswer
        } else {
            questionObject.answer = true
        }
        cell.setBackgroundColor(with: questionObject.answer!)
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questionData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: questionReuseIdentifier, for: indexPath) as! QuestionTableViewCell
        let question = questionData[indexPath.row]
        cell.configure(with: question)
        return cell
    }
}
