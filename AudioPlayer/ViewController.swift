//
//  ViewController.swift
//  AudioPlayer
//
//  Created by Josh Sachs on 11/12/15.
//  Copyright © 2015 Josh Sachs. All rights reserved.
//

import UIKit
import AVFoundation
import MediaPlayer
//import MediaPlayer

class ViewController: UIViewController, MPMediaPickerControllerDelegate {
    
    var mp3Player: AVAudioPlayer = AVAudioPlayer()
    var mediaPicker: MPMediaPickerController = MPMediaPickerController(mediaTypes: .AnyAudio)
    //var enableRate: Bool = Bool()
    //var rate: Float = 2.0
    
    
    @IBAction func songSelect(sender: AnyObject) {
        mediaSelect()
    }

    @IBAction func play(sender: AnyObject) {
        playSong()
    }
    
    @IBAction func pause(sender: AnyObject) {
       pauseSong()
    }
    
    @IBAction func faster(sender: AnyObject) {
        speedUp()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //button functions
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
            mp3Player.rate = 1.30
            mp3Player.play()
        } catch {
            print("Error, something went wrong")
            }
    }
    
    func pauseSong() {
        if mp3Player.playing {
            mp3Player.pause()
        } else {
            mp3Player.play()
        }
    }
    
    
    func mediaSelect(){
        let picker = mediaPicker
        
        
        if  picker == mediaPicker{
            picker.delegate = self
            picker.allowsPickingMultipleItems = true
            picker.showsCloudItems = true
            picker.prompt = "Pick a song please"
            view.addSubview(picker.view)
            
            presentViewController(picker, animated: true, completion: nil)
        } else {
            print("Something didn't work")
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        title = "Media picker..."
        
        let buttonPickAndPlay = UIButton(type: .System)
        let pickAndPlay = buttonPickAndPlay

        
        if pickAndPlay == buttonPickAndPlay {
            pickAndPlay.frame = CGRect(x: 0, y: 0, width: 200, height: 37)
            pickAndPlay.center = CGPoint(x: view.center.x, y: view.center.y - 50)
            pickAndPlay.setTitle("Pick and Play", forState: .Normal)
            pickAndPlay.addTarget(self, action: "mediaSelect", forControlEvents: .TouchUpInside)
            view.addSubview(pickAndPlay)
            
        }
        
        let buttonStopPlaying = UIButton(type: .System)
        let stopPlaying = buttonPickAndPlay
        
        if stopPlaying == buttonStopPlaying {
            stopPlaying.frame = CGRect(x: 0, y: 0, width: 200, height: 37)
            stopPlaying.center = CGPoint(x: view.center.x, y: view.center.y + 50)
            stopPlaying.setTitle("Stop Playing", forState: .Normal)
            
        }
        
    }

    
    
    
    }
    


