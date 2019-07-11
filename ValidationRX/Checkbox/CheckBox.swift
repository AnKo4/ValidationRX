//
//  CheckBox.swift
//  CheckBox
//
//  Created by msoft on 06.06.2019.
//  Copyright © 2019 Mediasoft. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

@IBDesignable class CheckBox: UIView {
    
    // MARK: - IBOutlets

    @IBOutlet weak var checkBox: UIButton!
    @IBOutlet weak var someTextLabel: UILabel!
    
    // MARK: - Public properties
    
    var checkBoxChecked = BehaviorRelay<Bool>(value: false)
    
    // MARK: - Private properties
    
    var view: UIView!
 
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    // MARK: - Private methods
    
    private func loadFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "CheckBox", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        return view
    }
    
    private func setupView() {
        view = loadFromNib()
        view.frame = bounds
        view.layer.cornerRadius = 5
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
        
        checkBox.setImage(UIImage(named: "checkbox_unchecked"), for: .normal)
        checkBox.setImage(UIImage(named: "checkbox_checked"), for: .selected)
        checkBox.isSelected = false

        someTextLabel.text = "Я согласен с условиями лицензионного соглашения"
    }
    
    // MARK: - IBActions
    
    @IBAction func checkBoxTapped(_ sender: UIButton) {
        checkBox.isSelected = !checkBox.isSelected
        checkBoxChecked.accept(checkBox.isSelected)
    }
    
}
