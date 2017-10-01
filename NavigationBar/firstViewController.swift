
//
//  firstViewController.swift
//  NavigationBar
//
//  Created by Farben on 2017/9/28.
//  Copyright © 2017年 Farben. All rights reserved.
//

import UIKit

class firstViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    var bar : XYTNavigationBar?
    var tableView:UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView=UITableView()
        self.tableView?.frame=CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height:  UIScreen.main.bounds.size.height)
        self.tableView?.delegate=self
        self.tableView?.dataSource=self
        self.view .addSubview(self.tableView!)
        
         self.bar = XYTNavigationBar.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 64))
        
        //给block赋值
         self.bar?.clickLeftItemBlock={
            self.navigationController?.popViewController(animated: true)
        }
         self.bar?.clickRightItemBlock={
            self.navigationController?.pushViewController(SecondViewController(), animated: true)
        }
        self.bar?.title="自定义导航栏"
        
        self.view .addSubview( self.bar!)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.navigationBar.isHidden=true
        self.bar?.showCustomNavigationBar(show: true)

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden=false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

     func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 30
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell:UITableViewCell? =  tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier")

        if cell == nil {
            cell = UITableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: "reuseIdentifier")
        }
        // Configure the cell...
        cell?.textLabel?.text = "这是第\(indexPath.row)行"

        return cell!
    }
    
     func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY:CGFloat = scrollView.contentOffset.y
        var colorOffset:CGFloat = offsetY/64.0
        colorOffset = (colorOffset > 1) ? 1 : colorOffset
        self.bar?.setupBgImageAlpha(alpha: colorOffset, duration: 0.4, compeleteBlock: {
            NSLog("颜色改变")
        })
    }
 
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
