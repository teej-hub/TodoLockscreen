import SwiftUI

struct lockscreenView: View {
    
    @State var changeLockscreenImage = false
    @State var openCameraRoll = false
    @State var imageSelected = UIImage()
    var body: some View {
        
        ZStack(alignment: .bottomTrailing) {
            Button(action: {
                changeLockscreenImage = true
                openCameraRoll = true
                
            }, label: {
                if changeLockscreenImage {
                    Image(uiImage: imageSelected)
                        .resizable()
                        .frame(width: 120, height: 120)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                } else {
                    Image("lockscreenImage")
                        .resizable()
                        .frame(width: 120, height: 120)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                }
        })
            Image(systemName: "plus")
                .frame(width: 30, height:30)
                .foregroundColor(.white)
                .background(Color.gray)
                .clipShape(Circle())
        }.sheet(isPresented: $openCameraRoll){
            ImagePicker(selectedImage: $imageSelected, sourceType: .photoLibrary)
        }
    }
}
struct lockscreenView_Previews: PreviewProvider {
    static var previews: some View {
        lockscreenView()
    }
}
