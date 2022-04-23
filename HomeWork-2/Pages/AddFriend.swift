//
//  AddFriend.swift
//  HomeWork-2
//
//  Created by Akniyet Turdybay on 21.04.2022.
//

import UIKit
import SnapKit

class AddFriend: UIViewController {
    
    private let contacts: [SectionCellConfigurator] = [
        ContactsCellConfigurator(item: Contact(imageName: "book", contactLabel: "From contacts".localized())),
        ContactsCellConfigurator(item: Contact(imageName: "signature", contactLabel: "By username".localized())),
        ContactsCellConfigurator(item: Contact(imageName: "phone.connection", contactLabel: "By phone number".localized()))
    ]

    
    private let items: [SectionCellConfigurator] = [
        AccountCellConfigurator(item: Account(imageName: "image_1", fullname: "Yulya", friendsCount: 18)),
        AccountCellConfigurator(item: Account(imageName: "image_1", fullname: "Yulya", friendsCount: 18)),
        AccountCellConfigurator(item: Account(imageName: "image_1", fullname: "Yulya", friendsCount: 18)),
        AccountCellConfigurator(item: Account(imageName: "image_1", fullname: "Yulya", friendsCount: 18)),
        AccountCellConfigurator(item: Account(imageName: "image_1", fullname: "Yulya", friendsCount: 18))
    ]
    
    private lazy var tableDirector: TableDirector = {
        let tableDirector = TableDirector(tableView: tableView, items: items)
        return tableDirector
    }()
    
    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.separatorStyle = .none
        table.backgroundColor = .white
        return table
    }()
    
    private var sections: [Section] = []

    override func viewDidLoad() {
        navigationController?.navigationBar.isTranslucent = true
        navigationItem.title = "Add Friend".localized()
        tableView.sectionHeaderHeight =  40
        configTableView()
        cellActionHandlers()
        configureSections()
        tableView.delegate = self
        tableView.dataSource = self
        tableDirector.tableView.reloadData()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.backgroundColor = .white
    }
    private func configTableView(){
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
    }
    
    private func configureSections(){
        sections.append(Section(sectionTitle: "Add New Contacts".localized(), sectionItems: contacts))
        sections.append(Section(sectionTitle: "You Might Know Them".localized(), sectionItems: items))
    }
    
    private func cellActionHandlers() {
        self.tableDirector.actionProxy
//            .on(action: .didSelect) { (config: AccountCellConfigurator, cell) in
//
//            }
//            .on(action: .willDisplay) { (config: ImageViewCellConfigurator, cell) in
//                cell.backgroundColor = .gray
//            }
        .on(action: .custom(AccountCell.didTapButtonAction)){ (config: AccountCellConfigurator, cell) in
            
            cell.addButtonPressed()
            
            print("button did tap")

            }
//        .on(action: .custom(UserCell.didTapFollowButtonAction)){ (config: UserCellConfigurator, cell) in
//                print("follow button did tap")
//            }
        }
    

}
extension AddFriend: UITableViewDelegate{
    
}
extension AddFriend: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sections[section].sectionItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = sections[indexPath.section].sectionItems[indexPath.row]
        tableView.register(type(of: item).cellClass, forCellReuseIdentifier: type(of: item).reuseId)
        let cell = tableView.dequeueReusableCell(withIdentifier: type(of: item).reuseId, for: indexPath)
        item.configureCell(cell: cell)
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        sections.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        

        let sectionTitle = UIView()
        sectionTitle.backgroundColor = .white

        let sectionLabel = UILabel(frame: CGRect(x: 10, y: 5, width:
            tableView.bounds.size.width, height: tableView.bounds.size.height))
        switch section {
        case 0:
            sectionLabel.text = "Add New Contacts".localized()
        case 1:
            sectionLabel.text =  "You Might Know Them".localized()
        default: break
        }
        sectionLabel.font = .boldSystemFont(ofSize: 25)
        sectionLabel.textColor = UIColor.black
        sectionLabel.sizeToFit()
        sectionTitle.addSubview(sectionLabel)

        return sectionTitle

    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
            case 0: return view.frame.height / 15
            case 1: return view.frame.height / 10
            default: return 0
        }
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}

