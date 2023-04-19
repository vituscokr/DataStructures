//
//  BubbleSort.swift
//  Created by vitus on 2022/05/12.
//
import Foundation

/// bubbleSort
///  Test > TestSort.swift > testBubbleSort
func bubbleSort<Element: Comparable> (_ array: inout [Element]) {
    guard array.count >= 2  else {
        return
    }
    for end in (1..<array.count).reversed() {
        var swapped = false
        for current in 0..<end where array[current] > array[current + 1] {
                array.swapAt(current, current + 1)
                swapped = true
        }
        if !swapped {
            return
        }
    }
}
/// selectionSort
/// smiliar to bubble sort
/// only swap at the end of  each pass
/// Test > TestSort.swift > testSelectionSort
func selectionSort<Element: Comparable> (_ array: inout [Element]) {
    guard array.count >= 2  else {
        return
    }
    for current in 0..<(array.count - 1) {
        var lowest = current
        for other in (current + 1 )..<array.count where array[lowest] > array[other] {
                lowest = other
        }
        if lowest != current {
            array.swapAt(lowest, current)
        }
    }
}
/// insertsionSort
///
/// Test > TestSort.swift > testInsertionSort
func insertsionSort<Element: Comparable> (_ array: inout [Element]) {
    guard array.count >= 2  else {
        return
    }
    for current in 1..<array.count {
        for shifting in (1...current).reversed() { // 1...1 2...1 3...1
            if array[shifting] < array[shifting - 1 ] {
                array.swapAt(shifting, shifting - 1 )
            } else {
                break
            }
        }
    }
}

/// merge sort
///  Big O Notation Time complexity : 0(n log n) Space complexity : 0( n log n) 
/// Test> TestMrgeSort >
func mergeSort<Element: Comparable> (_ array: [Element] ) -> [Element] {
    guard array.count > 1 else {
        return array
    }
    // recursion
    let middle = array.count / 2
    let left = mergeSort(Array(array[..<middle]))
    let right = mergeSort(Array(array[middle...]))
    return merge(left, right)
}
func merge<Element: Comparable> (_ left: [Element], _ right: [Element]) -> [Element] {
    var leftIndex = 0
    var rightIndex = 0
    var result: [Element] = []
    while leftIndex < left.count && rightIndex < right.count {
        let leftElement = left[leftIndex]
        let rightElement = right[rightIndex]
        if leftElement < rightElement {
            result.append(leftElement)
            leftIndex += 1
        } else if leftElement > rightElement {
            result.append(rightElement)
            rightIndex += 1
        } else {
            result.append(leftElement)
            leftIndex += 1
            result.append(rightElement)
            rightIndex += 1
        }
    }
    if leftIndex < left.count {
        result.append(contentsOf: left[leftIndex...])
    }
    if rightIndex < right.count {
        result.append(contentsOf: right[rightIndex...])
    }
    return result
}
