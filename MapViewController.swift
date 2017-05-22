//
//  MapViewController.swift
//  demo1
//
//  Created by BETTY KWOK on 16/05/2017.
//  Copyright © 2017 JUNCHENG WANG. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var Xmenu: UIButton!
    @IBAction func XmenuClick(_ sender: Any) {
        UIView.animate(withDuration: 5, delay: 0, options: UIViewAnimationOptions.curveEaseOut, animations: {
//----------MARK THE MENU BACK
            self.Xmenu.transform = CGAffineTransform(rotationAngle: 0)
            
            //MARK: for 3 button's setting
            
            self.acc.alpha = 0.8
            self.acc.transform = CGAffineTransform.init(scaleX: 1.5, y: 1.5);CGAffineTransform.transf
            self.hotel.alpha = 0.8
            self.shoppingcar.alpha = 0.8

           
        }, completion: nil)
    }
    
    @IBOutlet weak var acc: UIButton!
    
    @IBOutlet weak var hotel: UIButton!
    
    @IBOutlet weak var shoppingcar: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//MARK: for 3 button's setting
        
        self.acc.alpha = 0
        self.hotel.alpha = 0
        self.shoppingcar.alpha = 0
        
//MARK: FOR MENU BUTTON
        UIView.animate(withDuration: 1, delay: 1, options: UIViewAnimationOptions.curveEaseOut, animations: { 
            self.Xmenu.alpha = 1
            self.Xmenu.transform = CGAffineTransform(rotationAngle: 0.25*3.1415927)
        }, completion: nil)
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
