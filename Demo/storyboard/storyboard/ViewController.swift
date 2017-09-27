//
//  ViewController.swift
//  storyboard
//
//  Created by Mark Ran on 2017/9/26.
//  Copyright © 2017年 markran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func pressButton(_ sender: Any) {
        let picker = TPickerViewController()
        picker.pickerDelegate = self
        present(picker, animated: true, completion: nil)
    }
}

extension ViewController: TPickerViewControllerDelegate {
    func pickerViewControllerDidDismiss() {
        performSegue(withIdentifier: "showNextViewController", sender: nil)
    }
}
