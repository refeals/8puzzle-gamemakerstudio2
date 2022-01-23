randomize()
x = 0
y = 0

enum states {
  waiting,
  moving
}
state = states.waiting // 0 - "waiting", 1 - "moving"

function createPiece(i) {
  var xpos = x + (i % 3) * 200
  var ypos = y + int64(i / 3) * 200
  var piece = instance_create_layer(xpos, ypos, "Instances", obj_piece)
  piece.image_index = i
  piece.index = i

  if (i == 8) {
    piece.image_alpha = 0
  }

  return piece
}

// Function to find index based on value on array
function getIndexFromValue(val = 8) {
  for (i = array_length(board) - 1; i >= 0; i--) {
    if (board[i].image_index == val) {
      return board[i].index
    }
  }
  return -1
}

function getPieceFromIndex(index) {
  for (i = 0; i < array_length(board); i++) {
    if (board[i].index == index) {
      return board[i]
    }
  }
  return -1
}

// Swap board values
function swap(p1, p2) {
  var temp_x = p1.x
  var temp_y = p1.y
  var index = p1.index
  p1.x = p2.x
  p1.y = p2.y
  p1.index = p2.index
  p2.x = temp_x
  p2.y = temp_y
  p2.index = index
}

function getPossibilityList(index, lastChoice) {
  var list = []

  if (index > 2 && lastChoice != "down")       { array_push(list, "up")    }
  if (index < 6 && lastChoice != "up")         { array_push(list, "down")  }
  if (index % 3 != 0 && lastChoice != "right") { array_push(list, "left")  }
  if (index % 3 != 2 && lastChoice != "left")  { array_push(list, "right") }

  return list
}

function getRandomPossibility(list) {
  var listSize = array_length(list)
  var index = irandom(listSize - 1)
  return list[index]
}

// Randomize board
function randozimeBoard() {
  var lastChoice = ""

  repeat (10000) {
    var index = getIndexFromValue()
    var list = getPossibilityList(index, lastChoice)
    var choice = getRandomPossibility(list)

    if (choice == "up") {
      var swapPiece = getPieceFromIndex(board[8].index - 3)
      swap(board[8], swapPiece)
    }

    else if (choice == "down") {
      var swapPiece = getPieceFromIndex(board[8].index + 3)
      swap(board[8], swapPiece)
    }

    else if (choice == "left") {
      var swapPiece = getPieceFromIndex(board[8].index - 1)
      swap(board[8], swapPiece)
    }

    else if (choice == "right") {
      var swapPiece = getPieceFromIndex(board[8].index + 1)
      swap(board[8], swapPiece)
    }

    lastChoice = choice
  }
}

// variables
board = [
  createPiece(0),
  createPiece(1),
  createPiece(2),
  createPiece(3),
  createPiece(4),
  createPiece(5),
  createPiece(6),
  createPiece(7),
  createPiece(8)
]

movingPiece1 = pointer_null
movingPiece2 = pointer_null

randozimeBoard()