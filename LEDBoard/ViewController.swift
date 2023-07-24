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
    @IBOutlet var sendButton: UIButton!
    @IBOutlet var colorChangeButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDesign()
        
    }
    
    //컬러 버튼 누르면 버튼 타이틀과 레이블 컬러 변경
    @IBAction func randomColorChanged(_ sender: UIButton) {
        let random = randomColor() //이걸 빼면 색깔이 서로 달라진다.
        
        sender.tintColor = random
        resultLabel.textColor = random
        
    }
    
    //입력 후 엔터 & 보내기 버튼 누르면 레이블에 표시
    @IBAction func enterAndSendButtonTapped(_ sender: Any) {
        
        //입력이 1글자보다 작고 nil이면 알림창 띄우고, 그게 아니면 라벨에 넣기 + 20자 이하로 제한
        if let inputText = inputTextField.text, inputText.count <= 1 || inputText.count >= 21 {
            showAlert(title: "2 ~ 20자 이내로 입력해 주세요!")
        } else {
            resultLabel.text = inputTextField.text
        }
        
    }
    
    @IBAction func tapGestureTapped(_ sender: UITapGestureRecognizer) {
        
        inputUIView.isHidden.toggle()
        view.endEditing(true)
        
    }
    
    //디자인
    func setDesign() {
        view.backgroundColor = .black
        designTextField()
        buttonDesign(button: sendButton, title: "보내기")
        buttonDesign(button: colorChangeButton, title: "Aa")
        designLabel()
    }
    
    //레이블 디자인
    func designLabel() {
        resultLabel.text = ""
        resultLabel.textColor = .white
        resultLabel.textAlignment = .center
        resultLabel.font = UIFont.systemFont(ofSize: 80)
        resultLabel.numberOfLines = 0
    }
    
    //버튼 디자인
    func buttonDesign(button: UIButton, title: String) {
        
        button.setTitle(title, for: .normal)
        button.tintColor = .black
        button.backgroundColor = .white
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 10
        button.layer.shadowOffset = CGSize(width: 1, height: 1)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.3
        button.layer.shadowRadius = 2
        
    }
    
    //텍스트 필드 디자인
    func designTextField() {
        
        inputTextField.borderStyle = .none
        inputTextField.placeholder = "2 ~ 20자 이내로 입력해 주세요!"
        inputTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: 0)) //왼쪽 여백
        inputTextField.leftViewMode = .always
        
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
        
        let colorList: [UIColor] = [.blue, .brown, .red, .yellow, .green, .gray, .lightGray, .cyan]
        
        return colorList.randomElement()
        
    }
    
}

