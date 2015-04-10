
baseArea =  1152000
idealWinW = 1440
minWinW =   320
winW =      null

resizeHandler = (e) ->
  console.log "resize"
  winH = window.innerHeight
  winW = window.innerWidth 
  scale(winW)

keyFrames = [
    position: 1440
    value: 18
  ,
    position: 769
    value: 12
  ,
    position: 768
    value: 18
  ,
    position: 501
    value: 12
  ,
    position: 500
    value: 18
  ,
    position: 320
    value: 12
]

# winWRange = 320 -> 1440

# smallRange = 320 -> 500 in winWRange
# medRange = 501 -> 768 in winWRange
# font-size = map(12 -> 18, smallRange)



smallBP = 320

middleBP = 500

largeBP = 1440

output = timeline($playhead (smallBP, 100) (middleBP, 1000) (largeBP, 2000);


timeline = ( smallBp -> middleBP -> largeBp) 
           ( 12      ->  18,12   ->      18);

x = timeline($playhead);



.box {
  opacity = (0 -> 1)(1 -> 0)(spring-value);
}



article {
  max = 18
  min = 12
  font-size: = timeline(::window[width] (smallBP, min) (middleBP, max) (middleBP+1, max) (largeBP, min);
}

.box  {
  translateX(translated-var)
}


interpolate(::window[width],smallBP,middleBP,100,1000);
interpolate(::window[width],middleBP,largeBP,1000,2000);




map ::window[width] val small-font-size  (320, 12) (500, 18);


mapValueInRange = (value, fromLow, fromHigh, toLow, toHigh) ->
  fromRangeSize = fromHigh - fromLow
  toRangeSize = toHigh - toLow
  valueScale = (value - fromLow) / fromRangeSize
  return toLow + (valueScale * toRangeSize)

winScale = (value,from, to) -> 
  boundValue = Math.min(Math.max(value,minWinW), idealWinW)
  mapValueInRange boundValue, minWinW, idealWinW, from, to


getSmallFontSize = (value) ->
  if 1440 <= value
    return 18
  else if 769 <= value and value <= 1440
    return mapValueInRange value, 769, 1440, 14, 18
  else if 500 <= value and value <= 768
    return mapValueInRange value, 500, 768, 14, 18
  else if 320 <= value and value <= 499
    return mapValueInRange value, 320, 499, 14, 18
  else
    return 14


scale = (winW) ->
  
  scaleFactor = Math.max(1, (winW)/(idealWinW))
  console.log(scaleFactor, winW, idealWinW)
  engine.solve
    'small-font-size':  winScale winW, 14, 18
    'medium-font-size': winScale winW, 14, 18
    'big-font-size':    winScale winW, 16, 24

  # document.getElementsByTagName('html')[0].style.fontSize = (16*scaleFactor)+'px'

resizeHandler()
window.addEventListener 'resize', resizeHandler