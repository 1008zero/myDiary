//
//  homeViewController.swift
//  myDiary
//
//  Created by Ki Hyun on 2022/02/08.
//

import UIKit
import SnapKit
import RealmSwift

class homeViewController: UIViewController {
    let realm = try! Realm()
    var diaryDatas : Results<DiaryModel>?
    
    let tableview = UITableView()
    let addBtn = UIButton()
    lazy var leftButton: UIBarButtonItem = { let button = UIBarButtonItem(title: "setting", style: .plain, target: self, action: #selector(addBtnTouch)); button.tag = 1; return button }()
    lazy var rightButton: UIBarButtonItem = { let button = UIBarButtonItem(barButtonSystemItem: .edit , target: self, action: #selector(addBtnTouch)); button.tag = 2; return button }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupValue()
        setUpView()
        setConstraints()
        
    }
    
// MARK: - VC func
    func setupValue(){
        diaryDatas = realm.objects(DiaryModel.self)
        addBtn.backgroundColor = .btnColor
        addBtn.layer.cornerRadius = 30
        addBtn.setTitle("+", for: .normal)
        addBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        addBtn.addTarget(self, action: #selector(addBtnTouch), for: .touchUpInside)

        
        tableview.delegate = self
        tableview.dataSource = self
        tableview.register(TableViewCell.self, forCellReuseIdentifier: "cell")
        self.tableview.rowHeight = view.frame.height / 12
        tableview.backgroundColor = .bgColor
    }
    
    func setUpView(){
        self.view.addSubview(tableview)
        self.view.addSubview(addBtn)
        self.navigationItem.leftBarButtonItem = self.leftButton
        self.navigationItem.rightBarButtonItem = self.rightButton
    }
    
    func setConstraints(){
        let safeArea = view.safeAreaLayoutGuide
        tableview.snp.makeConstraints {
            $0.top.left.bottom.right.equalTo(safeArea)
        }
        addBtn.snp.makeConstraints{
            $0.height.width.equalTo(60)
            $0.bottom.equalToSuperview().inset(50)
            $0.right.equalToSuperview().inset(25)
        }
    }
    
    @objc func addBtnTouch(_ button: UIButton) {
        let addVC = addDiaryViewController()
        self.navigationController?.pushViewController(addVC, animated: true)
    }
    
    func DateTypeToString(_ d : Date) -> String{
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_kr")
        formatter.timeZone = TimeZone(abbreviation: "KST")
        formatter.dateFormat = "yyyy년 MM월 dd일 a hh시 mm분"
        return formatter.string(from: d)
    }
}

// MARK: - extension
extension homeViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = detailViewController()
        detailVC.addTitle.text = diaryDatas?[indexPath.row].title
        detailVC.addContents.text = diaryDatas?[indexPath.row].contents
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}

extension homeViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return diaryDatas!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableview.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell else { return UITableViewCell() }
        cell.backgroundColor = .bgColor
        cell.titleLabel.text = diaryDatas?[indexPath.row].title
        cell.dateLabel.text = DateTypeToString(diaryDatas![indexPath.row].date)
        return cell
    }
    
    
}

