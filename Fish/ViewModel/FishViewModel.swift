//
//  FishViewModel.swift
//  Fish
//
//  Created by Arnold Sylvestre on 8/9/22.
//

import UIKit

@objcMembers
class FishViewModel: NSObject {
    
    private let networkManager: NetworkManager
    private var DigimonInfos: [FishModel] = [] {
        didSet {
            self.updateHandler?()
        }
    }
    
    
    private var updateHandler: (() -> Void)?
    
    @objc
    init(networkManager: NetworkManager = NetworkManager.sharedInstance()) {
        self.networkManager = networkManager
    }
    
    @objc
    func bind(updateHandler: @escaping () -> Void) {
        self.updateHandler = updateHandler
    }
    
    @objc
    func fetchDigimon() {
        
        
        
        self.networkManager.fetchDigimonInfo { [weak self] DigimonInfo in
            
            guard let DigimonInfos = DigimonInfo as? [FishModel] else { return }
            self?.DigimonInfos.append(contentsOf: DigimonInfos)
        }
    }
    
    var count: Int {
        return self.DigimonInfos.count
    }
    
    func title(for index: Int) -> String? {
        guard index < self.DigimonInfos.count else { return nil }
        return self.DigimonInfos[index].name
    }
    
    func Level(for index: Int) -> String? {
        guard index < self.DigimonInfos.count else { return nil }
        return self.DigimonInfos[index].level
    }

    
    func image(for index: Int, completion: @escaping (UIImage?) -> Void) {
        guard index < self.DigimonInfos.count else {
            completion(nil)
            return
        }

        self.networkManager.fetchImage(with: self.DigimonInfos[index].img) { (image: UIImage?) in
            completion(image)
        }
    }
    
    func example() -> (Int, String) {
        return (5, "Hello")
    }
    
}

extension FishViewModel {
    
    @objc
    func exampleToObjc() -> TupleSubstitute {
        let tuple = self.example()
        return TupleSubstitute(num: tuple.0, str: tuple.1)
    }
    
}

class TupleSubstitute: NSObject {
    
    let number: Int
    let str: String
    
    init(num: Int, str: String) {
        self.number = num
        self.str = str
    }
    
}

extension NetworkManager {
    
    @objc
    func doSomething() {
        
    }
    
}


