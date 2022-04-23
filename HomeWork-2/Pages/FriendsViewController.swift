//
//  FriendsViewController.swift
//  HomeWork-2
//
//  Created by Akniyet Turdybay on 20.04.2022.
//

import UIKit
import SnapKit

class FriendsViewController: UIViewController {
    
    private lazy var collectionView : UICollectionView = {
        let collectionLayout = UICollectionViewFlowLayout()
        collectionLayout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionLayout)
        collectionView.backgroundColor = view.backgroundColor
        collectionView.register(ConfigureCell.self, forCellWithReuseIdentifier: ConfigureCell.identifier)
        return collectionView
    }()
    
    
    let items = [User(imageName: "image_1", fullname: "yulya vasilisova", roleDetail: "IOS Developer"),
                 User(imageName: "image_2", fullname: "yulya", roleDetail: "IOS Developer"),
                 User(imageName: "image_3", fullname: "yulya", roleDetail: "IOS Developer"),
                 User(imageName: "image_4", fullname: "yulya", roleDetail: "IOS Developer"),
                 User(imageName: "image_5", fullname: "yulya", roleDetail: "IOS Developer"),
                 User(imageName: "image_6", fullname: "yulya", roleDetail: "IOS Developer"),
                 User(imageName: "image_7", fullname: "yulya", roleDetail: "IOS Developer"),
                 User(imageName: "image_8", fullname: "yulya", roleDetail: "IOS Developer"),
                 User(imageName: "image_9", fullname: "yulya", roleDetail: "IOS Developer"),
                 User(imageName: "image_10", fullname: "yulya", roleDetail: "IOS Developer")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray5
        configUI()
        navBarSetUp()
        collectionViewLayout()
        
    }
    
    @objc func presentedAddFriend(){
        let addFriendVC = AddFriend()
        addFriendVC.modalPresentationStyle = .fullScreen
        self.show(addFriendVC, sender: self)
    }
    
    private func configUI(){
        
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(collectionView)

    }
   
    
    private func navBarSetUp(){
        navigationController?.navigationBar.isTranslucent = true
        navigationItem.title = "My Friends".localized()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .plain, target: self, action: nil)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus.circle"), style: .plain, target: self, action: #selector(presentedAddFriend))
    }
    
    private func collectionViewLayout(){
        collectionView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(10)
            make.trailing.leading.equalToSuperview().inset(15)
            make.bottom.equalToSuperview()

        }
    }
}

extension FriendsViewController: UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ConfigureCell.identifier, for: indexPath) as! ConfigureCell
        cell.configure(user: items[indexPath.item])
        return cell
    }
}

extension FriendsViewController: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
}

extension FriendsViewController: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.size.width / 2 - 20, height: view.frame.size.width / 2 - 15)
    }
}

extension String{
    func localized() -> String{
        return NSLocalizedString(self, tableName: "Localizable", bundle: .main,
                                 value: self, comment: self)
    }
}

