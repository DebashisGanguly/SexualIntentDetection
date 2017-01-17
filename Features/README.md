
# SexualIntent.csv (1 dimension: Column B)
<ol>
  <li><b>Y</b>es, definitely sexually provocative (-1)</li>
  <li><b>M</b>aybe, implicit or hidden sexual intentions (0)</li>
  <li><b>N</b>o, casual without any explicit sexual intentions (1)</li>
</ol>

# Moods_Emotions.csv (5 dimensions: Columns B - F)
<ol>
  <li><b>D</b>efensive or protective or shy</li>
  <li><b>S</b>uggestive or sly (pretension to be shy)</li>
  <li><b>P</b>layful or naughty or teasing</li>
  <li><b>R</b>elaxed or happy</li>
  <li><b>U</b>pset or annoyed or angry or disgusted</li>
</ol>

# Attributes.csv (17 dimensions: Columns B - R)
<ol>
  <li type = "1"> Skin Exposure
    <ul>
      <li>Fully clothed (1) </li>
      <li>Bare bodied (bikini shots or topless) (2)</li>
      <li>Private body parts exposed (3)</li>
    </ul>
  </li>
  <li type = "1"> Scene Context
    <ul>
      <li>Outdoor scene (natural backdrop of mountain, forest, sea beach, or any place of seclusion) (1)</li>
      <li>Outdoor event (public places like gym, playground, red carpet, swimming pool etc.) (2)</li>
      <li>Indoor scene with props (chairs, couches, curtains, toys etc.) (3)</li>
      <li>Indoor scene without props (Flat background) (4)</li>
    </ul>
  </li>
  
  <li>Body <b>P</b>osture
    <ul>
      <li>Straight/Firm (1)</li>
      <li>Body arch (2)</li>
      <li>Crawling (doggy) (3)</li>
      <li>Sitting with folded knees (either stretched or closed)/Frog tie (4)</li>
    </ul>
  </li>
  <li>Body <b>M</b>ovement
    <ul>
      <li>Standing (1)</li>
      <li>Sitting (2)</li>
      <li>Lying (3)</li>
      <li>Walking/Running (4)</li>
    </ul>
  </li>
  
  <li><b>B</b>ody Facing Camera
    <ul>
      <li>Away (0)</li>
      <li>Towards (1)</li>
    </ul>
  </li>
  <li><b>F</b>ace Facing Camera
    <ul>
      <li>Away (0)</li>
      <li>Towards (1)</li>
    </ul>
  </li>
  
  <li><b>H</b>ead Position
    <ul>
      <li>Straight (0)</li>
      <li>Tilted Up (1)</li>
      <li>Tilted down (2)</li>
    </ul>
  </li>
  
  <li><b>S</b>pread Eagles
    <ul>
      <li>Not Applicable (0)</li>
      <li>Hands (1)</li>
      <li>Legs (2)</li>
    </ul>
  </li>
  
  <li><b>E</b>lbow Pointing
    <ul>
      <li>Not applicable (0)</li>
      <li>Up (1)</li>
      <li>Down (2)</li>
    </ul>
  </li>
  
  <li>Position of <b>W</b>rist
    <ul>
      <li>Straight or Not applicable (0)</li>
      <li>Bent and covering private upper/lower body part (groping/lowering undergarments) (1)</li>
      <li>Hands crossed fully (e.g. covering chest, wrists under armpit) (2)</li>
    </ul>
  </li>
  
  <li><b>G</b>esture with Fingers
    <ul>
      <li>No (0)</li>
      <li>Yes (1)</li>
    </ul>
  </li>
  
  <li><b>L</b>ooking
    <ul>
      <li>Away (0)</li>
      <li>Straight (1)</li>
      <li>Up (2)</li>
      <li>Down (3)</li>
    </ul>
  </li>
  
  <li><b>E</b>yebrow
      <ul>
      <li>Straight/Normal (1)</li>
      <li>Frowning (2)</li>
      <li>Raised Up(3)</li>
    </ul>
  </li>
  <li><b>S</b>mile
    <ul>
      <li>Not smiling (0)</li>
      <li>Duchenne (1)</li>
      <li>Non-Duchenne (2)</li>
    </ul>
  </li>
  <li>Eyeli<b>d</b>s
    <ul>
      <li>Close (0)</li>
      <li>Fully/Wide open (1)</li>
      <li>Shrunk (2)</li>
      <li>Wink (3)</li>
    </ul>
  </li>
  <li><b>M</b>outh
    <ul>
      <li>Close (0)</li>
      <li>Open (1)</li>
    </ul>
  </li>
  <li><b>B</b>iting lips
    <ul>
      <li>No (0)</li>
      <li>Yes (1)</li>
    </ul>
  </li>
</ol>

# Extraction of features 
<p> The SexualIntent.csv, Moods_Emotions.csv, and Attributes.csv are created from download.csv, which is the raw annotation collected from Amazon Mechanical Turk, upon taking majority votes on annotators' labels.</p>

# Automatically extracted features
# Caffe Net features
<ol>
  <li>CaffeNet-FC6 (4096 dimensions)</li>
  <li>CaffeNet-FC7 (4096 dimensions)</li>
  <li>CaffeNet-FC8 (1000 dimensions)</li>
</ol>
# Low level features
<ol>
  <li>Color hisogram (256 dimensions)</li>
  <li>HOG (128 dimensions)</li>
  <li>SIFT hisogram (256 dimensions)</li>
</ol>
