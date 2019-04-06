//
//  Tokenizer.swift
//  SentimentTokenizer
//
//  Created by 李二狗 on 2017/12/27.
//  Copyright © 2017年 Meniny. All rights reserved.
//

import Foundation

open class Tokenizer {
    
    public struct TokenizeOption: OptionSet {
        public let rawValue: Int
        
        public init(rawValue: Int) {
            self.rawValue = rawValue
        }
        
        public static let none = TokenizeOption(rawValue: 0)
        public static let deduplication = TokenizeOption(rawValue: 1 << 0)
        public static let keepSymbols = TokenizeOption(rawValue: 1 << 1)
        public static let keepWhiteSapce = TokenizeOption(rawValue: 1 << 2)
        
        public static let `default`: TokenizeOption = [TokenizeOption.keepSymbols, TokenizeOption.keepWhiteSapce]
    }
    
    public static let `default` = Tokenizer.init()
    
    public init() {
    }
    
    open func tokenize(text sentence: String, options: Tokenizer.TokenizeOption = .default) -> [String] {
        
        let deduplication = options.contains(.deduplication)
        let keepSymbols = options.contains(.keepSymbols)
        let keepWhiteSapce = options.contains(.keepWhiteSapce)
        let flags: CFOptionFlags = keepSymbols ? kCFStringTokenizerUnitWordBoundary : kCFStringTokenizerUnitWord
        let currentRef = CFLocaleCopyCurrent()
        
        let tokenizerRef = CFStringTokenizerCreate(kCFAllocatorDefault, sentence as CFString?, CFRangeMake(0, sentence.count), flags, currentRef)
        CFStringTokenizerAdvanceToNextToken(tokenizerRef)
        var range = CFStringTokenizerGetCurrentTokenRange(tokenizerRef)
        
        var results = [String]()
        
        while range.length > 0 {
            let wordRange = sentence.index(sentence.startIndex, offsetBy: range.location)..<sentence.index(sentence.startIndex, offsetBy: range.location + range.length)
            let trimming: CharacterSet = keepWhiteSapce ? .newlines : .whitespacesAndNewlines
            let word = String(sentence[wordRange]).trimmingCharacters(in: trimming)
            
            if !word.isEmpty {
                if deduplication {
                    if !results.contains(word) {
                        results.append(word)
                    }
                } else {
                    results.append(word)
                }
            }
            
            CFStringTokenizerAdvanceToNextToken(tokenizerRef)
            range = CFStringTokenizerGetCurrentTokenRange(tokenizerRef)
        }
        return results
    }
    
    public class func tokenize(text sentence: String, options: Tokenizer.TokenizeOption = .default) -> [String] {
        return Tokenizer.default.tokenize(text: sentence, options: options)
    }
}

public extension String {
    func tokenize(options: Tokenizer.TokenizeOption = .default) -> [String] {
        return Tokenizer.default.tokenize(text: self, options: options)
    }
    
    static func tokenize(string sentence: String, options: Tokenizer.TokenizeOption = .default) -> [String] {
        return Tokenizer.default.tokenize(text: sentence, options: options)
    }
}
