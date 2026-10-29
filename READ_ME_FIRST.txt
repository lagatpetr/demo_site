WHAT IS THIS ITEM?  (v5: Tech Kidz Africa, Human + AI live demo)

THE IDEA
You hold any everyday item up to the webcam. An AI (MobileNet v2, running inside the browser on
your laptop) looks at ONE captured picture and shows its best guess with a percentage, plus its
next two guesses. A person then decides: "Yes, the AI is right" or "No, the AI is wrong" (and
types what the item really is). A log and a score show how often the AI was right and how often a
person had to fix it.

WHAT USES AI:   the guess and the percentage.
WHAT A PERSON DOES:   decides if the guess is right, corrects it, and owns the final answer.

FOLDER CONTENTS (keep everything together)
  AI_Item_Check_Demo.html   the demo page
  lib/tf.min.js             TensorFlow.js 4.22.0
  lib/mobilenet.min.js      @tensorflow-models/mobilenet 2.1.1 (MobileNet v2, ImageNet 1000 classes)
  model/                    the MobileNet v2 model files (YOU add these, see below)
  START_DEMO.bat / .sh      one-click launchers (Windows / Linux-Mac). Needs Python 3.

------------------------------------------------------------------------------------------
GET THE MODEL FILES  (do this ONCE, with internet, before the event)
------------------------------------------------------------------------------------------
The model weights (about 14 MB) could not be bundled in this kit, so model/ starts empty.
The libraries in lib/ are already included and work offline.

Way 1 (recommended, no hunting for links):
 1. With internet on, run START_DEMO.bat (Windows) or ./START_DEMO.sh (Linux/Mac).
 2. The page downloads the official MobileNet v2 model itself. The top-right status reads
    "AI ready · online model".
 3. Press the button "Save model files for offline use". The browser downloads TWO files:
    model.json and model.weights.bin  (allow multiple downloads if asked).
 4. Move BOTH files into the model/ folder of this kit. Stop the server, start it again.
 5. The status must now read "AI ready · offline model". Test with the Wi-Fi switched off.

Way 2 (manual): download the TensorFlow.js version of MobileNet V2 (width 1.0, 224, ImageNet
classification) from TensorFlow Hub / Kaggle Models (search "mobilenet-v2", TensorFlow.js
variant "100-224-classification"). Put model.json and ALL its weight files (group1-shard...)
directly inside model/. Check that it says 1.0 / 224 / classification: other variants give
wrong or no results, and the page refuses files whose output is not 1000 ImageNet classes.
(I could not open those download sites from where this kit was built, so the exact page
address may have moved. Way 1 avoids that problem.)

If both ways fail, the demo still works with internet (online backup). Nothing is faked: if
the AI cannot load at all, the page says so and offers "Retry loading the AI".

------------------------------------------------------------------------------------------
SETUP FOR THE SHOWCASE
------------------------------------------------------------------------------------------
1. Copy the whole folder to the presenting laptop. Install Python 3 if missing.
2. Close any older demo server window (older versions used port 8000; this one uses port 8765).
3. Double-click START_DEMO.bat or run ./START_DEMO.sh. Chrome/Edge opens the demo.
   Keep the server window open during the show.
4. Wait for "AI ready · offline model · WEBGL" (top right). CPU means no graphics acceleration:
   it works but is slower. Allow the camera when asked, or use "Use a photo".
5. Press F for fullscreen. Press Ctrl and minus if the log does not fit your screen.

KEYS
  Space identify   Y yes, the AI is right   N no, the AI is wrong   R reset (press twice)   F fullscreen
  While typing a correction, keys only type; Enter saves, Esc cancels.
  Reset asks twice (R then R, or click twice within 4 seconds) so a stray key cannot wipe the log.

COLOURS
  Blue = something the AI did. Orange = something a person did. Green = confirmed correct. Red = wrong.

HOW A ROUND WORKS
  - The AI only looks at the dashed square on the camera view, and only when you press Identify.
    It does not guess continuously. The exact 224 x 224 picture it used appears beside the result.
  - Under 40% the page says "The AI is not sure" and shows the real percentages anyway.
  - "Discard this picture" throws away a bad capture. Discards are counted on the score card,
    so the numbers stay honest.
  - Accuracy = (times a person said Yes) / (items checked). It judges only the AI's FIRST guess.
  - Refreshing the page clears the log.

------------------------------------------------------------------------------------------
3-MINUTE STAGE SCRIPT
------------------------------------------------------------------------------------------
0:00  "Can a computer tell what this is? Let's ask it. Who has an everyday item?" Take an item from
      a volunteer (a water bottle, a mug, a shoe, a phone).
0:25  Hold it inside the dashed square. Press Space. "Look at what the AI saw: this picture.
      Its guess and how sure it is." Read the name and percentage aloud, then the next two guesses.
0:50  Ask the audience: "Is the AI right?" Take the vote, then press Y or N yourself. "A person decides."
1:10  Second item, ideally something odd or cluttered (a notebook, a hat, a packet of snacks).
      If the AI is wrong: press N, type what it really is. "A person had to fix it."
1:50  Third item: something unusual that is probably NOT among the AI's 1,000 object types.
      Remind the audience out loud that the AI only knows 1,000 object types. If the screen says "The AI is not sure", praise that: "It knows it is
      unsure. That is a good AI. A person decides what happens next."
2:20  Point at the Score card and the log: "AI got N right, people had to fix M. Accuracy P%."
      Say it plainly: a few items is not a scientific test.
2:40  Close: "AI is fast at a first guess. People check, correct and decide. The future of work is
      humans working WITH AI." Press R twice to clear for the next group.

(The AI may get your chosen items right or wrong. Do not promise either. Both outcomes teach the point.)

------------------------------------------------------------------------------------------
BEFORE THE EVENT (10-minute checklist)
------------------------------------------------------------------------------------------
- Run START_DEMO on the SAME laptop, projector and lighting you will use. Status must say
  "offline model" and WEBGL.
- Switch Wi-Fi off and do a full run with your real items. If it works offline, you are safe.
- Practise: plain background, good light, item filling most of the dashed square, hands out of the way.
- Close Zoom/Teams and other tabs that may be holding the camera. Plug the laptop in. Silence notifications.
- Have a few photos of items ready for "Use a photo" in case the camera fails.
- Test your real items beforehand and keep a short list of ones that go well, and one that confuses it.

------------------------------------------------------------------------------------------
HONEST LIMITATIONS
------------------------------------------------------------------------------------------
- The model only knows 1,000 ImageNet categories (many are animals, dog breeds, tools, vehicles).
  Everyday items missing from its list will be matched to the nearest thing it knows, or flagged "not sure".
  There is no category for people, brands or specific products.
- The percentage is how strongly the model favours that label among its 1,000 options. It is not a
  guarantee, and a high percentage can still be wrong.
- It classifies one centre square of one picture. Background, hands, lighting and angle change the answer.
- Names come from the ImageNet list and can sound odd (for example "cellular telephone", "crash helmet").
- The score is a tiny sample judged by one person. It shows how the idea works. It is not a measure of the model.
- Not a production system. Do not describe it as such.

CREDITS / LICENCES
TensorFlow.js and the MobileNet model code are by Google and released under the Apache-2.0 licence
(copy in model/LICENSE-apache-2.0.txt). Check the licence shown on the page you download the model
weights from.
