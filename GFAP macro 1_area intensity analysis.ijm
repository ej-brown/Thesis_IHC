sample = "XXX";
stain = "GFAP";
date = "2021.05.26";
path = "XXX"
selectWindow(stain+" "+sample+"_10x.tif"); //Edit according to your filenames
setTool("brush");
waitForUser("Select analysis area.");
//run("Select None");
run("Colour Deconvolution", "vectors=[H DAB]");
selectWindow(stain+" "+sample+"_10x.tif-(Colour_2)"); //Edit according to your filenames
run("Restore Selection");
run("Set Measurements...", "area mean standard modal min integrated median redirect=None decimal=4");
run("Measure");
saveAs("Results", path+date+" "+stain+" "+sample+".csv");
run("Clear Results");
run("Select None");

//close();
//close();
//close();
//close();
//close();
