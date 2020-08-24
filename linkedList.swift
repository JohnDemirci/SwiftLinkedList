//
//  main.swift
//  practicing swift
//
//  Created by John Demirci on 8/24/20.
//  Copyright © 2020 John Demirci. All rights reserved.
//

import Foundation


class Node  {
    var value : String
    var next : Node?
    init(value : String) {
        self.value = value
    }
}


class Names {
    var head : Node?
    /// adding a new element to the list
    /// it can be any type
    func add (val: String) {
        if isEmpty() {
            let new_node = Node(value: val)
            head = new_node
            return
        }
        var current_node = head
        while current_node?.next != nil {
            current_node = current_node?.next
        }
        if current_node?.next == nil && current_node != nil {
            let new_node = Node(value: val)
            current_node?.next = new_node
        }
    }
    /// printing every value in the linked list
    func printAll () {
        if var current_node = head {
            while current_node.next != nil {
                print("\(current_node.value)")
                current_node = current_node.next!
                if current_node.next == nil {
                    print("\(current_node.value)")
                }
            }
        }
    }
    /// removes the last element in the list
    func removeLast () {
        /// if the head is nil  then the list is empty
        if isEmpty() {
            return
        }
        if head?.next == nil {
            head = nil
        }
        var current_node = head
        while current_node?.next?.next != nil {
            current_node = current_node?.next
        }
        current_node?.next = nil
    }
    
    func isFound (val : String) -> (Bool, Int?) {
        var pos : Int = 0
        if head?.value == val {
            return (true, pos)
        }
        var current_node = head
        while current_node?.next != nil {
            if current_node?.value == val {return (true,pos)}
            current_node = current_node?.next
            pos = pos + 1
            if current_node?.next == nil && current_node?.value == val {
                return (true,pos)
            }
        }
        return (false,nil)
    }
    
    func findIndexAt (index: Int?) {
        if index == nil { return }
        if head == nil { return }
        var current_node = head
        for _ in 0..<index! {
            if current_node?.next != nil {
                current_node = current_node?.next
            }
        }
        print("\(current_node!.value)")
    }
    
    
    
    func isEmpty () -> Bool {
        if head == nil { return true }
        else { return false }
    }
    
    
}

func main () {
    let nameList = Names()
    nameList.add(val: "John")
    nameList.add(val: "dem")
    nameList.add(val: "ekko")
    nameList.add(val: "yone")
    nameList.add(val: "twisted fate")
    nameList.add(val: "dracarys")
    nameList.add(val: "omerta")
    nameList.add(val: "lol")
    nameList.add(val: "xd")
    nameList.add(val: "oof")
    nameList.printAll()
}


main()
