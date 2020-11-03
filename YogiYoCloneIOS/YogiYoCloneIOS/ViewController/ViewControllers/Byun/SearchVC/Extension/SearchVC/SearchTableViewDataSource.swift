//
//  searchTableViewDataSource.swift
//  YogiYoCloneIOS
//
//  Created by Qussk_MAC on 2020/10/21.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

extension SearchVC : UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    data?.results?.count ?? 0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell")! as UITableViewCell
    if searchfield.text != "" {
    cell.textLabel?.text = data?.results?[indexPath.row].name
    } else {
      tableview.reloadData()
    }
    return cell

  }
}



