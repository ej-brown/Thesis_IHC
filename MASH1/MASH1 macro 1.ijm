//Supply the macro with a 20X RGB image

run("Duplicate...", " ");
run("Trainable Weka Segmentation");
selectWindow("Trainable Weka Segmentation v3.2.34");
//This doesn't work as a macro, but these are the steps:
//call("trainableSegmentation.Weka_Segmentation.loadClassifier", "MASH1 classifier 2.model");
//call("trainableSegmentation.Weka_Segmentation.getProbability");

sample = "XXX";
stain = "XXX";
date = "2021.06.08";
path = "XXX"
selectWindow("Probability maps");
run("Stack to Images");
selectWindow("nucleus");
run("8-bit");
setAutoThreshold("Default dark");
//waitForUser("Check");
//run("Invert");
run("Convert to Mask");
//waitForUser("Check");
run("Fill Holes");
//waitForUser("Check");
run("Watershed");
//waitForUser("Check");
//run("Invert");
run("Analyze Particles...", "size=50-Infinity pixel exclude add");
waitForUser("Check");
selectWindow(stain+" "+sample+"_20x.tif"); //Edit to your filename
run("Colour Deconvolution", "vectors=[H DAB]");
selectWindow(stain+" "+sample+"_20x.tif-(Colour_2)"); //Edit to your filename
roiManager("Show All without labels");
Dialog.create("Quality check");
Dialog.show();
run("Set Measurements...", "area mean min redirect=None decimal=4");
roiManager("Measure");
saveAs("Results", path+date+" "+stain+" "+sample+".csv");
//run("Clear Results");
//run("Select None");
//roiManager("reset");
//beep();

//Negative cells = intensity 240-255
//Positive cells = intensity 0-240