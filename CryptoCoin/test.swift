//
//  test.swift
//  CryptoCoin
//
//  Created by Jiten Patel on 29/01/23.
//

import SwiftUI

struct test: View {
    var body: some View {
        VStack{
            
            Text("Accent Color")
                .foregroundColor(Color.theme.accent)
            
            Text("Background Color")
                .foregroundColor(Color.theme.background)
            
            Text("Secondary Text Color")
                .foregroundColor(Color.theme.secondaryText)
            
            Text("Red Color")
                .foregroundColor(Color.theme.red)
            
            Text("Green Color")
                .foregroundColor(Color.theme.green)
        }
        
    }
}

struct test_Previews: PreviewProvider {
    static var previews: some View {
        test()
            .preferredColorScheme(.dark)
    }
}
