//
//  TableViewCell.swift
//  myDiary
//
//  Created by Ki Hyun on 2022/02/09.
//

import UIKit
import SnapKit

class TableViewCell : UITableViewCell {
    
    let titleLabel = UILabel()
    let dateLabel = UILabel()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        let safeArea = self.contentView.safeAreaLayoutGuide
        
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(dateLabel)
        
        titleLabel.text = "오늘의 일기"
        titleLabel.font = UIFont.systemFont(ofSize: 22)
        dateLabel.text = "2022년 02월 09월 수요일 오후 05시 17분"
        dateLabel.font = UIFont.systemFont(ofSize: 15)
        dateLabel.textColor = .lightGray
        
        titleLabel.snp.makeConstraints{
            $0.top.equalTo(safeArea).inset(10)
            $0.left.right.equalTo(safeArea).inset(10)
            $0.height.equalTo(contentView.frame.height / 2)
        }
        
        dateLabel.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(5)
            $0.left.right.equalTo(safeArea).inset(10)
            $0.bottom.equalTo(safeArea).inset(5)
        }
        
    }
        
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
