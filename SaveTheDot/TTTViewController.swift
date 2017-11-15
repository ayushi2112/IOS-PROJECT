//
//  TTTViewController.swift
//  SaveTheDot
//
//  Created by Ayushi Sharma on 15/11/17.
//  Copyright © 2017 Ayushi. All rights reserved.
//

import UIKit

class TTTViewController: UIViewController {
    
    var activePlayer = 1 //Cross
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    let winningCombinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    var gameIsActive = true
    
    
    @IBAction func action(_ sender: AnyObject)
    {
        if (gameState[sender.tag-1] == 0 && gameIsActive == true)
        {
            gameState[sender.tag-1] = activePlayer
            
            if (activePlayer == 1)
            {
                sender.setImage(UIImage(named: "Cross.png"), for: UIControlState())
                activePlayer = 2
            }
            else
            {
                sender.setImage(UIImage(named: "Nought.png"), for: UIControlState())
                activePlayer = 1
            }
        }
        
        for combination in winningCombinations
        {
            if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]
            {
                gameIsActive = false
                
                if gameState[combination[0]] == 1
                {
                    
                    //handler
                    var action = {
                        
                        (a:UIAlertAction)->Void in
                        self.gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
                        self.gameIsActive = true
                        self.activePlayer = 1
                        
                    
                        
                        for i in 1...9
                        {
                            let button = self.view.viewWithTag(i) as! UIButton
                            button.setImage(nil, for: UIControlState())
                        }
                        
                        
                        
                    }
                    
                    
                    
                    //alert
                    var alert = UIAlertController(title: "Game Over", message: "X has Won 😉", preferredStyle: .alert)
                    
                    
                alert.addAction(UIAlertAction(title: "Play Again", style: .default, handler: action))
                  
                    self.present(alert, animated: true, completion: nil)
                    
                }
                else
                {
                    //handler
                    var action = {
                        
                        (a:UIAlertAction)->Void in
                        self.gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
                        self.gameIsActive = true
                        self.activePlayer = 1
                        
                        
                        
                        for i in 1...9
                        {
                            let button = self.view.viewWithTag(i) as! UIButton
                            button.setImage(nil, for: UIControlState())
                        }
                        
                        
                        
                    }
                    
                   
                    //alert
                    var alert = UIAlertController(title: "Game Over", message: "O has Won 😉", preferredStyle: .alert)
                    
                    
                    alert.addAction(UIAlertAction(title: "Play Again", style: .default, handler: action))
                   
                    self.present(alert, animated: true, completion: nil)
                    
                    
                }
                
                
                
            }
        }
        
        gameIsActive = false
        
        for i in gameState
        {
            if i == 0
            {
                gameIsActive = true
                break
            }
        }
        
        if gameIsActive == false
        {
            //handler
            var action = {
                
                (a:UIAlertAction)->Void in
                self.gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
                self.gameIsActive = true
                self.activePlayer = 1
                
                
                
                for i in 1...9
                {
                    let button = self.view.viewWithTag(i) as! UIButton
                    button.setImage(nil, for: UIControlState())
                }
                
                
                
            }
            
          
            
            //alert
            var alert = UIAlertController(title: "Game Over", message: "It Was a Draw 😉", preferredStyle: .alert)
            
            
            alert.addAction(UIAlertAction(title: "Play Again", style: .default, handler: action))
            
            
            self.present(alert, animated: true, completion: nil)
            
        
        }
    }
    
    
    func clean()
    {
        for i in 1...9
        {
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControlState())
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        clean()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
