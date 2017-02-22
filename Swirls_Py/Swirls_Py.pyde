px = None
py = None
first = True
def setup():
    global px
    global py
    size(600,600)
    background(0)
    colorMode(HSB, 100)
    strokeWeight(2)
    px = mouseX
    py = mouseY


def draw():
    global first
    global px
    global py
    translate(width/2, height/2)
    mx = map(mouseX, 0, width, -width/2, width/2)
    my = map(mouseY, 0, height, -height/2, height/2)
    if mousePressed == True and not first:
        colar = map(abs(mx) + abs(my), 0, width, 0, 120)
        stroke(colar, 100, 100)
        """line(px, py, mx, my);   // This was a mistake, but still
        line(-px, -py, mx, my);   // an intresting one.
        line(px, py, -mx, -my);
        line(-px, -py, -mx, -my);
        """
        line(px, py, mx, my)
        line(-px, py, -mx, my)
        line(px, -py, mx, -my)
        line(-px, -py, -mx, -my)
        px = mx
        py = my
    elif mousePressed == True:
        px = mx
        py = my
        first = False
    else:
        first = True
