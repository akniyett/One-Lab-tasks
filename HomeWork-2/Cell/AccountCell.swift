//
//  AccountCell.swift
//  HomeWork-2
//
//  Created by Akniyet Turdybay on 22.04.2022.
//

import UIKit



typealias AccountCellConfigurator = TableCellConfigurator<AccountCell, Account>

class AccountCell: UITableViewCell, ConfigurableCell {
    typealias DataType = Account
    static let didTapButtonAction = "AccountCellDidTapButtonAction"
    static let didTapFollowButtonAction = "AccountCellDidTapFollowButtonAction"
    
    private let avatarImageView: UIImageView = {
        let avatarImageView = UIImageView()
        return avatarImageView
    }()
    
    private let accountName: UILabel = {
        let accountName = UILabel()
        accountName.font = UIFont.systemFont(ofSize: 15)
        accountName.textColor = .black
        return accountName
    }()
    
    private let friendsNumber: UILabel = {
        let friendsNumber = UILabel()
        friendsNumber.font = UIFont.systemFont(ofSize: 13)
        friendsNumber.textColor = .systemGray
        return friendsNumber
    }()
    
    
    private let addButton: UIButton = {
        let addButton = UIButton()
        addButton.tintColor = .systemBlue
        addButton.titleLabel?.text = "ADD".localized()
        addButton.layer.borderWidth = 1
        addButton.layer.borderColor = UIColor.systemBlue.cgColor
        addButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
//        addButton.addTarget(self, action: #selector(addButtonPressed), for: .touchUpInside)
        return addButton
    }()
    
    @objc private func didTapButton() {
            CellAction.custom(type(of: self).didTapButtonAction).invoke(cell: self)
        }
    
    func addButtonPressed(){
        addButton.tintColor = .systemGray5
        imageButton.image = UIImage(systemName: "checkmark.circle.fill")
        buttonLabel.text = "ADDED".localized()
        buttonLabel.textColor = .systemGray5
        addButton.layer.borderColor = UIColor.systemGray5.cgColor
        
        addButton.snp.remakeConstraints { make in
            make.width.equalTo(contentView.frame.width / 5.5 + 20)
            make.height.equalTo(contentView.frame.height / 3)
            make.centerY.equalToSuperview()
            make.trailing.equalTo(contentView).inset(contentView.frame.width / 20)
        }
    }
    
    private let buttonLabel: UILabel = {
       let buttonLabel = UILabel()
        buttonLabel.text = "ADD".localized()
        buttonLabel.textColor = .systemBlue
        buttonLabel.font = UIFont.boldSystemFont(ofSize: 13)
        return buttonLabel
    }()
    private let imageButton: UIImageView = {
        let imageButton = UIImageView(image: UIImage(systemName: "plus.circle"))
        return imageButton
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
        avatarImageView.layer.masksToBounds = true
        avatarImageView.layer.cornerRadius = contentView.frame.height / 2
        avatarImageView.snp.makeConstraints { make in
            make.width.equalTo(contentView.frame.height - 20)
            make.height.equalTo(contentView.frame.height - 20)
            make.leading.equalToSuperview().inset(contentView.frame.width / 25)
            make.centerY.equalToSuperview()
        }
        avatarImageView.layer.cornerRadius = (contentView.frame.height - 20) / 2
        
        accountName.font = UIFont.systemFont(ofSize: contentView.frame.width / 18)
        accountName.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(contentView.frame.height / 5)
            make.left.equalTo(avatarImageView).inset(contentView.frame.width / 5)
        }
        friendsNumber.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(contentView.frame.height / 1.75)
            make.left.equalTo(avatarImageView).inset(contentView.frame.width / 5)
        }
        addButton.addSubview(imageButton)
        addButton.addSubview(buttonLabel)
        addButton.layer.cornerRadius = contentView.frame.height / 6
        addButton.snp.makeConstraints { make in
            make.width.equalTo(contentView.frame.width / 5.5)
            make.height.equalTo(contentView.frame.height / 3)
            make.centerY.equalToSuperview()
            make.trailing.equalTo(contentView).inset(contentView.frame.width / 20)
        }
        
        imageButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().inset(5)
        }
        buttonLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(5)
            make.leading.equalTo(imageButton).inset(imageButton.frame.width + 5)
        }
        
        
    }
    
    func configureCell(data acc: Account){
        avatarImageView.image = UIImage(named: acc.imageName)
        accountName.text = acc.fullname
        friendsNumber.text = String(acc.friendsCount) + " Friends".localized()
    }
    
    private func layoutUI(){

        contentView.addSubview(avatarImageView)
        contentView.addSubview(accountName)
        contentView.addSubview(friendsNumber)
        contentView.addSubview(addButton)
        
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        accessoryType = .none
    }

}
