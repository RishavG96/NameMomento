//
//  DetailsView.swift
//  NameMomento
//
//  Created by Rishav Gupta on 26/06/23.
//

import SwiftUI
import MapKit

struct DetailsView: View {
    @ObservedObject var userObject: UserObject
    var user: User
    
    @State var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 34.0522, longitude: -118.2437), span: MKCoordinateSpan(latitudeDelta: 25, longitudeDelta: 25))
    
    var body: some View {
        VStack {
            Image(uiImage: user.getImage)
                .resizable()
                .scaledToFit()
                .clipShape(Capsule())
                .frame(width: 300, height: 300)
            
            HStack {
                Spacer()
                Text(user.name)
                    .bold()
                    .font(.title)
                Spacer()
            }
                
            
            Map(coordinateRegion: $mapRegion, annotationItems: userObject.users) { userObject in
                MapAnnotation(coordinate: userObject.coordinate) {
                    VStack {
                        if user == userObject {
                            Image(systemName: "star.circle")
                                .resizable()
                                .foregroundColor(.red)
                                .frame(width: 44, height: 44)
                                .background(.white)
                            .clipShape(Circle())
                        } else {
                            Image(systemName: "")
                        }
                        
                        
                        Text(user == userObject ? userObject.name : "")
                            .fixedSize()
                    }
                }
            }
            .padding()
            
            
        }
        .navigationTitle("User Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(userObject: UserObject(), user: User())
    }
}
