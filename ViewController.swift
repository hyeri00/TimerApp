//
//  ViewController.swift
//  TimerApp
//
//  Created by 혜리 on 2022/10/28.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    // outlet 연결
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    weak var timer: Timer?
    var number = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI() // 함수 호출
    }
    
    func configureUI() {
        mainLabel.text = "초를 선택하세요"
        slider.value = 0.5
    }
    
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        // 슬라이더의 벨류값을 가지고 메인레이블의 텍스트를 세팅
        number = Int(sender.value * 60)
        mainLabel.text = "\(number) 초"
    }
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        // 1초씩 지나갈 때마다 무언가를 실행
        timer?.invalidate() // 타이머 비활성화
        
//        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(doSomethingAfter1Second), userInfo: nil, repeats: true)
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [self] _ in
            // 반복을 하고 싶은 코드
            if number > 0 {
                number -= 1
                // 슬라이더도 줄여야 함
                // 레이블 표시도 다시 해줘야 함
                slider.value = Float(number) / Float(60)
                mainLabel.text = "\(number) 초"
            } else {
                number = 0
                mainLabel.text = "초를 선택하세요"
                timer?.invalidate()

                // 소리를 나게 해야됨
                AudioServicesPlayAlertSound(SystemSoundID(1322))
            }
        }
    }
    
//    @objc func doSomethingAfter1Second() {
//        if number > 0 {
//            number -= 1
//            // 슬라이더도 줄여야 함
//            // 레이블 표시도 다시 해줘야 함
//            slider.value = Float(number) / Float(60)
//            mainLabel.text = "\(number) 초"
//        } else {
//            number = 0
//            mainLabel.text = "초를 선택하세요"
//            timer?.invalidate()
//
//            // 소리를 나게 해야됨
//            AudioServicesPlayAlertSound(SystemSoundID(1322))
//        }
//    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        // 초기화 세팅
        mainLabel.text = "초를 선택하세요"
        
        // 슬라이더의 가운데 설정
//        slider.setValue(0.5, animated: true)
        slider.value = 0.5
        
        number = 0
        timer?.invalidate()

    }
    
    
    
    
    
}

