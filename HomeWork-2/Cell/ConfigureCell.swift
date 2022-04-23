//
//  ConfigureCell.swift
//  HomeWork-2
//
//  Created by Akniyet Turdybay on 20.04.2022.
//

import UIKit

class ConfigureCell: UICollectionViewCell {
    
    static let identifier = "cell"
    
    private let profileImageView: UIImageView = {
        let profileImageView = UIImageView()
        return profileImageView
    }()
    
    private let fullnameLabel: UILabel = {
        let fullnameLabel = UILabel()
        fullnameLabel.textColor = .black
        fullnameLabel.textAlignment = .center
        return fullnameLabel
    }()
    
    private let roleLabel: UILabel = {
        let roleLabel = UILabel()
        roleLabel.font = UIFont.systemFont(ofSize: 15)
        roleLabel.textColor = .systemGray
        roleLabel.textAlignment = .center
        return roleLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutUI()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.addSubview(profileImageView)
        contentView.addSubview(fullnameLabel)
        contentView.addSubview(roleLabel)
        
        profileImageView.layer.masksToBounds = true
        profileImageView.snp.makeConstraints { make in
            make.top.equalTo(contentView).inset(20)
            make.centerX.equalTo(contentView)
            make.height.equalTo(contentView.frame.width / 2)
            make.width.equalTo(contentView.frame.width / 2)
        }
        profileImageView.layer.cornerRadius = contentView.frame.width / 4
        
        fullnameLabel.font = UIFont.systemFont(ofSize: contentView.frame.width / 10)
        fullnameLabel.snp.makeConstraints { make in
            make.top.equalTo(profileImageView.snp.bottom).offset(contentView.frame.height / 10)
            make.centerX.equalTo(contentView)
        }
        
        roleLabel.font = UIFont.systemFont(ofSize: fullnameLabel.font.pointSize * 0.8)
        roleLabel.snp.makeConstraints { make in
            make.top.equalTo(fullnameLabel.snp.bottom).offset(contentView.frame.height / 14)
            make.centerX.equalTo(contentView)
        }
    }
    
    func configure(user: User){
        profileImageView.image = UIImage(named: user.imageName)
        fullnameLabel.text = user.fullname
        roleLabel.text = user.roleDetail
    }
    
    private func layoutUI(){
        
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 15
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
}
