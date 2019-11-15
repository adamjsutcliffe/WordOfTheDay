//
//  WordViewController.swift
//  WordOfTheDay
//
//  Created by Adam Sutcliffe on 14/11/2019.
//  Copyright © 2019 Peak. All rights reserved.
//

import UIKit

class WordViewController: UIViewController {
    
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var definitionLabel: UILabel!
    @IBOutlet weak var originLabel: UILabel!
    @IBOutlet weak var examplesLabel: UILabel!
    
    let todaysWord = "ipso facto (adverb)"
    let todaysDefinition = "DEFINITION: by the fact itself; by the very nature of the deed: to be condemned ipso facto."
    let todaysOrigin = "ORIGIN: First recorded in English in the mid-1500s, ipso facto is an adverb that comes directly from the Latin phrase ipsō factō \"by the fact itself, by the very fact.\" Ipso facto is often used when the very fact that one thing occurs is a direct consequence of another, as in \"Having won all the gold medals in the sport's Olympic events, she was ipso facto the best gymnast in the world.\" Latin factō is the ablative form of factum “deed, act, fact,” and ipsō is the ablative of ipsum \"very, same, itself,\" among other senses. Ipso appears in other Latin expressions used in English, especially in law, including eo ipso “by that very fact” and ipso jure \"by the law itself.\""
    let todaysExample = "CONTEXT: ... the notion that cars made in Germany would ipso facto be better crafted than others ... this would have seemed curious indeed just a generation before. \nTONY JUDT, POSTWAR: A HISTORY OF EUROPE SINCE 1945, 2005 \n\nI had, it seemed, defined myself as a \"popular\" writer, and if one is popular, then, ipso facto, one is not to be taken seriously. \nOLIVER SACKS, ON THE MOVE, 2015"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        wordLabel.text = todaysWord
        definitionLabel.text = todaysDefinition
        originLabel.text = todaysOrigin
        examplesLabel.text = todaysExample
    }
    
    @IBAction func WordLinkButtonHandler(_ sender: Any) {
        if let url = URL(string: "https://www.dictionary.com/e/word-of-the-day/ipso-facto-2019-11-14/") {
            UIApplication.shared.open(url, options: [:])
        }
    }
}
