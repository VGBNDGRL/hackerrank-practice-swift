let mytwoDimArr: [[Int]] = [[1,1,1,0,0,0],
                            [0,1,0,0,0,0],
                            [1,1,1,0,0,0],
                            [0,0,0,0,0,0],
                            [0,0,0,0,0,0],
                            [0,0,0,0,0,0] ]

for x in 0..<mytwoDimArr.count {
    var rowAsString = ""
    for y in 0..<mytwoDimArr[x].count {
        rowAsString += String(mytwoDimArr[x][y])
    }
    print(rowAsString)
}

var currentSum = 0
var maxSum: Int? = nil

for row in 0...3 {
    for col in 0...3 {
        // first row of hourglass shape
        for val in 0...2 {
            currentSum += mytwoDimArr[row][col + val]
        }
        
        // center of hourglass shape
        currentSum += mytwoDimArr[row + 1][col+1]
        
        // last row of hourglass shape
        for val in 0...2 {
            currentSum += mytwoDimArr[row + 2][col + val]
        }
        
        if let unwrappedMaxSum = maxSum {
            if currentSum > unwrappedMaxSum {
                maxSum = currentSum
            }
        } else {
            maxSum = currentSum
        }
        
        currentSum = 0
    }
}

print(maxSum ?? "error printing")
