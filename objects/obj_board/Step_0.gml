var k_up = keyboard_check_pressed(vk_up)
var k_down = keyboard_check_pressed(vk_down)
var k_left = keyboard_check_pressed(vk_left)
var k_right = keyboard_check_pressed(vk_right)

state = 0 // 0 - "waiting", 1 - "moving"

function move(p1, p2) {
  swap(p1, p2)
  state = 1
}

function moveUp()    { move(board[8], getPieceFromIndex(board[8].index - 3)) }
function moveDown()  { move(board[8], getPieceFromIndex(board[8].index + 3)) }
function moveLeft()  { move(board[8], getPieceFromIndex(board[8].index - 1)) }
function moveRight() { move(board[8], getPieceFromIndex(board[8].index + 1)) }

if (state == 0) {
  if (k_down  && board[8].index > 2)      { moveUp()    }
  if (k_up    && board[8].index < 6)      { moveDown()  }
  if (k_right && board[8].index % 3 != 0) { moveLeft()  }
  if (k_left  && board[8].index % 3 != 2) { moveRight() }
}
else if (state == 1) {
  state = 0
}