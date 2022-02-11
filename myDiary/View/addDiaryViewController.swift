//
//  addDiaryViewController.swift
//  myDiary
//
//  Created by Ki Hyun on 2022/02/08.
//

import UIKit
import SnapKit

class addDiaryViewController: UIViewController {
    let VM = DiaryViewModel()
    
    let addTitle = UITextField()
    let addContents = UITextView()
    lazy var rightButton: UIBarButtonItem = { let button = UIBarButtonItem(barButtonSystemItem: .save , target: self, action: #selector(saveBtnTouch)); button.tag = 2; return button }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Write Diary"
        setupValue()
        setUpView()
        setConstraints()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.addContents.becomeFirstResponder()
    }
    
    // MARK: - func
    func setupValue(){
        addTitle.delegate = self
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
        let alert1 = UIAlertController(title: "메모 저장", message: "저장을 하시겠습니까?", preferredStyle: .alert)
        let ok = UIAlertAction(title: "확인", style: .default, handler: save)
        let cancle = UIAlertAction(title: "취소", style: .default, handler: nil)
        alert1.addAction(ok)
        alert1.addAction(cancle)
        present(alert1, animated: true, completion: nil)
    }
    
    func save(alert: UIAlertAction!){
        let diaryData = DiaryModel()
        diaryData.title = addTitle.text?.count == 0 ? "" : addTitle.text!
        diaryData.contents = addContents.text?.count == 0 ? "" : addContents.text!
        diaryData.date = Date()
        VM.addDiary(diaryData)
        self.navigationController?.popViewController(animated: true)
    }
}

extension addDiaryViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if(textField.isEqual(self.addTitle)){
            self.addContents.becomeFirstResponder()
        }
        return true
    }
}
