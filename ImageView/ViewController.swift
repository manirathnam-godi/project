
import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var ImgView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func addimagePress(_ sender: Any) {
        
        let ac = UIAlertController(title: "Select Image ", message: "select image from?", preferredStyle: .actionSheet)
        
        let camerabutn = UIAlertAction(title: "camera", style: .default) { [weak self] (_) in
            self?.showImagePicker(selectedsource: .camera)
            
        }
        let librarybutn = UIAlertAction(title: "liabrary", style: .default) { [weak self] (_) in
            self?.showImagePicker(selectedsource: .photoLibrary)
            
        }
        let cancelbutn = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
        ac.addAction(camerabutn)
        ac.addAction(librarybutn)
        ac.addAction(cancelbutn)
        self.present(ac, animated: true,completion: nil)
    }
    func showImagePicker(selectedsource: UIImagePickerController.SourceType) {
        guard UIImagePickerController.isSourceTypeAvailable(selectedsource) else {
            print("selected source not available")
            return
        }
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = selectedsource
        imagePickerController.allowsEditing = false
        self.present(imagePickerController, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[.originalImage] as? UIImage {
            ImgView.image = selectedImage
        } else {
            print("Image Not Found")
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}


