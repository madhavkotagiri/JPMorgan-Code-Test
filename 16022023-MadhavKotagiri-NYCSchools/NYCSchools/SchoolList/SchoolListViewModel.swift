//
//  SchoolListViewModel.swift
//  NYCSchools
//
//  Created by Madhav Kotagiri on 16/02/23.
//

import Foundation
import Combine

class SchoolListViewModel:ObservableObject {
    
    @Published var schoolList:[SchoolListModel]?
    var apiDependency: NetworkService?
    var disposable = Set<AnyCancellable>()
    var indicator = PassthroughSubject<Bool,Never>()
    
    init(manager:NetworkService = APIManager()) {
        self.apiDependency = manager
    }
    
    func getSchoolList(){
        var request = DataRequest(route: .menuList)
        request.queryItems = [:]
        indicator.send(true)
        
        self.apiDependency?.requestData(request: request, type: [SchoolListModel].self).sink { completion in
            self.indicator.send(false)
            switch completion {
            case .failure:
                break
            case .finished:
                
                break
            }
        } receiveValue: { result in
            self.indicator.send(false)
            self.schoolList = result
            
            print("School List")
        }
        .store(in: &self.disposable)
        
    }
    
}
