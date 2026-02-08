//
//  MovieDBTests.swift
//  MovieDBTests
//
//  Created by Surya Rayala on 1/26/26.
//

import XCTest
@testable import MovieDB

final class MovieDBTests: XCTestCase {

    var objCalculator : Calculator?
    var objMovieViewModel : MovieViewModel?
    
    override func setUpWithError() throws {
        objCalculator = Calculator()
        objMovieViewModel = MovieViewModel()
    }
    
    override func tearDownWithError() throws {
        objCalculator = nil
    }
    
    func testSum() {
        let result1 = objCalculator?.sum(a: 10, b: 20)
        XCTAssertEqual(result1, 30)
        
        let result2 = objCalculator?.sum(a: nil, b: 20)
        XCTAssertEqual(result2, 0)
        
        let result3 = objCalculator?.sum(a: nil, b: nil)
        XCTAssertEqual(result3, 0)
    }
    
    func testMultiplication() {
        let result1 = objCalculator?.multiply(a: 10, b: 20)
        XCTAssertEqual(result1, 200)
        
        let result2 = objCalculator?.multiply(a: nil, b: 20)
        XCTAssertEqual(result2, 0)
        
        let result3 = objCalculator?.multiply(a: nil, b: nil)
        XCTAssertEqual(result3, 0)
    }
    
    func testDivision() {
        let result1 = objCalculator?.divide(a: 100, b: 20)
        XCTAssertEqual(result1, 5)
        
        let result2 = objCalculator?.divide(a: nil, b: 20)
        XCTAssertEqual(result2, 0)
        
        let result3 = objCalculator?.divide(a: nil, b: nil)
        XCTAssertEqual(result3, 0)
    }
    
    func testSubtraction() {
        let result1 = objCalculator?.subtract(a: 100, b: 20)
        XCTAssertEqual(result1, 80)
        
        let result2 = objCalculator?.subtract(a: nil, b: 20)
        XCTAssertEqual(result2, 0)
        
        let result3 = objCalculator?.subtract(a: nil, b: nil)
        XCTAssertEqual(result3, 0)
    }
    
    func testNumberOfMovies() {
        let result1 = objMovieViewModel?.numberOfMoviesFunc() ?? 0
        print(result1)
        XCTAssertEqual(result1, 0)
    }
}
