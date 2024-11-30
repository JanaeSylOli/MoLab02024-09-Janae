import SwiftUI
import PhotosUI
import CoreImage
import CoreImage.CIFilterBuiltins

struct ContentView: View {
    @State private var processedImage: Image?
    @State private var processedUIImage: UIImage? // Store UIImage for saving
    @State private var filterIntensity = 0.5
    @State private var selectedItem: PhotosPickerItem?
    @State private var showingFilterSelection = false

    @State private var currentFilter: CIFilter = CIFilter.sepiaTone()
    private let context = CIContext()

    var body: some View {
        NavigationView {
            VStack {
                Spacer()

                PhotosPicker(selection: $selectedItem) {
                    if let processedImage {
                        processedImage
                            .resizable()
                            .scaledToFit()
                    } else {
                        VStack {
                            Image(systemName: "photo")
                                .font(.system(size: 100))
                                .foregroundColor(.gray)
                            Text("Tap to select a photo")
                                .foregroundColor(.secondary)
                        }
                    }
                }
                .buttonStyle(.plain)
                .onChange(of: selectedItem) { _ in
                    loadImage()
                }

                Spacer()

                VStack {
                    Text("Filter Intensity")
                    Slider(value: $filterIntensity, in: 0...1)
                        .padding()
                        .onChange(of: filterIntensity) { _ in
                            applyProcessing()
                        }
                }

                HStack {
                    Button("Change Filter") {
                        showingFilterSelection = true
                    }
                    .padding()

                    Spacer()

                    if processedUIImage != nil {
                        Button("Save Image") {
                            saveImage()
                        }
                        .padding()
                    }
                }
            }
            .padding()
            .navigationTitle("Photo Filter")
            .confirmationDialog("Choose a Filter", isPresented: $showingFilterSelection) {
                Button("Sepia Tone") { setFilter(CIFilter.sepiaTone()) }
                Button("Gaussian Blur") { setFilter(CIFilter.gaussianBlur()) }
                Button("Pixellate") { setFilter(CIFilter.pixellate()) }
                Button("Vignette") { setFilter(CIFilter.vignette()) }
                Button("Cancel", role: .cancel) { }
            }
        }
    }

    // Load image from PhotosPicker
    func loadImage() {
        Task {
            guard let imageData = try? await selectedItem?.loadTransferable(type: Data.self),
                  let uiImage = UIImage(data: imageData),
                  let ciImage = CIImage(image: uiImage) else { return }

            currentFilter.setValue(ciImage, forKey: kCIInputImageKey)
            processedUIImage = uiImage // Save the original UIImage for reference
            applyProcessing()
        }
    }

    // Apply CoreImage filters
    func applyProcessing() {
        guard let inputImage = currentFilter.value(forKey: kCIInputImageKey) as? CIImage else { return }

        if currentFilter.inputKeys.contains(kCIInputIntensityKey) {
            currentFilter.setValue(filterIntensity, forKey: kCIInputIntensityKey)
        }

        if let outputImage = currentFilter.outputImage,
           let cgImage = context.createCGImage(outputImage, from: outputImage.extent) {
            let uiImage = UIImage(cgImage: cgImage)
            processedImage = Image(uiImage: uiImage) // Update SwiftUI Image for display
            processedUIImage = uiImage // Save UIImage for saving
        }
    }

    // Set the selected filter
    func setFilter(_ filter: CIFilter) {
        currentFilter = filter

        // Reapply the filter with the current intensity
        if let inputImage = currentFilter.value(forKey: kCIInputImageKey) as? CIImage {
            currentFilter.setValue(inputImage, forKey: kCIInputImageKey)
        }

        applyProcessing()
    }

    // Save UIImage to photo library
    func saveImage() {
        guard let uiImage = processedUIImage else { return }
        UIImageWriteToSavedPhotosAlbum(uiImage, nil, nil, nil)
    }
}

// Preview Provider
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

@main
struct PhotoFilterApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
