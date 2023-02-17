//
//  ViewController.swift
//  NYCSchools
//
//  Created by Madhav Kotagiri on 16/02/23.
//

import UIKit
import Combine
import MaterialActivityIndicator

class ViewController: UIViewController {
   
    @IBOutlet weak var listTableView: UITableView!
    var disposable = Set<AnyCancellable>()
    var viewModel:SchoolListViewModel?

    let indicator = MaterialActivityIndicatorView()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = SchoolListViewModel()
        setupActivityIndicatorView()
        setupIndicatorVisibility()
        listTableView.estimatedRowHeight = 50
        listTableView.rowHeight = UITableView.automaticDimension
        viewModel?.getSchoolList()
        
        viewModel?.$schoolList.sink(receiveValue: { [weak self] res in
            DispatchQueue.main.async {
                self?.listTableView.reloadData()
            }
            
        }).store(in: &self.disposable)
        self.title = "NYS Schools "
    }
    
    func setupIndicatorVisibility() {
        viewModel?.indicator
            .sink(receiveValue: { res in
          
            if res {
                self.indicator.startAnimating()
            }else{
                self.indicator.stopAnimating()
            }
        }).store(in: &self.disposable)
        
    }


}
extension ViewController:UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
    return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.schoolList?.count ?? 0
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SchoolListCell", for: indexPath) as! SchoolListCell
        if let model = self.viewModel?.schoolList?[indexPath.row]{
            cell.configCell(model: model)
        }
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = mainStoryBoard.instantiateViewController(withIdentifier: "SchoolDetailVC") as! SchoolDetailVC
        vc.detailSchoolObject = self.viewModel?.schoolList?[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
}


private extension ViewController {
    func setupActivityIndicatorView() {
        view.addSubview(indicator)
        setupActivityIndicatorViewConstraints()
    }

    func setupActivityIndicatorViewConstraints() {
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        indicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}
