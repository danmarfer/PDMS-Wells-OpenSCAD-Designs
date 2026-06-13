l = 20; //length of well
w =15; //width of well
h = 7; //height of well
diameter = 9; //diameter of well hole
t = 2; //mould wall thickness
eps = 0.01; //epsilon
tolerance = 0.25; //tolerance for intersecting pieces
distance = 10; //distance to separate door from mould
grip = 5; //size of the gate handle
faces = 128; //number of cilinder faces

module mould(){
difference(){
        
    translate([-(l/2 + t),-(w/2 + t),0]) 
        cube([l+t*2, w+t*2, h+t]);

    translate([-l/2,-w/2,t]) 
        cube([l,w,h+eps]);
    
    
    translate([-(l+t*2)/2-eps,-(w)/2,h+t+eps]) 
        rotate([0,90,0]) 
            cube([h, w, t+eps*2]);

    translate([-(l+t)/2-eps,-(w+t)/2,h+t+eps]) 
        rotate([0,90,0]) 
            cube([h+t/2, w+t, t/2]);
    
}


cylinder(h+t,d=diameter, $fn=faces);

};


mould();
 
module gate(){
    cube([w+t-tolerance, h+t/2, t/2-tolerance]);
        
    translate([(w+t-tolerance)/2-(w*0.75)/2,(h-t/2)/2,0]) 
        cube([w*0.75,t,grip]);
    
};

color("red") translate([-distance,distance,0]) gate();

//color("red") translate([-l/2 - tolerance/2,(w+t-tolerance)/2,t/2]) rotate([90,0,-90]) gate();

