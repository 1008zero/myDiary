//
//  Model.swift
//  myDiary
//
//  Created by Ki Hyun on 2022/02/08.
//
// 0. 디테일 뷰 화면 구현
// 1. 설정 화면 구현
// 2. 메모리스트 수정 구현
// 3. 비밀번호 구현
// 4. RxSwift + MVVM으로 구현


import Foundation
import RealmSwift

class DiaryModel : Object {
    @objc dynamic var title = ""
    @objc dynamic var contents = ""
    @objc dynamic var date = Date()
}
