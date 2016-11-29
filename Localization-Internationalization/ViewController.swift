//
//  ViewController.swift
//  Localization-Internationalization
//
//  Created by Vishal on 27/11/16.
//  Copyright © 2016 vishalvirodhia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var anyButton: UIButton!
    @IBOutlet weak var flagImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        label.text = NSLocalizedString("labelText", comment: "label")
        label.text = GetTextForKey(key: "labelText")
        anyButton.setTitle(NSLocalizedString("buttonTitle", comment: "title"), for: .normal)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func buttonAction(_ sender: Any) {
        flagImage.image = UIImage(named: NSLocalizedString("imageName", comment: "image"))
        
    }
    

}

func GetTextForKey(key:String)->String{
    var resource = ""
    if let selectedLanguage = UserDefaults.standard.value(forKey: "selectedLanguage") as? String{
        switch selectedLanguage {
        case "Base":
            resource = "Base"
            break
        case "ar":
            resource = "ar"
            break
        default:
            resource = "Base"
            break
        }
    }else{
        resource = "Base"
    }
    let path = Bundle.main.path(forResource: resource, ofType: "lproj")
    let bundle = Bundle(path: path!)
    return (bundle?.localizedString(forKey: key, value: nil, table: nil))!
}
