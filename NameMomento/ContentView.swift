//
//  ContentView.swift
//  NameMomento
//
//  Created by Rishav Gupta on 26/06/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var userObject = UserObject()
    
    @State private var addPerson = false
    
    var body: some View {
        NavigationView {
            VStack {
                if userObject.users.count == 0 {
                    Spacer()
                    Text("No Users to Show")
                    Spacer()
                } else {
                    List(userObject.users.sorted()) { user in
                        NavigationLink {
                            DetailsView(userObject: userObject, user: user)
                        } label: {
                            HStack {
                                Image(uiImage: user.getImage)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 50)
                                
                                Text(user.name)
                            }
                        }
                    }
                }
                
                Button("Add Person") {
                    addPerson = true
                }
                .padding(.top)
            }
            .navigationTitle("Name Momento")
            .sheet(isPresented: $addPerson) {
                AddUser(userObject: userObject)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
