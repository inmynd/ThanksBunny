//
//  AudioRecorderManager.swift
//  ThanksBunny
//
//  Created by 박민아 on 4/18/25.
//

import Foundation
import AVFoundation

class AudioRecorderManager: NSObject, ObservableObject, AVAudioRecorderDelegate {
    var audioRecorder: AVAudioRecorder?
    let recordingSession = AVAudioSession.sharedInstance()
    
    @Published var isRecording = false
    
    override init() {
        super.init()
        setupRecorder()
    }
    
    func setupRecorder() {
        do {
            try recordingSession.setCategory(.playAndRecord, mode: .default)
            try recordingSession.setActive(true)
            // Deprecated in iOS 17, but still functional as of now
            // TODO: iOS에서 requestRecordPermission의 공식 대체 API가 발표되면 이 코드 업데이트 해야해용
            AVAudioSession.sharedInstance().requestRecordPermission { allowed in
                DispatchQueue.main.async {
                    if !allowed {
                        print("마이크 접근이 거부되었습니다.")
                    }
                }
            }
        } catch {
            print("녹음 세션 설정 오류: \(error.localizedDescription)")
        }
    }

    func startRecording() {
        let fileName = UUID().uuidString + ".m4a"
        let path = FileManager.default.temporaryDirectory.appendingPathComponent(fileName)
        
        let settings = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 12000,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]
        
        do {
            audioRecorder = try AVAudioRecorder(url: path, settings: settings)
            audioRecorder?.delegate = self
            audioRecorder?.record()
            isRecording = true
            print("녹음 시작: \(path)")
        } catch {
            print("녹음 실패: \(error.localizedDescription)")
        }
    }

    func stopRecording() {
        audioRecorder?.stop()
        isRecording = false
        print("녹음 종료")
    }
}
