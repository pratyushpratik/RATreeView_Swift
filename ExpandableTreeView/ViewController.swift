//
//  ViewController.swift
//  ExpandableTreeView
//
//  Created by Pratyush Pratik on 14/06/17.
//  Copyright © 2017 Pratyush Pratik. All rights reserved.
//

import UIKit
import RATreeView
import Foundation

enum Level {

    case Level1
    case Level2
    case Level3
}

struct DataObject {
    var name: String?
    var children: [DataObject]?
    
    init (name: String?) {
        self.name = name ?? ""
    }
    
    init(name: String?, children: [DataObject]?) {
        self.name = name ?? ""
        self.children = children ?? []
    }
}

class ViewController: UIViewController, RATreeViewDataSource, RATreeViewDelegate{
    
    private var treeTableView: RATreeView!
    private let xibName = "TableViewCell"
    var data = [DataObject]()
    
    
    convenience init() {
        self.init(nibName : nil, bundle: nil)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        data = ViewController.commonInit()
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        data = ViewController.commonInit()
        super.init(coder: aDecoder)
    }
    
    override dynamic func viewDidLoad() {
        treeTableView = RATreeView(frame: self.view.bounds)
        treeTableView.delegate = self
        treeTableView.dataSource = self
        
        treeTableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(treeTableView)
        treeTableView.reloadData()
        
        treeTableView.register( UINib(nibName: xibName, bundle: nil), forCellReuseIdentifier: xibName)
    }
    
    func treeView(_ treeView: RATreeView, numberOfChildrenOfItem item: Any?) -> Int {
        
//        switch item {
//        case :
//            <#code#>
//        default:
//            <#code#>
//        }
        if let item = item as? DataObject {
            return item.children?.count ?? 0
        } else {
            return self.data.count
        }
//        return 2
    }
    
    func treeView(_ treeView: RATreeView, cellForItem item: Any?) -> UITableViewCell {
        
        
//        cell?.lbl.text = "hey"
        
        guard let cell = treeView.dequeueReusableCell(withIdentifier: xibName) as? TableViewCell, let item = item as? DataObject else { return UITableViewCell() }
        
        let level = treeView.levelForCell(forItem: item)
        let detailsText = "Number of children \(item.children?.count ?? 0)"
        cell.selectionStyle = .none
        cell.setup(withTitle: item.name ?? "", level: level, additionalButtonHidden: false)
        
        return cell
    }
    
    func treeView(_ treeView: RATreeView, child index: Int, ofItem item: Any?) -> Any {
        if let item = item as? DataObject {
            return item.children?[index] ?? ""
        } else {
            return data[index] as AnyObject
        }
    }
    
    func treeView(_ treeView: RATreeView, heightForRowForItem item: Any) -> CGFloat {
        return 80
    }
}


extension ViewController {
    
    static func commonInit() -> [DataObject] {
        
        let phone1 = DataObject(name: "Phone 1")
        let phone2 = DataObject(name: "Phone 2")
        let phone3 = DataObject(name: "Phone 3")
        let phone4 = DataObject(name: "Phone 4")
        let phones = DataObject(name: "Phones", children: [phone1, phone2, phone3, phone4])
        
        let notebook1 = DataObject(name: "Notebook 1")
        let notebook2 = DataObject(name: "Notebook 2")
        
        let notebook = DataObject(name: "Notebook", children: [notebook1, notebook2])
        
        let computer2 = DataObject(name: "Computer 2")
        let computer3 = DataObject(name: "Computer 3")
        let computers = DataObject(name: "Computers", children: [computer2, computer3])
        let object = DataObject(name: "objects", children: [notebook, computers])
        
        
        let cars = DataObject(name: "Cars")
//        let bikes = DataObject(name: "Bikes")
//        let houses = DataObject(name: "Houses")
//        let flats = DataObject(name: "Flats")
//        let motorbikes = DataObject(name: "motorbikes")
//        let drinks = DataObject(name: "Drinks")
//        let food = DataObject(name: "Food")
//        let sweets = DataObject(name: "Sweets")
//        let watches = DataObject(name: "Watches")
//        let walls = DataObject(name: "Walls")
        
        return [phones, object, cars]
    }
    
}
