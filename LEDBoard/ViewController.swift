//
//  ViewController.swift
//  LEDBoard
//
//  Created by 박소진 on 2023/07/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var inputUIView: UIView!
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var inputTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //컬러 버튼 누르면 버튼 타이틀과 레이블 컬러 변경
    @IBAction func randomColorChanged(_ sender: UIButton) {
        
        let random = randomColor() //이걸 빼면 색깔이 서로 달라진다.
        
        sender.tintColor = random
        resultLabel.textColor = random
        
    }
    
    //입력 후 엔터 & 보내기 버튼 누르면 레이블에 표시
    @IBAction func enterAndSendButtonTapped(_ sender: Any) {
        
        //입력이 1글자보다 작고 nil이면 알림창 띄우고, 그게 아니면 라벨에 넣기
        if let inputText = inputTextField.text, inputText.count <= 1 {
            showAlert(title: "내용을 두 글자 이상 입력해 주세요!")
        } else {
            resultLabel.text = inputTextField.text
        }
        
    }
    
    @IBAction func tapGestureTapped(_ sender: UITapGestureRecognizer) {
        
        inputUIView.isHidden.toggle()
        view.endEditing(true)
        
    }
    
    //알림창
    func showAlert(title: String) {
        
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "확인", style: .cancel)
        alert.addAction(okButton)
        present(alert, animated: true)

    }
    
    //랜덤 컬러 생성
    func randomColor() -> UIColor? {
        
        let colorList: [UIColor] = [.black, .blue, .brown, .red, .yellow, .green, .gray]
        
        return colorList.randomElement()
        
    }
    
}

