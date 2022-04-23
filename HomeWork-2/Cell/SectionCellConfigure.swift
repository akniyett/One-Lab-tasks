//
//  SectionCellConfigure.swift
//  HomeWork-2
//
//  Created by Akniyet Turdybay on 22.04.2022.
//

import Foundation
import UIKit

protocol SectionCellConfigurator {
    static var reuseId: String { get }
    static var cellClass: AnyClass { get }
    func configureCell(cell: UIView)
}

class TableCellConfigurator<CellType: ConfigurableCell, DataType>: SectionCellConfigurator where CellType.DataType == DataType, CellType: UITableViewCell {
    
    static var reuseId: String { return CellType.reuseIdentifier }
    static var cellClass: AnyClass { return CellType.self }
    
    let item: DataType
    
    init(item: DataType) {
        self.item = item
    }
    
    func configureCell(cell: UIView) {
        (cell as! CellType).configureCell(data: item)
    }
    
}
