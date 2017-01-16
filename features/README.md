
# GlobalClasses.csv (1 feature: Column B)
<ol>
  <li><b>Y</b>es, definitely sexually provocative (-1)</li>
  <li><b>M</b>aybe, implicit or hidden sexual intentions (0)</li>
  <li><b>N</b>o, casual without any explicit sexual intentions (+1)</li>
</ol>

# PersonalityAttributes.csv (5 features: Columns B - F)
<ol>
  <li><b>D</b>efensive or protective or shy</li>
  <li><b>S</b>uggestive or sly (pretension to be shy)</li>
  <li><b>P</b>layful or naughty or teasing</li>
  <li><b>R</b>elaxed or happy</li>
  <li><b>U</b>pset or annoyed or angry or disgusted</li>
</ol>

# SynatcticalAttributes.csv (17 features: Columns B - R)
<ol>
  <li>Skin Exposure</li>
  <li>Scene Context</li>
  <li>Body <b>P</b>osture</li>
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


# Raw feature descriptors
	## Caffe Net features
  <ol>
    <li>CaffeNet-FC6 (4096 dim)</li>
    <li>CaffeNet-FC7 (4096 dim)</li>
    <li>CaffeNet-FC8 (1000 dim)</li>
  </ol>
  ## Other feature descriptors
  <ol>
    <li>Color hisogram (256 dim)</li>
    <li>HOG (128 dim)</li>
    <li>SIFT hisogram (256 dim)</li>
  </ol>
