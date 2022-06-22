# FRAGMENT 6
interactive pastiche of bridget riley's 'untitled (fragment 6)'

# introduction
This is an interactive artwork inspired by 'Untitled (Fragment 6)' by Bridget Riley.
https://www.artsy.net/artwork/bridget-riley-untitled-fragment-6
I learnt this method of OSC application from https://ml4a.github.io/classes/opendot/, a Machine Learning for Artists course taught by Gene Kogan.

# installation
For it to work properly you must install the following programs:
Wekinator by Rebecca Fiebrink http://www.wekinator.org/downloads/
FaceOSC by Kyle McDonald https://github.com/kylemcdonald/ofxFaceTracker/releases

# to run
First, open the FaceOSC application and make sure at the bottom of the webcam window it says "sending OSC to localhost:8338". White lines should appear on your face, this shows that the program is mapping your expression.

Then open the Wekinator applicaton, click File>Open project. Navigate to where this sketch is installed and open a folder called "0.7_surprise". Open the file "0.7_surprise.wekproj". This will open up a pretrained model that is ready to use. In the OSC Input Status window, check that Wekinator is listening for inputs and control on port 8338. Then press Start listening.

Finally, open up the processing sketch itself. Before you start the sketch, press Run in Wekinator.

If everything is working, the sketch should react to how surprised your expression is! Try closing and opening your mouth on camera.

# to modify
If you'd like the sketch to react to a different face expression, you can create a new model farely easily with the Start Recording and Train buttons. This section of a ml4a lecture explains it well: https://www.youtube.com/watch?v=Y3UuIER66FQ&t=4423s&ab_channel=OpenDotFabLab.

If you'd like the sketch to take multiple expressions as input, you can create a new Wekinator project that takes multiple inputs (it's as simple as changing the number from 5 to anything else, you can also name each input for organisation purposes). This guide on the Wekinator website is useful: http://www.wekinator.org/detailed-instructions/#2_Choose_and_run_your_input_and_output_applications
