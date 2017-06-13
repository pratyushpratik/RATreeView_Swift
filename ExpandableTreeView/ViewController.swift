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

class ViewController: UIViewController, RATreeViewDataSource, RATreeViewDelegate{
    private var treeView: RATreeView!
    private let xibName = "TableViewCell"
    
    override dynamic func viewDidLoad() {
        treeView = RATreeView(frame: self.view.bounds)
        treeView.delegate = self
        treeView.dataSource = self
        
        treeView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(treeView)
        treeView.reloadData()
        
        treeView.register( UINib(nibName: xibName, bundle: nil), forCellReuseIdentifier: xibName)
    }
    
    func treeView(_ treeView: RATreeView, numberOfChildrenOfItem item: Any?) -> Int {
        
//        switch item {
//        case :
//            <#code#>
//        default:
//            <#code#>
//        }
        return 3
    }
    
    func treeView(_ treeView: RATreeView, cellForItem item: Any?) -> UITableViewCell {
        let cell = treeView.dequeueReusableCell(withIdentifier: xibName) as? TableViewCell
        
        cell?.lbl.text = "hey"
        return cell!
    }
    
    func treeView(_ treeView: RATreeView, child index: Int, ofItem item: Any?) -> Any {
        return index
    }
    
    func treeView(_ treeView: RATreeView, indentationLevelForRowForItem item: Any) -> Int {
       return 2
    }
    
    func treeView(_ treeView: RATreeView, heightForRowForItem item: Any) -> CGFloat {
        return 80
    }
}
