length = 20;
width =15;
height = 7;
diameter = 7;
thickness = 2;
eps = 0.01;
faces = 128;


difference(){
        
    translate([-(length/2 + thickness),-(width/2 + thickness),0]) 
        cube([length+thickness*2, width+thickness*2, height+thickness]);

    translate([-length/2,-width/2,thickness]) 
        cube([length,width,height+eps]);
}


cylinder(height+thickness,d=diameter,$fn=faces);
    