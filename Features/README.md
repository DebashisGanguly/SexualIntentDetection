
# SexualIntent.csv (1 dimension: Column B)
<ol>
  <li><b>Y</b>es, definitely sexually provocative (-1)</li>
  <li><b>M</b>aybe, implicit or hidden sexual intentions (0)</li>
  <li><b>N</b>o, casual without any explicit sexual intentions (+1)</li>
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
    <ol>
      <li>Fully Clothed (1)
      <li>Bare bodied (bikini shots or topless) (2)
      <li>Private body parts exposed (3)
    </ol>
  </li>
  <li type = "1"> Scene Context
    <ol>
      <li>Outdoor Scene (natural backdrop of mountain, forest, sea beach, or any place of seclusion) (1)</li>
      <li>Outdoor Event (public places like gym, playground, red carpet, swimming pool etc.) (2)</li>
      <li>Indoor Scene with Props (chairs, couches, curtains, toys etc.) (3)</li>
      <li>Indoor Scene without Props (Flat background) (4)</li>
    </ol>
  </li>
  
  <li>Body <b>P</b>osture
    <ol>
      <li>Straight/Firm (1)</li>
      <li>Body arch (2) </li>
      <li>Crawling (doggy) (3) </li>
      <li>Sitting with folded knees (either stretched or closed)/Frog tie (4) </li>
    </ol>
  </li>
  <li>Body <b>M</b>ovement</li>
  <li><b>B</b>ody Facing Camera</li>
  <li><b>F</b>ace Facing Camera </li>
  <li><b>H</b>ead Position</li>
  <li><b>S</b>pread Eagles</li>
  <li><b>E</b>lbow Pointing</li>
  <li>Position of <b>W</b>rist</li>
  <li><b>G</b>esture with Fingers</li>
  <li><b>L</b>ooking</li>
  <li><b>E</b>yebrow</li>
  <li><b>S</b>mile</li>
  <li>Eyeli<b>d</b>s</li>
  <li><b>M</b>outh</li>
  <li><b>B</b>iting lips</li>
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
