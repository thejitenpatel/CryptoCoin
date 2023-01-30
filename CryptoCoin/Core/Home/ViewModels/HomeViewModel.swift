//
//  HomeViewModel.swift
//  CryptoCoin
//
//  Created by Jiten Patel on 28/01/23.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject{
    
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel]  = []
    
    private let dataService = CoinDataService()
    private var cancellables = Set<AnyCancellable>()
    
    init(){
       addSubscriber()
    }
    
    
    func addSubscriber() {
        dataService.$allCoins
            .sink{ [weak self] retunedCoins in
                self?.allCoins = retunedCoins
            }
            .store(in: &cancellables)
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
//            self.allCoins.append(DeveloperPreview.instance.coin)
//            self.portfolioCoins.append(DeveloperPreview.instance.coin)
//        }
    }
}
