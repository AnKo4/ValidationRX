//
//  CheckBox.swift
//  CheckBox
//
//  Created by msoft on 06.06.2019.
//  Copyright © 2019 Mediasoft. All rights reserved.
//

import UIKit

@IBDesignable class CheckBox: UIView {

    @IBOutlet weak var checkBox: UIButton!
    @IBOutlet weak var someTextLabel: UILabel!
    
    var checkBoxTapped: Bool = false
    
    @IBAction func checkBoxTapped(_ sender: UIButton) {
        checkBox.isSelected = !checkBox.isSelected
        checkBoxTapped = checkBox.isSelected
    }
    
    var view: UIView!

    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    func loadFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "CheckBox", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        return view
    }
    
    func setupView() {
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
    
}
