l = 50;
w =40;
h = 25;
diameter = 17.5;
t = 5; //wall thickness*2
eps = 0.01;
tolerance = 0.25;
desp = 50;
faces = 128;

module molde(){
    difference(){
        translate([-(l/2 + t),-(w/2 + t),0]) 
            cube([l+t*2, w+t*2, h+t]);

        translate([-l/2,-w/2,t]) 
            cube([l,w,h+eps]);
        
        
        translate([0,0,-eps]) 
            cylinder(t+eps*2,d=diameter+tolerance,$fn=faces);
    }
};
molde();

module perno(){

    cylinder(h+t,d=diameter,$fn=faces);
    
};
color("red") translate([0,desp,0]) perno();

