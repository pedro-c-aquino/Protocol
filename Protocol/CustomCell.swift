//
//  CustomCell.swift
//  Protocol
//
//  Created by user208023 on 5/11/22.
//

import UIKit

protocol CustomCellProtocol: AnyObject {
    
    func tappedEditButton(value: Pessoa)
}

class CustomCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var sutitleLabel: UILabel!
    @IBOutlet weak var perfilImage: UIImageView!
    
    private var pessoa: Pessoa?
    
    weak var delegate: CustomCellProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(value: Pessoa) {
        
        self.pessoa = value
        self.nameLabel.text = value.nome
        self.sutitleLabel.text = value.sobrenome
        self.perfilImage.image = UIImage(named: value.avatar ?? "")
        
    }
    
    @IBAction func tappedEditButton(_ sender: UIButton) {
        if let _pessoa = self.pessoa {
            print("tappedEditButton")
            self.delegate?.tappedEditButton(value: _pessoa)
        }
    }
}
