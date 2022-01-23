var k_up = keyboard_check_pressed(vk_up)
var k_down = keyboard_check_pressed(vk_down)
var k_left = keyboard_check_pressed(vk_left)
var k_right = keyboard_check_pressed(vk_right)

function move(p1, p2) {
  movingPiece1 = p1
  movingPiece2 = p2

  movingPiece1.moveToX = movingPiece2.x
  movingPiece1.moveToY = movingPiece2.y
  movingPiece1.isMovingTo = true

  movingPiece2.moveToX = movingPiece1.x
  movingPiece2.moveToY = movingPiece1.y
  movingPiece2.isMovingTo = true

  var temp = movingPiece1.index
  movingPiece1.index = movingPiece2.index
  movingPiece2.index = temp

  state = states.moving
}

function moveUp()    { move(board[8], getPieceFromIndex(board[8].index - 3)) }
function moveDown()  { move(board[8], getPieceFromIndex(board[8].index + 3)) }
function moveLeft()  { move(board[8], getPieceFromIndex(board[8].index - 1)) }
function moveRight() { move(board[8], getPieceFromIndex(board[8].index + 1)) }

if (state == states.waiting) {
  if (k_down  && board[8].index > 2)      { moveUp()    }
  if (k_up    && board[8].index < 6)      { moveDown()  }
  if (k_right && board[8].index % 3 != 0) { moveLeft()  }
  if (k_left  && board[8].index % 3 != 2) { moveRight() }
}
else if (state == states.moving) {
  if (!movingPiece1.isMovingTo && !movingPiece2.isMovingTo) {
    state = states.waiting
  }
}