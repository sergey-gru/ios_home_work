//
//  FriendsTableViewCell.swift
//  vk_client_test
//
//  Created by admin on 18.08.2022.
//

import UIKit

class FriendsTableViewCell: UITableViewCell {

    //MARK: - Fields
    var user = VKUser()
    
    @IBOutlet var goPhotosButton: UIButton!
    @IBOutlet var labelName: UILabel!
    @IBOutlet var avatarImageView: UIImageView!
    
    
    //MARK: - Code
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: false)

        // Configure the view for the selected state
    }
    
    func SetUser(_ user: VKUser) {
        
        //let nameLabel = self.viewWithTag(1) as! UILabel
        if user.name == nil || user.sirname == nil {
            self.labelName.text = "Loading"
            self.labelName.textColor = .gray
        } else {
            self.labelName.text = user.name! + " " + user.sirname!
            self.labelName.textColor = .tintColor
        }
        
        if user.avatar == nil {
            self.avatarImageView.image = UIImage(systemName: "person.fill.viewfinder")
        } else {
            self.avatarImageView.image = UIImage(named: user.avatar!)
        }
        
    }
    
    
    @IBAction func goButton_TouchUpInside(_ sender: UIButton, forEvent event: UIEvent) {
        
    }

}
