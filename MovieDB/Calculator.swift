//
//  Calculator.swift
//  MovieDB
//
//  Created by Surya Rayala on 2/5/26.
//

struct Calculator {
    func sum(a: Int?, b: Int?) -> Int {
        guard let a, let b else {
            return 0
        }
        return a + b
    }
    
    func multiply(a: Int?, b: Int?) -> Int {
        guard let a, let b else {
            return 0
        }
        return a * b
    }
    
    func divide(a: Int?, b: Int?) -> Double {
        guard let a, let b, b != 0 else {
            return 0
        }
        return Double(a) / Double(b)
    }
    
    func subtract(a: Int?, b: Int?) -> Int {
        guard let a, let b else {
            return 0
        }
        return a - b
    }   
}
