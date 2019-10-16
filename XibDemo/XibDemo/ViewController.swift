//
//  ViewController.swift
//  XibDemo
//
//  Created by AnhTT on 10/15/19.
//  Copyright © 2019 AnhTT. All rights reserved.
//

import UIKit

enum IndexSelected: String {
    case chi_tiet
    case thiet_bi
    case diem_xung_yeu
    case custom
    
    func selected() -> String {
        return self.rawValue
    }
}

struct MainTaining {
    var name: String
    var address: String
    var employee: String
    var startDay: String
    var endDay: String
    var status: String
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    
    var indexSelected: IndexSelected = .chi_tiet
    var displayCount: Int = 0
    
    var testVC = TestVC()
    
    var main = [
        MainTaining(name: "Cuong", address: "Thanh Hoa", employee: "Dev", startDay: "06", endDay: "12", status: "Done"),
        MainTaining(name: "Luyen", address: "Thai Binh", employee: "Dev", startDay: "06", endDay: "12", status: "Done"),
        MainTaining(name: "Huy", address: "Thanh Hoa", employee: "Dev", startDay: "06", endDay: "12", status: "Done"),
    ]
    
    var numbers = [Int](1...10)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexSelected {
        case .chi_tiet:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ChiTietTableViewCell") as! ChiTietTableViewCell
            cell.titleLabel.text = "Day la chi tiet"
            return cell
        case .thiet_bi:
            let cell = tableView.dequeueReusableCell(withIdentifier: "MasterTableViewCell") as! MasterTableViewCell
            cell.labelAddress.text = main[indexPath.row].address
            cell.labelEmployeeName.text = main[indexPath.row].employee
            cell.labelEnd.text = main[indexPath.row].endDay
            cell.labelName.text = main[indexPath.row].name
            cell.labelStart.text = main[indexPath.row].startDay
            cell.labelStatus.text = main[indexPath.row].status
            return cell
        case .diem_xung_yeu:
            let cell = tableView.dequeueReusableCell(withIdentifier: "DXYTableViewCell") as! DXYTableViewCell
            cell.numberLabel.text = "\(numbers[indexPath.row])"
            return cell
        case .custom:
            let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell") as? CustomTableViewCell
            return cell!
        }

    }
    
    @IBAction func chiTiet(_ sender: Any) {
        indexSelected = .chi_tiet
        displayCount = 1
        let id = UINib(nibName: "ChiTietTableViewCell", bundle: nil)
        tableView.register(id, forCellReuseIdentifier: "ChiTietTableViewCell")
        tableView.reloadData()
    }
    
    @IBAction func thietBi(_ sender: Any) {
        indexSelected = .thiet_bi
        displayCount = main.count
        let id = UINib(nibName: "MasterTableViewCell", bundle: nil)
        tableView.register(id, forCellReuseIdentifier: "MasterTableViewCell")
        tableView.reloadData()
    }
    
    @IBAction func diemXungYeu(_ sender: Any) {
        indexSelected = .diem_xung_yeu
        displayCount = numbers.count
        let id = UINib(nibName: "DXYTableViewCell", bundle: nil)
        tableView.register(id, forCellReuseIdentifier: "DXYTableViewCell")
        tableView.reloadData()
    }
    
    @IBAction func insertAction(_ sender: Any) {
        indexSelected = .custom
        displayCount = 1
        let textFeildCell = UINib(nibName: "CustomTableViewCell", bundle: nil)
        self.tableView.register(textFeildCell, forCellReuseIdentifier: "CustomTableViewCell")
        tableView.reloadData()
    }
    
    
    
    @IBAction func indexChanged(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            indexSelected = .chi_tiet
            displayCount = 1
            let id = UINib(nibName: "ChiTietTableViewCell", bundle: nil)
            tableView.register(id, forCellReuseIdentifier: "ChiTietTableViewCell")
            tableView.reloadData()
        case 1:
            indexSelected = .thiet_bi
            displayCount = main.count
            let id = UINib(nibName: "MasterTableViewCell", bundle: nil)
            tableView.register(id, forCellReuseIdentifier: "MasterTableViewCell")
            tableView.reloadData()
        case 2:
            indexSelected = .diem_xung_yeu
            displayCount = numbers.count
            let id = UINib(nibName: "DXYTableViewCell", bundle: nil)
            tableView.register(id, forCellReuseIdentifier: "DXYTableViewCell")
            tableView.reloadData()
        case 3:
            indexSelected = .custom
            displayCount = 1
            let textFeildCell = UINib(nibName: "CustomTableViewCell", bundle: nil)
            self.tableView.register(textFeildCell, forCellReuseIdentifier: "CustomTableViewCell")
            tableView.reloadData()
        default:
            break
        }

    }
    
    
    @IBAction func nextTest(_ sender: Any) {
//        let id = UINib(nibName: "TestVC", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! TestVC
        testVC = TestVC(nibName: "TestVC", bundle: nil)
    }
}

