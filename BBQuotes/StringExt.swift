//
//  StringExt.swift
//  BBQuotes
//
//  Created by ceboi on 12/01/26.
//

extension String {
    func removeSpaces () -> String {
        self.replacingOccurrences(of: " ", with: "") // klo cuma 1 line, bisa auto return, jadi ga perlu ngetik return lagi
    }
    
    func removeCaseAndSpace () -> String {
        self.lowercased().removeSpaces()
    }
}
