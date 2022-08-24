//
//  GroupTableViewCell.swift
//  vk_client_test
//
//  Created by admin on 18.08.2022.
//

import UIKit

class GroupTableViewCell: UITableViewCell {

    //MARK: - Fields
    var group = VKGroup()
    
    @IBOutlet var avatarImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    
    //MARK: - Methods
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: false)

        
    }
    
    func SetGroup(_ group: VKGroup) {
        self.nameLabel.text = group.name ?? "unnamed group"
        
        if group.avatar == nil {
            self.avatarImageView.image = UIImage(systemName: "person.3")
        } else {
            self.avatarImageView.image = UIImage(named: group.avatar!)
        }
        
        
    }

}
