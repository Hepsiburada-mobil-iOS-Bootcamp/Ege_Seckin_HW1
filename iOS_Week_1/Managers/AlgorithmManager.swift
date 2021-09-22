//
//  AlgorithmManager.swift
//  iOS_Week_1
//
//  Created by Erkut Bas on 19.09.2021.
//

import Foundation

extension String {

    var stripped: String {
        let okayChars = Set("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLKMNOPQRSTUVWXYZ")
        return self.filter {okayChars.contains($0) }
    }
}

class AlgorithmManager: AlgorithmProtocol {
    
    // MARK: - Two Sum
    /*
     Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.
     You may assume that each input would have exactly one solution, and you may not use the same element twice.
     You can return the answer in any order.
     
     Input: nums = [2,7,11,15], target = 9
     Output: [0,1]
     Output: Because nums[0] + nums[1] == 9, we return [0, 1].
     */
    func twoSumTest () {
        let nums = [2,7,11,15]
        let target = 9
        let result = twoSum(nums, target)
        print("result : \(result)")
    }
    private func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        for number in 0..<nums.count{
            for num in number+1..<nums.count{
                if((nums[number] != nums[num]) && (nums[number] + nums[num] == target)){
                    return [number,num]
                }
            }
        }
        return [-1]
    }
    
    // MARK: - IsPalindrome
    /*
     Given a string s, determine if it is a palindrome, considering only alphanumeric characters and ignoring cases.
     Input: s = "A man, a plan, a canal: Panama"
     Output: true
     Explanation: "amanaplanacanalpanama" is a palindrome.
     */
    func isPalindromTest() {
        let s = "A man, a plan, a canal: sPanama"
        let result = isPalindrome(s)
        if(result == true){
            print("It's a palindrome")
        }
        else{
            print("Not A palindrome")
        }
    }
    
    func isPalindrome(_ s: String) -> Bool {
        let s = String(s.stripped.lowercased())
        let reverse = String(s.stripped.reversed())
        if(s == reverse){
            return true
        }
        else{
            return false
        }
        
    }
    
    // MARK: - Valid Anagram
    /*
     Given two strings s and t, return true if t is an anagram of s, and false otherwise.
     Input: s = "anagram", t = "nagaram"
     Output: true
     */
    func isAnagramTest() {
        let s = "anagram"
        let t = "nagaram"
        let result = isAnagram(s, t)
        print("\(result)")
    }
    
    func isAnagram(_ s: String, _ t: String) -> Bool {
        let a = Array(s)
        let b = Array(t)

        if a.sorted() == b.sorted() {
            return true
        }
        return false
    }
    
    // MARK: - Contains Duplicate
    /*
     Given an integer array nums, return true if any value appears at least twice in the array, and return false if every element is distinct.
     Input: nums = [1,2,3,1]
     Output: true
     Input: nums = [1,2,3,4]
     Output: false
     */
    func duplicateTest() {
        let nums = [1,2,3,1]
        let target = true
        let result = containsDuplicate(nums)
        if (target == result){
            print(true)
        }
        else{
            print(false)
        }
    }
    
    func containsDuplicate(_ nums: [Int]) -> Bool {
        for number in nums{
            if(nums.filter{$0 == number}.count > 1){
                return true
            }
        }
        return false
    }
    
    // MARK: - Merge Sorted Array
    /*
    
     You are given two integer arrays nums1 and nums2, sorted in non-decreasing order, and two integers m and n, representing the number of elements in nums1 and nums2 respectively.
     Merge nums1 and nums2 into a single array sorted in non-decreasing order.
     The final sorted array should not be returned by the function, but instead be stored inside the array nums1. To accommodate this, nums1 has a length of m + n, where the first m elements denote the elements that should be merged, and the last n elements are set to 0 and should be ignored. nums2 has a length of n.
     
     Input: nums1 = [1,2,3,0,0,0], m = 3, nums2 = [2,5,6], n = 3
     Output: [1,2,2,3,5,6]
     Explanation: The arrays we are merging are [1,2,3] and [2,5,6].
     The result of the merge is [1,2,2,3,5,6] with the underlined elements coming from nums1.
     */
    func mergeArraysTest() {
        var nums1 = [1,2,3,0,0,0]
        let nums2 = [2,5,6]
        let m = 3
        let n = 3
        let target = [1,2,2,3,5,6]
        merge(&nums1, m, nums2, n)
        if(target == nums1){
            print("Passed: \(nums1)")
        }
        else{
            print("Failed!")
        }
        
    }
    
    private func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        nums1 = nums1.dropLast(n)
        nums1 = nums1+nums2
        nums1.sort()
    }
    
    // MARK: - Intersection of Two Arrays
    /*
     Given two integer arrays nums1 and nums2, return an array of their intersection. Each element in the result must appear as many times as it shows in both arrays and you may return the result in any order.
     
     Input: nums1 = [1,2,2,1], nums2 = [2,2]
     Output: [2,2]
     */
    func arrayIntersectionTest() {
        let nums1 = [1,2,2,1]
        let nums2 = [2,2]
        let result = intersect(nums1, nums2)
        print("Result : \(result)")
    }
    
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var intersection = [Int] ()
        for number in nums1{
            if(nums2.contains(number)){
                    intersection.append(number)
                }
        }
        return intersection
    }
    
    // MARK: - Missing Number
    /*
     Given an array nums containing n distinct numbers in the range [0, n], return the only number in the range that is missing from the array.

     Input: nums = [3,0,1]
     Output: 2
     Explanation: n = 3 since there are 3 numbers, so all numbers are in the range [0,3]. 2 is the missing number in the range since it does not appear in nums.

     */
    func missingNumberTest() {
        let nums = [3,0,1]
        let target = 2
        let result = missingNumber(nums)
        if (result == target){
            print("Result: \(result)")
        }
        else{
            print("Failed!")
        }
        
    }
    private func missingNumber(_ nums: [Int]) -> Int {
    
        var max = 0
        var missing = 0
        for number in nums{
            if (number > max){
                max = number
            }
        }
        for number in (0...max){
            if !nums.contains(number){
                    missing = number
            }
        }
        return missing
    }
    
    
}
