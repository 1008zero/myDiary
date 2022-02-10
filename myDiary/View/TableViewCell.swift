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
        setupValue()
        setUpView()
        setConstraints()
    }
        
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - Cell func
        func setupValue(){
            titleLabel.font = UIFont.systemFont(ofSize: 22)
            dateLabel.font = UIFont.systemFont(ofSize: 15)
            dateLabel.textColor = .lightGray
        }
        
        func setUpView(){
            self.contentView.addSubview(titleLabel)
            self.contentView.addSubview(dateLabel)
        }
        
        func setConstraints(){
            let safeArea = self.contentView.safeAreaLayoutGuide
            
            titleLabel.snp.makeConstraints{
                $0.top.equalTo(safeArea).inset(10)
                $0.left.right.equalTo(safeArea).inset(10)
                $0.height.equalTo(contentView.frame.height / 2)
            }
            
            dateLabel.snp.makeConstraints{
                $0.top.equalTo(titleLabel.snp.bottom)
                $0.left.right.equalTo(safeArea).inset(10)
                $0.bottom.equalTo(safeArea).inset(5)
            }
        }
}
