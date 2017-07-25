//
//  ViewController.swift
//  AVPlayer
//
//  Created by Mark Ran on 2017/7/25.
//  Copyright © 2017年 hehe. All rights reserved.
//

/*
 *  kUTTypeAudiovisualContent
 *
 *    audio and/or video content
 *
 *    UTI: public.audiovisual-content
 *    conforms to: public.data, public.content
 *
 *
 *  kUTTypeMovie
 *
 *    A media format which may contain both video and audio
 *    Corresponds to what users would label a "movie"
 *
 *    UTI: public.movie
 *    conforms to: public.audiovisual-content
 *
 *
 *  kUTTypeVideo
 *
 *    pure video (no audio)
 *
 *    UTI: public.video
 *    conforms to: public.movie
 *
 *
 *  kUTTypeAudio
 *
 *    pure audio (no video)
 *
 *    UTI: public.audio
 *    conforms to: public.audiovisual-content
 *
 *
 *  kUTTypeQuickTimeMovie
 *
 *    QuickTime movie
 *
 *    UTI: com.apple.quicktime-movie
 *    conforms to: public.movie
 *
 *
 *  kUTTypeMPEG
 *
 *    MPEG-1 or MPEG-2 movie
 *
 *    UTI: public.mpeg
 *    conforms to: public.movie
 *
 *
 *  kUTTypeMPEG2Video
 *
 *    MPEG-2 video
 *
 *    UTI: public.mpeg-2-video
 *    conforms to: public.video
 *
 *
 *  kUTTypeMPEG2TransportStream
 *
 *    MPEG-2 Transport Stream movie format
 *
 *    UTI: public.mpeg-2-transport-stream
 *    conforms to: public.movie
 *
 *
 *  kUTTypeMP3
 *
 *    MP3 audio
 *
 *    UTI: public.mp3
 *    conforms to: public.audio
 *
 *
 *  kUTTypeMPEG4
 *
 *    MPEG-4 movie
 *
 *    UTI: public.mpeg-4
 *    conforms to: public.movie
 *
 *
 *  kUTTypeMPEG4Audio
 *
 *    MPEG-4 audio layer
 *
 *    UTI: public.mpeg-4-audio
 *    conforms to: public.mpeg-4, public.audio
 *
 *
 *  kUTTypeAppleProtectedMPEG4Audio
 *
 *    Apple protected MPEG4 format
 *    (.m4p, iTunes music store format)
 *
 *    UTI: com.apple.protected-mpeg-4-audio
 *    conforms to: public.audio
 *
 *
 *  kUTTypeAppleProtectedMPEG4Video
 *
 *    Apple protected MPEG-4 movie
 *
 *    UTI: com.apple.protected-mpeg-4-video
 *    conforms to: com.apple.m4v-video
 *
 *
 *  kUTTypeAVIMovie
 *
 *    Audio Video Interleaved (AVI) movie format
 *
 *    UTI: public.avi
 *    conforms to: public.movie
 *
 *
 *  kUTTypeAudioInterchangeFileFormat
 *
 *    AIFF audio format
 *
 *    UTI: public.aiff-audio
 *    conforms to: public.aifc-audio
 *
 *
 *  kUTTypeWaveformAudio
 *
 *    Waveform audio format (.wav)
 *
 *    UTI: com.microsoft.waveform-audio
 *    conforms to: public.audio
 *
 *
 *  kUTTypeMIDIAudio
 *
 *    MIDI audio format
 *
 *    UTI: public.midi-audio
 *    conforms to: public.audio
 *
 *
 */

//extern const CFStringRef kUTTypeAudiovisualContent                   __OSX_AVAILABLE_STARTING(__MAC_10_4,__IPHONE_3_0);
//extern const CFStringRef kUTTypeMovie                                __OSX_AVAILABLE_STARTING(__MAC_10_4,__IPHONE_3_0);
//extern const CFStringRef kUTTypeVideo                                __OSX_AVAILABLE_STARTING(__MAC_10_4,__IPHONE_3_0);
//extern const CFStringRef kUTTypeAudio                                __OSX_AVAILABLE_STARTING(__MAC_10_4,__IPHONE_3_0);
//extern const CFStringRef kUTTypeQuickTimeMovie                       __OSX_AVAILABLE_STARTING(__MAC_10_4,__IPHONE_3_0);
//extern const CFStringRef kUTTypeMPEG                                 __OSX_AVAILABLE_STARTING(__MAC_10_4,__IPHONE_3_0);
//extern const CFStringRef kUTTypeMPEG2Video                           __OSX_AVAILABLE_STARTING(__MAC_10_10,__IPHONE_8_0);
//extern const CFStringRef kUTTypeMPEG2TransportStream                 __OSX_AVAILABLE_STARTING(__MAC_10_10,__IPHONE_8_0);
//extern const CFStringRef kUTTypeMP3                                  __OSX_AVAILABLE_STARTING(__MAC_10_4,__IPHONE_3_0);
//extern const CFStringRef kUTTypeMPEG4                                __OSX_AVAILABLE_STARTING(__MAC_10_4,__IPHONE_3_0);
//extern const CFStringRef kUTTypeMPEG4Audio                           __OSX_AVAILABLE_STARTING(__MAC_10_4,__IPHONE_3_0);
//extern const CFStringRef kUTTypeAppleProtectedMPEG4Audio             __OSX_AVAILABLE_STARTING(__MAC_10_4,__IPHONE_3_0);
//extern const CFStringRef kUTTypeAppleProtectedMPEG4Video             __OSX_AVAILABLE_STARTING(__MAC_10_10,__IPHONE_8_0);
//extern const CFStringRef kUTTypeAVIMovie                             __OSX_AVAILABLE_STARTING(__MAC_10_10,__IPHONE_8_0);
//extern const CFStringRef kUTTypeAudioInterchangeFileFormat           __OSX_AVAILABLE_STARTING(__MAC_10_10,__IPHONE_8_0);
//extern const CFStringRef kUTTypeWaveformAudio                        __OSX_AVAILABLE_STARTING(__MAC_10_10,__IPHONE_8_0);
//extern const CFStringRef kUTTypeMIDIAudio                            __OSX_AVAILABLE_STARTING(__MAC_10_10,__IPHONE_8_0);

import UIKit
import AVFoundation
import Photos
import MobileCoreServices

class ViewController: UIViewController {
    @IBOutlet weak var avplayerView: UIView!
    
    var playerLayer: AVPlayerLayer?
    var photosPicker: UIImagePickerController?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func pressButton(_ sender: Any) {

    }

}
