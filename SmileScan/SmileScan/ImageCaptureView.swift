import SwiftUI

struct ImageCaptureView: View {
    @State private var image: UIImage? = nil
    @State private var showImagePicker = false
    @State private var sourceType: UIImagePickerController.SourceType = .camera

    var body: some View {
        VStack {
            Text("Capture or Select Image")
                .font(.title2)
                .padding()

            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 300)
                    .padding()
            } else {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(height: 300)
                    .overlay(Text("No Image Selected").foregroundColor(.gray))
                    .padding()
            }

            HStack {
                Button(action: {
                    if UIImagePickerController.isSourceTypeAvailable(.camera) {
                        sourceType = .camera
                        showImagePicker = true
                    } else {
                        print("Camera not available.")
                    }
                }) {
                    Text("Take Photo")
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }

                Button(action: {
                    sourceType = .photoLibrary
                    showImagePicker = true
                }) {
                    Text("Choose Photo")
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding()
            .sheet(isPresented: $showImagePicker) {
                CameraOrLibraryPicker(image: $image, sourceType: sourceType)
            }
        }
        .padding()
    }
}

struct ImageCaptureView_Previews: PreviewProvider {
    static var previews: some View {
        ImageCaptureView()
    }
}
