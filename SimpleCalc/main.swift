//
//  main.swift
//  SimpleCalc
//
//  Created by Duncan Andrew on 3/30/17.
//  Copyright © 2017 Duncan Andrew. All rights reserved.
//

import Foundation

print("Enter an expression seperated by returns:")

var response = readLine(strippingNewline: true)!
var responseArray = response.components(separatedBy: " ")

if(responseArray.count > 1){
    // Single line operation
    
    // Assign needed variables
    var operation = responseArray[responseArray.count - 1]
    var numbers = [Int]()
    var numbersValid = true
    
    // Convert strings to numbers and check their validity
    for i in 0...(responseArray.count-2){
        var number = Int(responseArray[i])
        if number != nil{
            numbers.append(number!)
        }else{
            numbersValid = false
            break
        }
    }
    
    // Do the math
    if(numbersValid){
        if(operation == "count"){
            
            var result = 0
            for i in 0...(numbers.count-1){
                result = result + numbers[i]
            }
            print("Result: \(result)")
            
        }else if(operation == "avg"){
            
            var sum = 0.0
            for i in 0...(numbers.count-1){
                sum = sum + Double(numbers[i])
            }
            var result = sum / Double(numbers.count)
            print("Result: \(result)")
            
        }else if(operation == "fact"){
            
            if numbers.count <= 1 && numbers[0] >= 0{
                var result = 0
                if numbers[0] == 0{
                    result = 0
                }else{
                    result = 1
                    for i in 1...numbers[0]{
                        result = result * i
                    }
                }
                print("Result: \(result)")
            }else {
                print("Error: fact can only be called on one positive number")
            }
            
        }else{
            print("Error: \(operation) is not a supported opperation")
        }
    }else{
        print("Error: There was an error in the number inputs")
    }
}else{
    // Multi line operation
    
    // Assign needed variables
    var number1 = Int(response)
    var operation = readLine(strippingNewline: true)!
    var number2 = Int(readLine(strippingNewline: true)!)
    
    // Do the calculation if the numbers are valid
    if number1 != nil && number2 != nil {
        if(operation == "+"){
            var result = number1! + number2!
            print("Result: \(result)")
        }else if(operation == "-"){
            var result = number1! - number2!
            print("Result: \(result)")
        }else if(operation == "*"){
            var result = number1! * number2!
            print("Result: \(result)")
        }else if(operation == "/"){
            var result = Double(number1!) / Double(number2!)
            print("Result: \(result)")
        }else if(operation == "%"){
            var result = number1! % number2!
            print("Result: \(result)")
        }else {
            print("Error: \(operation) is not a supported opperation")
        }
    }else{
        print("Error: There was an error in the number inputs")
    }
}
