//Supply macro with a 10X RGB image of the stain

run("Duplicate...", " ");
run("Trainable Weka Segmentation");
selectWindow("Trainable Weka Segmentation v3.2.34");

//This part of the macro doesn't work but these are the steps:
//call("trainableSegmentation.Weka_Segmentation.loadClassifier", "2021.02.10 HuNucAg classifier 4.model");
//call("trainableSegmentation.Weka_Segmentation.getProbability");

//Edit according to your filenames
sample = "XXX";
stain = "XXX";
date = "XXX";
//model = "HuNucAg classifier 4";

selectWindow(stain+sample+"_10x.tif"); //Edit according to your filename
run("Duplicate...", " ");
selectWindow("Probability maps");
run("Stack to Images");
//close();
//close();
selectWindow("Brown nuclei");
run("8-bit");
setAutoThreshold("Default");
//run("Threshold...");
setOption("BlackBackground", false);
run("Convert to Mask");
run("Invert");
run("Watershed");
run("Analyze Particles...", "size=20-Infinity pixel exclude add");
selectWindow(stain+sample+"_10x.tif"); //Edit according to your filename
run("Colour Deconvolution", "vectors=[H DAB]");
selectWindow(stain+sample+"_10x.tif-(Colour_2)"); //Edit according to your filename
run("Set Scale...", "distance=100 known=100 pixel=1 unit=µm");
roiManager("Show All without labels");
run("Set Measurements...", "area mean min perimeter shape feret's redirect=None decimal=3");
roiManager("Measure");
waitForUser("Okay to save?");
saveAs("Results", date+stain+sample+" brown nuclei.csv");
roiManager("reset")
run("Clear Results");
selectWindow("Blue nuclei");
run("8-bit");
setAutoThreshold("Default");
//run("Threshold...");
setOption("BlackBackground", true);
run("Convert to Mask");
//run("Fill Holes");
run("Invert");
run("Watershed");
run("Analyze Particles...", "size=20-Infinity pixel exclude add");
selectWindow(stain+sample+"_10x-2.tif"); //Edit according to filename
//run("Colour Deconvolution", "vectors=[H DAB]");
//selectWindow(stain+sample+"_10x.tif-(Colour_2)");
run("Set Scale...", "distance=100 known=100 pixel=1 unit=µm");
roiManager("Show All without labels");
run("Set Measurements...", "area mean min perimeter shape feret's redirect=None decimal=3");
roiManager("Measure");
saveAs("Results", date+stain+sample+" blue nuclei.csv");

roiManager("reset")
run("Clear Results");
close();
close();
close();
close();
close();