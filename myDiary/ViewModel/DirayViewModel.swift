//
//  DirayViewModel.swift
//  myDiary
//
//  Created by Ki Hyun on 2022/02/11.
//

import Foundation
import RealmSwift

class DiaryViewModel {
    let realm = try! Realm()
    var diaryDatas : Results<DiaryModel>?
    
    init(){
        diaryDatas = realm.objects(DiaryModel.self)
    }

    
    func addDiary(_ data : DiaryModel) {
        try! realm.write{
            realm.add(data)
        }
    }
    
    func delDiary(_ index : Int){
        try! realm.write {
            realm.delete((diaryDatas?[index])!)
        }
    }

    
}
