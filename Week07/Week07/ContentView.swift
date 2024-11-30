import SwiftUI

struct ContentView: View {
    @State private var isPhotoPickerPresented = false
    @State private var selectedImages: [UIImage] = []
    @State private var captions: [String] = []
    @State private var collageImage: UIImage? = nil

    var body: some View {
        NavigationView {
            VStack {
                // Select Photos Button
                Button(action: {
                    isPhotoPickerPresented = true
                }) {
                    Text("Select Photos")
                        .font(.headline)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()

                // Display Selected Images and Captions
                ScrollView {
                    ForEach(0..<selectedImages.count, id: \.self) { index in
                        VStack {
                            Image(uiImage: selectedImages[index])
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 200)
                                .cornerRadius(10)
                                .padding()

                            TextField("Add a caption...", text: Binding(
                                get: { captions.indices.contains(index) ? captions[index] : "" },
                                set: { newValue in
                                    if captions.indices.contains(index) {
                                        captions[index] = newValue
                                    } else {
                                        captions.append(newValue)
                                    }
                                }
                            ))
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                        }
                    }
                }

                // Generate Collage Button
                if !selectedImages.isEmpty {
                    Button(action: {
                        collageImage = generateCollage(images: selectedImages, captions: captions)
                    }) {
                        Text("Create Collage")
                            .font(.headline)
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding()
                }

                // Display Collage Image
                if let collageImage = collageImage {
                    Image(uiImage: collageImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding()

                    // Save Collage Button
                    Button(action: {
                        saveToPhotoLibrary(image: collageImage)
                    }) {
                        Text("Save to Photo Library")
                            .font(.headline)
                            .padding()
                            .background(Color.orange)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding()
                }
            }
            .navigationTitle("Photo Collage Maker")
            .sheet(isPresented: $isPhotoPickerPresented) {
                PhotoPicker(pickerResult: $selectedImages, isPresented: $isPhotoPickerPresented, limit: 6)
            }
        }
    }

    // Generate a Collage from Selected Images and Captions
    func generateCollage(images: [UIImage], captions: [String]) -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 800, height: 1200))
        return renderer.image { context in
            for (index, image) in images.enumerated() {
                let x = (index % 2 == 0) ? 0 : 400
                let y = (index / 2) * 400
                let rect = CGRect(x: x, y: y, width: 400, height: 400)
                image.draw(in: rect)

                if captions.indices.contains(index) {
                    let caption = captions[index]
                    let attributes: [NSAttributedString.Key: Any] = [
                        .font: UIFont.boldSystemFont(ofSize: 20),
                        .foregroundColor: UIColor.white
                    ]
                    let textRect = CGRect(x: x + 10, y: y + 350, width: 380, height: 50)
                    caption.draw(in: textRect, withAttributes: attributes)
                }
            }
        }
    }

    // Save Collage to Photo Library
    func saveToPhotoLibrary(image: UIImage) {
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
