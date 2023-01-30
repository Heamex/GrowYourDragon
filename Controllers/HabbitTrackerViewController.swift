//
//  ViewController.swift
//  GrowYourDragon
//
//  Created by Nikita Belov on 21.01.23.
//

import UIKit

class HabbitTrackerViewController: UIViewController {
    // MARK: - Outlets

    // MARK: - Private Properties
    let toHabitDetailViewSegue = "toHabitDetailViewSegue"

    // MARK: - LifeCycle Methods
	override func viewDidLoad() {
		super.viewDidLoad()
		print("Habbit Tracker here!")
	}

    // MARK: - Actions
    @IBAction func addNewHabitButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: toHabitDetailViewSegue, sender: nil)
    }

    // MARK: - Segue Actions
    @IBSegueAction func toHabitDetailViewSegue(_ coder: NSCoder, sender: Any?, segueIdentifier: String?) -> HabitDetailViewController? {
        guard segueIdentifier == toHabitDetailViewSegue else {
            return nil
        }
        return HabitDetailViewController(coder: coder, name: "New Habit")
    }
}

