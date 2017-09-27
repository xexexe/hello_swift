//
//  TPickerViewController.swift
//  storyboard
//
//  Created by Mark Ran on 2017/9/26.
//  Copyright © 2017年 markran. All rights reserved.
//

import UIKit
import MobileCoreServices

class TPickerViewController: UIImagePickerController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.sourceType = UIImagePickerControllerSourceType.camera
        self.mediaTypes = [kUTTypeMovie as String]
        self.delegate = self
        self.showsCameraControls = true
        self.videoQuality = UIImagePickerControllerQualityType.typeHigh
        self.cameraFlashMode = UIImagePickerControllerCameraFlashMode.auto
        self.videoMaximumDuration = 20;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}


extension TPickerViewController: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]){
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
    }
}

extension TPickerViewController: UINavigationControllerDelegate {
    
}
