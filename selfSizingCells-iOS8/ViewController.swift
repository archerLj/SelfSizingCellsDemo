//
//  ViewController.swift
//  selfSizingCells-iOS8
//
//  Created by archerLj on 16/4/6.
//  Copyright © 2016年 archerLj. All rights reserved.
//

import UIKit

let cellReuseID = "lfTableViewCellID"

let nameArr: Array<String> = ["aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "bbbbbbbbbbbbbbbbbbbb","cccccccccccccccccccccccccc"]
let addressArr: Array<String> = ["iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii", "ppppppppppppppppppppppppppppppppppp", "wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww"]
class ViewController: UIViewController {

    
    @IBOutlet weak var mainTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainTableView.delegate = self
        mainTableView.dataSource = self
        
        mainTableView.estimatedRowHeight = 50.0
        mainTableView.rowHeight = UITableViewAutomaticDimension
        
    }
    
    // 有时候视图第一次展示的时候有的cell大小不正确，滚动之后就可以了，为了避免这种情况，添加下面代码强制reload一下就可以了。
    override func viewDidAppear(animated: Bool) {
        mainTableView.reloadData()
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameArr.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellReuseID, forIndexPath: indexPath) as! LFTableViewCell
        cell.name.text = nameArr[indexPath.row]
        cell.address.text = addressArr[indexPath.row]
        return cell
    }
}