//Edit according to your filename:
sample = "XXX";
stain = "XXX";
date = "XXX";
model = "2020.12.30 SDMA weka classifier.model";

//Supply a 10X RGB image of the stain

run("Duplicate...", " ");
run("Trainable Weka Segmentation");
selectWindow("Trainable Weka Segmentation v3.2.34");

//This section doesn't work as a macro, but these are the steps:
//call("trainableSegmentation.Weka_Segmentation.loadClassifier", "2020.12.30 SDMA weka classifier.model");
//call("trainableSegmentation.Weka_Segmentation.getProbability");

selectWindow("Probability maps");
run("Stack to Images");
//close();
//close();
selectWindow("class 2");
run("8-bit");
setAutoThreshold("Default");
//run("Threshold...");
setOption("BlackBackground", false);
run("Convert to Mask");
run("Fill Holes");
run("Watershed");
run("Analyze Particles...", "size=20-Infinity pixel exclude add");
selectWindow(stain+sample+"_10x.tif");
run("Colour Deconvolution", "vectors=[H DAB]");
selectWindow(stain+sample+"_10x.tif-(Colour_2)"); //Edit according to your filename
run("Set Scale...", "distance=100 known=100 pixel=1 unit=µm");
roiManager("Show All without labels");
roiManager("Measure");
saveAs("Results", "+date+stain++sample+" "+model+"results.csv");

//roiManager("reset")
//run("Clear Results");
//close();
//close();
//close();
//close();
//close();