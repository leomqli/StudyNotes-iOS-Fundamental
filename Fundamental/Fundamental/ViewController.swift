//
//  ViewController.swift
//  Fundamental
//
//  Created by Leo on 2023/4/28.
//

import UIKit

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Alloc流程
		let alloc = Alloc()
		alloc.test()
		alloc.testNew()
		alloc.testOptimizationLevel()
		
		// 内存
		Memory.getStruct()
		Memory.getHEX()
		Memory.getPerson()
	}
	
}

