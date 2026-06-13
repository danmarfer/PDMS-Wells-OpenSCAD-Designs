l = 20;
w =15;
h = 7;
diameter = 7;
eps = 0.01;
faces = 128;

module well(){
    difference(){
        translate([-l/2,-w/2,0]) 
            cube([l,w,h]);
        
        translate([0,0,-eps])
            cylinder(h+eps*2,d=diameter,$fn=faces);
    }
}

color("blue", alpha=0.25) well();