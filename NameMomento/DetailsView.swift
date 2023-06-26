//
//  DetailsView.swift
//  NameMomento
//
//  Created by Rishav Gupta on 26/06/23.
//

import SwiftUI

struct DetailsView: View {
    var user: User
    
    var body: some View {
        VStack {
            Image(uiImage: user.getImage)
                .resizable()
                .scaledToFit()
                .frame(width: 400, height: 400)
            
            HStack {
                Spacer()
                Text(user.name)
                    .bold()
                    .font(.title)
                Spacer()
            }
            .padding()
        }
        .navigationTitle("User Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(user: User())
    }
}
