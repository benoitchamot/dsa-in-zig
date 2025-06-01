const std = @import("std");
const print = std.debug.print;


pub fn findMinValue (array: []u32) u32 {
    
    // Initialise with first item in the array
    var minValue: u32 = array[0];

    for (array[1..]) |a| {
        if (a < minValue) {
            minValue = a;
        }
    }

    return minValue;
}


pub fn findMaxValue (array: []u32) u32 {
    var maxValue: u32 = array[0];

    for (array[1..]) |a| {
        if (a > maxValue) {
            maxValue = a;
        }
    }

    return maxValue;
}


pub fn printArray (array: []u32) void {
    print("( ", .{});
    for (array) |a| {
        print("{d} ", .{a});
    }
    print(")\n", .{});
}


pub fn bubbleSort (array: []u32) void {
    // This function will sort the array that is passed to it
    // thus modifying the input itself, not providing something new

    // Principle:
    // https://www.w3schools.com/dsa/dsa_algo_bubblesort.php
    // 1. Go through the array one value at a time
    // 2. For each value, compare the value with the next one
    // 3. If the value is higher than the next one, swap the values
    // 4. Go through the array as many times as there are values in the array

    if (array.len > 1) {
        for (0..array.len-1) |i| {
            if (array[i] > array[i+1]) {
                const temp: u32 = array[i];
                array[i] = array[i+1];
                array[i+1] = temp;
            }
        }
        bubbleSort (array[0..array.len-1]);
    }
    else {}
}


pub fn main() void {
    
    var arrayOfInts = [_]u32{ 34, 4, 236, 456, 7543, 23, 53, 98, 1, 45 };

    // Print the original array
    printArray(arrayOfInts[0..arrayOfInts.len]);

    // Find and print lowest value in array
    print("Min: {d}\n", .{findMinValue(arrayOfInts[0..arrayOfInts.len])});
    print("Max: {d}\n", .{findMaxValue(arrayOfInts[0..arrayOfInts.len])});

    // Sorted array
    bubbleSort(arrayOfInts[0..arrayOfInts.len]);
    printArray(arrayOfInts[0..arrayOfInts.len]);
}
