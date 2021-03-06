AI = Class{}

function AI:init(paddle, ball)
  self.paddle = paddle
  self.ball = ball
end

function AI:move()
  --implement up
  if self.ball.x > VIRTUAL_WIDTH / 2 + 50 then
    if self.ball.y < VIRTUAL_HEIGHT / 2 then
      self.paddle.dy = -PADDLE_SPEED
    elseif self.ball.y > VIRTUAL_HEIGHT / 2 then
      self.paddle.dy = PADDLE_SPEED
    else
      self.paddle.dy = 0
    end
  end
end

function AI:update(dt)
  if self.ball.x > VIRTUAL_WIDTH / 2 + 50 then
    if self.paddle.dy < 0 then
      dif = self.ball.y - self.paddle.y + (-self.paddle.height)
      self.paddle.y = math.max(0, self.paddle.y + (dif * 10) * dt)
    else
      dif = self.ball.y - self.paddle.y + (-self.paddle.height / 2)
      self.paddle.y = math.min(VIRTUAL_HEIGHT - self.paddle.height, self.paddle.y + (dif * 10) * dt)
    end
  end
end
