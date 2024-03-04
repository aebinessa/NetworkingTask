//
//  PetDetailsViewController.swift
//  PetsTask
//
//  Created by Abdullah Bin Essa on 3/4/24.
//

import Foundation
import UIKit
import Kingfisher

class PetDetailsViewController: UIViewController {
    
    var pets: Pet?
    


    // UI Components
        private let petNameLabel = UILabel()
        private let petadoptedLabel = UILabel()
        private let petImageView = UIImageView()
        private let petAgeLabel = UILabel()
        private let petGenderLabel = UILabel()


    

        override func viewDidLoad() {
            super.viewDidLoad()
            setupViews()
            setupLayout()
            configureWithPet()
        }

        private func setupViews() {
            // Configure UI components here
            view.backgroundColor = .white

                petNameLabel.font = .systemFont(ofSize: 16, weight: .medium)
                petAgeLabel.font = .systemFont(ofSize: 16, weight: .medium)

                // Add the views to the hierarchy
                view.addSubview(petNameLabel)
                view.addSubview(petAgeLabel)
                view.addSubview(petImageView)
                view.addSubview(petadoptedLabel)
                view.addSubview(petGenderLabel)
        }

        private func setupLayout() {
            // Use SnapKit to define the layout
            petImageView.snp.makeConstraints { make in
                    make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
                    make.centerX.equalToSuperview()
                    make.width.height.equalTo(100)  // Example size, adjust as needed
                }

                petNameLabel.snp.makeConstraints { make in
                    make.top.equalTo(petImageView.snp.bottom).offset(20)
                    make.centerX.equalToSuperview()
                }

                petAgeLabel.snp.makeConstraints { make in
                    make.top.equalTo(petNameLabel.snp.bottom).offset(20)
                    make.centerX.equalToSuperview()
                }
            petadoptedLabel.snp.makeConstraints { make in
                make.top.equalTo(petAgeLabel.snp.bottom).offset(20)
                make.centerX.equalToSuperview()
            }
            petGenderLabel.snp.makeConstraints { make in
                make.top.equalTo(petadoptedLabel.snp.bottom).offset(20)
                make.centerX.equalToSuperview()

                
            }
        }

        private func configureWithPet() {
            petNameLabel.text = "Pet Name: \(pets?.name ?? "N/A")"
            petAgeLabel.text = "Age: \(pets?.age ?? 0)"
            petImageView.image = UIImage(named: pets?.image ?? "")
            petadoptedLabel.text = "Adopted: \(pets?.adopted ?? true)"
            petGenderLabel.text = "Gender: \(pets?.gender ?? "NONBINARY")"
            petImageView.kf.setImage(with: URL(string: pets?.image ?? ""))
        }
    }





