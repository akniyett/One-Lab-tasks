//
//  ContactsCell.swift
//  HomeWork-2
//
//  Created by Akniyet Turdybay on 22.04.2022.
//

import UIKit

typealias ContactsCellConfigurator = TableCellConfigurator<ContactsCell, Contact>

class ContactsCell: UITableViewCell, ConfigurableCell {
    
    typealias DataType = Contact
    
    private let contactCell: UIImageView = {
        let contactCell = UIImageView()
        return contactCell
    }()
    
    private let contactLabel: UILabel = {
        let contactLabel = UILabel()
        contactLabel.font = UIFont.boldSystemFont(ofSize: 18)
        contactLabel.textColor = .systemBlue
        return contactLabel
    }()
    
  
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            layoutUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contactCell.contentMode = .scaleAspectFill
        contactCell.snp.makeConstraints { make in
            make.height.equalTo(contentView.frame.height / 3)
            make.leading.equalToSuperview().inset(contentView.frame.width / 12)
            make.centerY.equalToSuperview()
        }
        
        contactLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(contactCell).inset(contentView.frame.width / 6)
        }
        
    }
    
    func configureCell(data acc: Contact){
        contactCell.image = UIImage(systemName: acc.imageName)
        contactLabel.text = acc.contactLabel
    }
    
    private func layoutUI(){
        
        contentView.addSubview(contactCell)
        contentView.addSubview(contactLabel)
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        accessoryType = .none
    }

   

}
