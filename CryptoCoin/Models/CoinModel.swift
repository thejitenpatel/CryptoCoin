//
//  CoinModel.swift
//  CryptoCoin
//
//  Created by Jiten Patel on 28/01/23.
//

import Foundation

// CoingGecko API info
/*
 
 URL: https://api.coingecko.com/api/v3/coins/markets?vs_currency=inr&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h
 
 JSON Response:
 {
 "id": "bitcoin",
 "symbol": "btc",
 "name": "Bitcoin",
 "image": "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579",
 "current_price": 1880941,
 "market_cap": 36271174868718,
 "market_cap_rank": 1,
 "fully_diluted_valuation": 39517606456417,
 "total_volume": 2644106905303,
 "high_24h": 1908937,
 "low_24h": 1863968,
 "price_change_24h": 2762.03,
 "price_change_percentage_24h": 0.14706,
 "market_cap_change_24h": 81151428305,
 "market_cap_change_percentage_24h": 0.22424,
 "circulating_supply": 19274818,
 "total_supply": 21000000,
 "max_supply": 21000000,
 "ath": 5128383,
 "ath_change_percentage": -63.30712,
 "ath_date": "2021-11-10T14:24:11.849Z",
 "atl": 3993.42,
 "atl_change_percentage": 47021.30198,
 "atl_date": "2013-07-05T00:00:00.000Z",
 "roi": null,
 "last_updated": "2023-01-28T06:05:59.827Z",
 "sparkline_in_7d": {
 "price": [
 22615.674556712373,
 22660.11660938527,
 ]
 },
 "price_change_percentage_24h_in_currency": 0.14705913653517413
 },
 }
 
 */

// MARK: - Welcome
struct CoinModel: Identifiable, Codable {
    let id, symbol, name: String
    let image: String
    let currentPrice: Double
    let marketCap, marketCapRank, fullyDilutedValuation: Double?
    let totalVolume, high24H, low24H: Double?
    let priceChange24H, priceChangePercentage24H: Double?
    let marketCapChange24H: Double?
    let marketCapChangePercentage24H: Double?
    let circulatingSupply, totalSupply, maxSupply, ath: Double?
    let athChangePercentage: Double?
    let athDate: String?
    let atl, atlChangePercentage: Double?
    let atlDate: String?
    let lastUpdated: String?
    let sparklineIn7D: SparklineIn7D?
    let priceChangePercentage24HInCurrency: Double?
    let currentHoldings: Double?
    
    enum CodingKeys: String, CodingKey {
        case id, symbol, name, image
        case currentPrice = "current_price"
        case marketCap = "market_cap"
        case marketCapRank = "market_cap_rank"
        case fullyDilutedValuation = "fully_diluted_valuation"
        case totalVolume = "total_volume"
        case high24H = "high_24h"
        case low24H = "low24H"
        case priceChange24H = "price_change_24h"
        case priceChangePercentage24H = "price_change_percentage_24h"
        case marketCapChange24H = "market_cap_change_24h"
        case marketCapChangePercentage24H = "market_cap_change_percentage_24h"
        case circulatingSupply = "circulating_supply"
        case totalSupply = "total_supply"
        case maxSupply = "max_supply"
        case ath
        case athChangePercentage = "ath_change_percentage"
        case athDate = "ath_date"
        case atl
        case atlChangePercentage = "atl_change_percentage"
        case atlDate = "atl_date"
        case lastUpdated = "last_updated"
        case sparklineIn7D = "sparkline_in_7d "
        case priceChangePercentage24HInCurrency = "price_change_percentage_24h_in_currency"
        case currentHoldings
        
    }
    
    func updatedHoldings(amount: Double) -> CoinModel{
        return CoinModel(id: id, symbol: symbol, name: name, image: image, currentPrice: currentPrice, marketCap: marketCap,            marketCapRank: marketCapRank, fullyDilutedValuation: fullyDilutedValuation, totalVolume: totalVolume, high24H: high24H, low24H: low24H, priceChange24H: priceChange24H, priceChangePercentage24H: priceChangePercentage24H, marketCapChange24H: marketCapChange24H, marketCapChangePercentage24H: marketCapChangePercentage24H, circulatingSupply: circulatingSupply, totalSupply: totalSupply, maxSupply: maxSupply, ath: ath, athChangePercentage: athChangePercentage, athDate: athDate, atl: ath, atlChangePercentage: atlChangePercentage, atlDate: atlDate, lastUpdated: lastUpdated, sparklineIn7D: sparklineIn7D, priceChangePercentage24HInCurrency: priceChangePercentage24HInCurrency, currentHoldings: amount)
    }
    
    var currentHoldingsValue: Double{
        return (currentHoldings ?? 0) * currentPrice
    }
    
    
    var rank: Int{
        return Int(marketCapRank ?? 0)
    }
    
}


struct SparklineIn7D: Codable{
    let price: [Double]?
}
