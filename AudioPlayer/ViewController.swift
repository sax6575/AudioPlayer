//
//  ViewController.swift
//  AudioPlayer
//
//  Created by Josh Sachs on 11/12/15.
//  Copyright © 2015 Josh Sachs. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var mp3Player: AVAudioPlayer = AVAudioPlayer()
    //var enableRate: Bool = Bool()
    //var rate: Float = 2.0
   
    

    @IBAction func play(sender: AnyObject) {
        playSong()
    }
    @IBAction func pause(sender: AnyObject) {
        if mp3Player.playing {
            mp3Player.pause()
        }
    }
    
    @IBAction func faster(sender: AnyObject) {
        speedUp()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func playSong() {
        let mp3Path = NSBundle.mainBundle().pathForResource("Build Me", ofType: "mp3")
        let song:NSURL = NSURL(fileURLWithPath: mp3Path!)
        
        
        do {
            mp3Player = try AVAudioPlayer(contentsOfURL: song)
            mp3Player.play()
        } catch {
            print("Error, something went wrong")
        }
    }
    
    func speedUp(){
        let mp3Path = NSBundle.mainBundle().pathForResource("Build Me", ofType: "mp3")
        let song:NSURL = NSURL(fileURLWithPath: mp3Path!)
        
        
        do {
            mp3Player = try AVAudioPlayer(contentsOfURL: song)
            mp3Player.enableRate = true
            mp3Player.rate = 2.0
            mp3Player.play()
        } catch {
            print("Error, something went wrong")
            }
        }
    }
    


