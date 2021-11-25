//Open a 10X RGB image
run("Duplicate...", " ");
run("Trainable Weka Segmentation");
selectWindow("Trainable Weka Segmentation v3.2.34");
//Doesn't work in macro but perform these steps:
//call("trainableSegmentation.Weka_Segmentation.loadClassifier", "OLIG2 classifier 2.model");
//call("trainableSegmentation.Weka_Segmentation.getProbability");

sample = "XXX";
stain = "XXX";
date = "2021.06.09";
path = "XXX"
selectWindow("Probability maps");
run("Stack to Images");
selectWindow("background");
run("8-bit");
setAutoThreshold("Default bright");
//run("Invert");
run("Convert to Mask");
run("Fill Holes");
run("Watershed");
//run("Invert");
run("Analyze Particles...", "size=20-Infinity pixel exclude add");
//waitForUser("Check");
selectWindow(stain+" "+sample+"_10x.tif");
run("Colour Deconvolution", "vectors=[H DAB]");
selectWindow(stain+" "+sample+"_10x.tif-(Colour_2)"); //Edit to your filename
roiManager("Show All without labels");
//Dialog.create("Quality check");
//Dialog.show();
//waitForUser("Check");
run("Set Measurements...", "area mean min redirect=None decimal=4");
roiManager("Measure");
saveAs("Results", path+date+" "+stain+" "+sample+".csv");
run("Clear Results");
run("Select None");
roiManager("reset");