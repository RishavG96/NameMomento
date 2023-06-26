//
//  AddUser.swift
//  NameMomento
//
//  Created by Rishav Gupta on 26/06/23.
//

import SwiftUI

struct AddUser: View {
    @ObservedObject var userObject: UserObject
    @Environment(\.dismiss) var dismiss
    
    @State private var image: Image?
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    
    @State private var name: String = ""
    
    let savePath = FileManager.documentsDirectory.appendingPathComponent("SavedPersons")
    
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    Rectangle()
                        .fill(.secondary)
                        .frame(width: 500, height: 500)
                    
                    Text("Tap to select a picture")
                        .foregroundColor(.white)
                        .font(.headline)
                    
                    image?
                        .resizable()
                        .scaledToFit()
                }
                .onTapGesture {
                    showingImagePicker = true
                }
                
                Spacer()
                
                TextField("Write his name here...", text: $name)
                    .disabled(inputImage == nil ? true : false)
                
                Spacer()
                
                Button("Save", action: save)
                    .disabled((inputImage == nil || name == "") ? true : false)
            }
            .padding([.horizontal, .bottom])
            .navigationTitle("Add User Info")
            .onChange(of: inputImage) { _ in loadImage() }
            .sheet(isPresented: $showingImagePicker) {
                ImagePicker(image: $inputImage)
            }
        }
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
    }
    
    func save() {
        guard let inputImage = inputImage else { return }
        if let jpegData = inputImage.jpegData(compressionQuality: 0.8) {
            let createdUser = User(name: name, image: jpegData)
            userObject.users.append(createdUser)
        }
        
        do {
            let data = try JSONEncoder().encode(userObject.users)
            try data.write(to: savePath, options: [.atomic, .completeFileProtection])
        } catch {
            print("Unable to save data")
        }
        
        dismiss()
    }
}

struct AddUser_Previews: PreviewProvider {
    static var previews: some View {
        AddUser(userObject: UserObject())
    }
}
