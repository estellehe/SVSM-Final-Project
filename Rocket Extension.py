# constant
den = 1.229
g = 9.81
dt = 0.0001



# input
mass = input("What is the mass(kg) of rocket?")
arp = input("What is the cross-sectional area(m^2) of parachute?")
arr = input("What is the cross-sectional area(m^2) of rocket?")
coed = input("What is the coefficient of drag of parachute?(Put 1.8 as default)")
coer = input("What is the coefficient of drag of rocket?(Put 0.75 as default)")
print "\n\nNow tell me about the rocket engine!"
cp= input("What is the code for total impulse? Please put 1 for 1/2A, 2 for A, 3 for B, 4 for C, 5 for D")
thr = input("What is the average thrust(N) provided by the engine?")
delay = input("What is the delay time(s) between burnout and ejection charge?")


if abs(cp-1)<0.1:
    p = -0.9375
elif abs(cp-2)<0.1:
    p = -1.88
elif abs(cp-3)<0.1:
    p = -3.755
elif abs(cp-4)<0.1:
    p = -7.505
elif abs(cp-5)<0.1:
    p = -15.005   
    
    
# calculation
gravi = mass*g
v = p/mass
t1 = p/thr
a1 = -thr/mass
d1 = 0.5*a1*t1**2

d2 = 0
t2 = 0


while v<=0:
    dragr = 0.5*den*arr*coer*v**2
    fnet = gravi+dragr
    p = p+fnet*dt
    v = p/mass
    d2+=v*dt
    t2+=dt


if t2>delay:
    print "Warning: Greater delay time to deploy parachute is needed. Please choose another engine!"
else:
    hei = abs(d1+d2)
    tfall = delay-t2
    t3 = tfall
    t4 = 0
    v = 0
    d3 = 0
    d4 = 0
    p = 0
    v1 = -100
    while t3>0:
        dragr = -0.5*den*arr*coer*v**2
        fnet = gravi+dragr
        p = p+fnet*dt
        v = p/mass
        d3+=v*dt
        t3-=dt
    while 1==1:
        dragp = -0.5*den*arp*coed*v**2
        fnet = gravi+dragp
        p = p+fnet*dt
        v = p/mass
        d4+=v*dt
        t4+=dt
        v2 = v
        if abs(v2-v1)<1e-15:
            break
        v1 = v
    print "\n\nTerminal Velocity (m/s):", v,"\nHeight of Apogee (m):", hei,"\nFalling Distance before Deployment (m):", d3,"\nFalling Time before Deployment (s):", tfall
    if hei>d3+d4:
        print "Falling Distance before Terminal Velocity reached (m):", d4
    else:
        print "The rocket will hit groundy before it reaches terminal velocity."    
    
