//
//  CommonTableViewVC.swift
//  SwiftProject-Demo
//
//  Created by 马成 on 2020/7/16.
//  Copyright © 2020 马成. All rights reserved.
//

import UIKit

class CommonTableViewVC: UITableViewController {
    var titleItems:[String]?
    var vcItems:[String]?
    let TODO_CONTENT_CELL_ID = "TodoContentCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.titleItems?.count ?? 1
    }
    
    //cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: TODO_CONTENT_CELL_ID)
        if(cell == nil){
            cell = UITableViewCell.init(style: .default, reuseIdentifier: TODO_CONTENT_CELL_ID);
            }
        cell?.selectionStyle = .none
        cell?.textLabel?.text = self.titleItems?[indexPath.row]
        return cell!
    }
    //点击
   override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           var pushVc : UIViewController?

          if let vc = PushTool.getVc(pushVcNameStr: (vcItems?[indexPath.row])!) as? ViewController{
              vc.title = titleItems![indexPath.row]
               pushVc = vc
           }

        if let vc = pushVc{
           self.navigationController?.pushViewController(vc, animated: true)
        }else{
           //这里不需要指定控制器。设置VC的属性的。
            PushTool.pushVcByVcNameAndTitle(pushVcNameStr: (vcItems?[indexPath.row])!, pushVcTitleStr: titleItems?[indexPath.row], weakVc: self)
       }

    }
    //松开效果
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
