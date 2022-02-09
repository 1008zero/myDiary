//
//  homeViewController.swift
//  myDiary
//
//  Created by Ki Hyun on 2022/02/08.
//

import UIKit
import SnapKit

class homeViewController: UIViewController {
    
    let tableview = UITableView()
    let addBtn = UIButton()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupValue()
        setUpView()
        setConstraints()
        
    }
    
// MARK: - VC func
    func setupValue(){
        addBtn.backgroundColor = .btnColor
        addBtn.layer.cornerRadius = 30
        addBtn.setTitle("+", for: .normal)
        addBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        addBtn.addTarget(self, action: #selector(addBtnTouch), for: .touchUpInside)

        
        tableview.delegate = self
        tableview.dataSource = self
        tableview.register(TableViewCell.self, forCellReuseIdentifier: "cell")
        self.tableview.rowHeight = view.frame.height / 15
        tableview.backgroundColor = .bgColor
    }
    
    func setUpView(){
        self.view.addSubview(tableview)
        self.view.addSubview(addBtn)
    }
    
    func setConstraints(){
        let safeArea = view.safeAreaLayoutGuide
        tableview.snp.makeConstraints {
            $0.top.left.bottom.right.equalTo(safeArea)
        }
        addBtn.snp.makeConstraints{
            $0.height.width.equalTo(60)
            $0.bottom.right.equalToSuperview().inset(50)
        }
    }
    
    @objc func addBtnTouch(_ button: UIButton) {
        let addVC = addDiaryViewController()
        self.navigationController?.pushViewController(addVC, animated: true)
//        addVC.modalPresentationStyle = .fullScreen
//        self.present(addVC, animated: true, completion: nil)
    }
}

// MARK: - extension
extension homeViewController : UITableViewDelegate{
    
}

extension homeViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableview.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell else { return UITableViewCell() }
        cell.backgroundColor = .bgColor
        return cell
    }
    
    
}

