if (isMovingTo) {
  if (moveToX != -1 && moveToY != -1) {
    direction = point_direction(x, y, moveToX, moveToY);
    x = x + lengthdir_x(moveVelocity, direction);
    y = y + lengthdir_y(moveVelocity, direction);

    if (point_distance(x, y, moveToX, moveToY) < moveVelocity) {
      x = moveToX
      y = moveToY
      isMovingTo = false
    }
  }
}