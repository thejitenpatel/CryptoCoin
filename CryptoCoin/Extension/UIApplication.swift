//
//  UIApplication.swift
//  CryptoCoin
//
//  Created by Jiten Patel on 05/02/23.
//

import Foundation
import SwiftUI

extension UIApplication{
    
    func endEditing(){
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
