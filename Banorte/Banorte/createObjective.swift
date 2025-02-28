//
//  createObjective.swift
//  Banorte
//
//  Created by Alumno on 18/02/25.
//

import SwiftUI

struct createObjective: View {
    var body: some View {
        ZStack (alignment: .leading){
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .frame(width: 200, height: 10)
            .foregroundColor(Color.black.opacity(0.1))
            
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .frame(width: 100, height: 10)
                .foregroundColor(Color.red)
        }
        
        
        
    }
}

#Preview {
    createObjective()
}
