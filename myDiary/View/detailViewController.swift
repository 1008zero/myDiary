//
//  detaliViewController.swift
//  myDiary
//
//  Created by Ki Hyun on 2022/02/10.
//

import UIKit
import SnapKit
import RealmSwift

class detailViewController: UIViewController {
    let realm = try! Realm()
    
    let addTitle = UITextField()
    let addContents = UITextView()
    lazy var rightButton: UIBarButtonItem = { let button = UIBarButtonItem(barButtonSystemItem: .save , target: self, action: #selector(saveBtnTouch)); button.tag = 2; return button }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Detail Diary"
        setupValue()
        setUpView()
        setConstraints()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.addContents.becomeFirstResponder()
    }
    
    // MARK: - func
    func setupValue(){
        addTitle.placeholder = "제목"
        addTitle.font = UIFont.boldSystemFont(ofSize: 30)
        addContents.backgroundColor = .bgColor
        addContents.font = UIFont.systemFont(ofSize: 20)
    }
        
    func setUpView(){
        self.view.addSubview(addTitle)
        self.view.addSubview(addContents)
        self.navigationItem.rightBarButtonItem = self.rightButton
    }
        
    func setConstraints(){
        let safeArea = self.view.safeAreaLayoutGuide
        
        addTitle.snp.makeConstraints{
            $0.left.top.right.equalTo(safeArea).inset(10)
        }
        
        addContents.snp.makeConstraints{
            $0.left.right.bottom.equalTo(safeArea).inset(5)
            $0.top.equalTo(addTitle.snp.bottom).offset(5)
        }
    }
    
    @objc func saveBtnTouch(_ button: UIButton) {
        let diaryData = DiaryModel()
        diaryData.title = addTitle.text?.count == 0 ? "" : addTitle.text!
        diaryData.contents = addContents.text?.count == 0 ? "" : addContents.text!
        diaryData.date = Date()
        try! realm.write{
            realm.add(diaryData)
        }
    }

}
