


# constant
den = 1.229
g = 9.81
dt = 0.0001



# input
mass = input("What is the mass(kg) of skydiver?")
ar = input("What is the cross-sectional area(m^2) of parachute?")
ftime = input("How long(s) does the object free fall before the parachute deploys?")
coed = input("What is the coefficient of drag of parachute?(Put 1.8 as default)")
vi = ftime*g


# calculation
gravi = mass*g

v = vi
d = 0
t = 0
p = mass*vi
v1 = -100


while 1==1:
    drag = -0.5*den*ar*coed*v**2
    fnet = gravi+drag
    p = p+fnet*dt
    v = p/mass
    d+=v*dt
    t+=dt
    v2 = v
    if abs(v2-v1)<1e-15:
        break
    v1 = v
print '\nTerminal Velocity (m/s):', v, '\nFalling Time to reach Terminal Velocity (s):', t, '\nFalling Distance to reach Terminal Velocity (m):', d


    

    



