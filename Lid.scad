l = 20;
w =15;
t = 3;
eps = 0.01;
gap = 0.5;
lt = 1;
pegW = w/25;
lidH = 5;

module lid(){
    translate([0,0,lt/2]) 
        cube([l+gap*2, w+gap*2, lt],center=true);
    
    linear_extrude(lidH)
        difference(){
            square([l+gap*2+lt*2, w+gap*2+lt*2], center=true);
            square([l+gap*2, w+gap*2], center=true);
        }
    
    mirror([1,0,0]) translate([l/2,0,gap/2+lt]) 
        cube([gap*2,pegW,gap], center=true);
        
    translate([l/2,0,gap/2+lt]) 
        cube([gap*2,pegW,gap], center=true);
        
    mirror([0,1,0]) translate([0,w/2,gap/2+lt]) rotate([0,0,90])
        cube([gap*2,pegW,gap], center=true);
        
    translate([0,w/2,gap/2+lt]) rotate([0,0,90])
        cube([gap*2,pegW,gap], center=true);
}

lid();

