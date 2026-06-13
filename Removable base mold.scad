l = 20;
w =15;
h = 7;
diameter = 7.5;
t = 3; //wall thickness*2
base = 10;
eps = 0.01;
fillet = 0.5;
tolerance = 0.1;
disp = 20;
faces = 128;

module molde(){
    difference(){
        
        translate([-(l/2 + t),-(w/2 + t),0]) 
            cube([l+t*2, w+t*2, h+t]);

        translate([-l/2,-w/2,t]) 
            cube([l,w,h+eps]);
        
        translate([0,0,-eps]) 
            linear_extrude(t+eps*2)
                intersection(){
                    translate([-base/2, -base/2]) 
                        square([base,base]);    
                    translate ([0,0,t/2]) 
                        circle((sqrt(2)*base)/2-fillet, $fn=faces);
                };
    }
};
molde();

module perno(){
 
    linear_extrude(t+eps)
                intersection(){
                    translate([-(base-tolerance)/2, -(base-tolerance)/2]) 
                        square([base-tolerance,base-tolerance]);
                            
                    translate ([0,0,t]) 
                        circle((sqrt(2)*base)/2-fillet-tolerance, $fn=faces);
                };
    translate([0,0,t/2])
                cylinder(h+t/2,d=diameter,$fn=faces);
    
};
color("red") translate([0,disp,0]) perno();


