//
//  MusicViewController.swift
//  demo1
//
//  Created by BETTY KWOK on 15/05/2017.
//  Copyright © 2017 JUNCHENG WANG. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class MusicViewController : UIViewController,
    UIPickerViewDelegate,
    UIPickerViewDataSource
{
    
    var soundPlayer: AVAudioPlayer?
    var elapsedTime: TimeInterval = 0
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        songs.dataSource = self
        songs.delegate = self
        
        
        let path = Bundle.main.path(forResource: "One More Weekend", ofType: "mp3")
        
        
        // URL of the file
        let url = URL(fileURLWithPath: path!)
        
        do {
            
            //Set up the player by loading the sound file
            try soundPlayer = AVAudioPlayer(contentsOf: url)
        }
            //Catch the Error if playback fails
        catch {print ("file not available")}
    }
    
    
    //Button link
    

    
    @IBOutlet weak var songs: UIPickerView!
    
    
    var items = ["One More Weekend", "Drenched", "Scared To Be Lonely", "Feel Good", "Don't Leave", "Stay"]
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return items.count
    }
    
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return items[row]
    }
    
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let path = Bundle.main.path(forResource: items[row], ofType:"mp3")
        
        let url = URL(fileURLWithPath: path!)
        do  {
            try soundPlayer = AVAudioPlayer(contentsOf: url)
        }
        catch {print("file not abaliable")}
        }
    
    
    @IBAction func play(_ sender: UIButton) {
        
        //Play & Resume
        
        if soundPlayer != nil{
            soundPlayer!.currentTime = elapsedTime
            soundPlayer!.play()
        }

    }
 
    @IBAction func pause(_ sender: UIButton) {
        
        //Pause
        
        if soundPlayer != nil{
            elapsedTime = soundPlayer!.currentTime
            soundPlayer!.pause()
        }
    }
    

    @IBAction func stop(_ sender: UIButton) {
        
        //Stop
        
        if soundPlayer != nil {
            soundPlayer!.stop()
            elapsedTime = 0
        }

    }
    

    @IBAction func slider(_ sender: UISlider) {
        
        soundPlayer?.volume = sender.value
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

    



