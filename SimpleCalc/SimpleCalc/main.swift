//
//  main.swift
//  SimpleCalc
//
//  Created by Ted Neward on 10/3/17.
//  Copyright © 2017 Neward & Associates. All rights reserved.
//

import Foundation

public class Calculator {
    public func calculate(_ args: [String]) -> Int {
        var answer : Int = 0
        if args.count == 3 { // simple cases like 2 + 2
            let num1 = (args[0] as NSString).integerValue
            let oper = args[1]
            let num2 = (args[2] as NSString).integerValue
            switch oper{
            case "+":
                answer = num1 + num2
            case "-":
                answer = num1 - num2
            case "/":
                answer = num1 / num2
            case "%" where num1 == num2:
                answer = 0
            case "%":
                answer = num1 / num2
            case "*":
                answer = num1 * num2
            default:
                answer = 0
            }
        }else if args.count == 1{
            answer = 0
        }else{
            let word = args[args.count-1]
            switch word {
            case "fact":
                var numFact = (args[0] as NSString).integerValue
                var factorial = 1
                for _ in 1...numFact {
                    factorial *= numFact
                    numFact -= 1
                }
                answer = factorial
                
                if (args[0] as NSString).integerValue == 1 {
                    answer = 1
                }
                if (args[0] as NSString).integerValue == 2 {
                    answer = 2
                }
            case "avg":
                var sum = 0
                for n in args.indices.dropLast(){
                    sum += (args[n] as NSString).integerValue
                    print(sum)
                }
                answer = sum / (args.count-1)
            case "count":
                answer = args.count-1
            default:
                answer = 0
            }
        }
        return answer
    }
    
    public func calculate(_ arg: String) -> Int {
        return calculate( arg.split(separator: " ").map({ substr in String(substr) }) )
    }
}

print("UW Calculator v1")
print("Enter an expression separated by returns:")
let first = readLine()!
let operation = readLine()!
let second = readLine()!
print(Calculator().calculate([first, operation, second]))

