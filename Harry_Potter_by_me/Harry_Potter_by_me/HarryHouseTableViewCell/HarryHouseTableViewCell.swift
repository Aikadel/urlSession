//
//  HarryHouseTableViewCell.swift
//  Harry_Potter_by_me
//
//  Created by Aigerim on 21.05.2022.
//

import UIKit

enum Colors: String {
    case griffindor = "Scarlet and gold"
    case ravenclaw = "Blue and bronze"
    case hufflepuff = "Yellow and black"
    case slytherin = "Green and silver"
}

class HarryHouseTableViewCell: UITableViewCell {
   
  //
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var founder: UILabel!
    @IBOutlet weak var animal: UIImageView!
    @IBOutlet weak var element: UIImageView!
    @IBOutlet weak var ghost: UILabel!
    @IBOutlet weak var commonRoom: UILabel!
    @IBOutlet weak var view1:UIView!
    @IBOutlet weak var view2: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(with model:HouseModel) {
        name.text = model.name
        animal.image = UIImage (named: model.animal)
        element.image = UIImage (named: model.element)
        founder.text = model.founder
        ghost.text = model.ghost
        commonRoom.text =  model.commonRoom
        let houseColor = Colors(rawValue: model.houseColours)
        
        switch houseColor {
        case .griffindor:
            view1.backgroundColor = .red
            view2.backgroundColor = .yellow
        case .ravenclaw:
            view1.backgroundColor = .blue
            view2.backgroundColor = .brown
        case .hufflepuff:
            view1.backgroundColor = .yellow
            view2.backgroundColor = .black
        case .slytherin:
            view1.backgroundColor = .systemGreen
            view2.backgroundColor = .systemGray6
        case .none:
            break
        }
        
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
