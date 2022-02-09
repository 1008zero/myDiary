//
//  Model.swift
//  myDiary
//
//  Created by Ki Hyun on 2022/02/08.
//

import Foundation
import RealmSwift

class DiaryModel : Object {
    @objc dynamic var title = ""
    @objc dynamic var contents = ""
    @objc dynamic var date = Date()
}
