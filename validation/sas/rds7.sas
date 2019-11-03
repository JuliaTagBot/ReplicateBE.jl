DATA pkdata;
infile datalines dlm="," truncover;
input subject $ formulation $ period $sequence $ var;
datalines;
1,T,1,TRT,0.5041551126854689
1,R,2,TRT,1.1260085330085836
1,T,3,TRT,1.4960484763323922
2,T,1,TRT,0.2491896091801702
2,R,2,TRT,0.773814811568403
2,T,3,TRT,0.7166452496823865
3,T,1,TRT,2.2886656076563305
3,R,2,TRT,1.98060608193977
3,T,3,TRT,2.105464630468507
4,T,1,TRT,-0.6346733600818621
4,R,2,TRT,-0.05340069138417669
4,T,3,TRT,-0.3412522412975205
5,T,1,TRT,1.6586000950254984
5,R,2,TRT,0.7218087027269445
5,T,3,TRT,1.233101135153932
6,T,1,TRT,1.0736329787742802
6,R,2,TRT,1.6480153508663835
6,T,3,TRT,0.9778895438255089
7,T,1,TRT,1.1401508843950823
7,R,2,TRT,0.7346571867116494
7,T,3,TRT,0.534227869205113
8,T,1,TRT,1.2953710450565745
8,R,2,TRT,1.9527017442858463
8,T,3,TRT,2.1076476885514275
9,T,1,TRT,1.345486851037357
9,R,2,TRT,0.3671822801273781
9,T,3,TRT,1.3166981603666843
10,T,1,TRT,1.1637001019133537
10,R,2,TRT,0.16240271161112307
10,T,3,TRT,1.5477450740881138
11,T,1,TRT,0.463442602425403
11,R,2,TRT,1.6922389790278278
11,T,3,TRT,1.213544838802805
12,T,1,TRT,0.37335636841246644
12,R,2,TRT,0.81310337025439
12,T,3,TRT,-0.12154781296586137
13,R,1,RTR,0.5679169320789621
13,T,2,RTR,0.6760963740555147
13,R,3,RTR,0.782086226998022
14,R,1,RTR,2.7166457426899724
14,T,2,RTR,2.285103969323787
14,R,3,RTR,2.1797951130872395
15,R,1,RTR,1.5505657456194049
15,T,2,RTR,1.0582762982190728
15,R,3,RTR,0.3428098826242857
16,R,1,RTR,1.9343962046400467
16,T,2,RTR,1.4383315127329985
16,R,3,RTR,1.9702147277104067
17,R,1,RTR,0.8758485547212159
17,T,2,RTR,1.1907325819359578
17,R,3,RTR,1.9832081897002016
18,R,1,RTR,1.0732486145797095
18,T,2,RTR,2.7158187074278746
18,R,3,RTR,1.2661141907918672
19,R,1,RTR,1.962211705822481
19,T,2,RTR,2.172757910108546
19,R,3,RTR,1.7977254691583702
20,R,1,RTR,1.6166636352184556
20,T,2,RTR,1.7769931624742827
20,R,3,RTR,1.8347556867318966
21,R,1,RTR,1.1365553068124492
21,T,2,RTR,0.758429721956438
21,R,3,RTR,0.6681463048605558
22,R,1,RTR,2.0502134466928768
22,T,2,RTR,1.86387770794578
22,R,3,RTR,1.6963972878464144
23,R,1,RTR,0.7289956775583537
23,T,2,RTR,0.5145875231505521
23,R,3,RTR,1.7498154028624224
24,R,1,RTR,-0.15278483942498444
24,T,2,RTR,0.7528271422336862
24,R,3,RTR,0.8605710954512671
;
RUN;

PROC MIXED data=pkdata; 
CLASSES subject sequence period formulation;
MODEL  var = sequence period formulation/ DDFM=SATTERTH;
CONTRAST 'CONTR' formulation    1 -1; 
RANDOM  formulation/TYPE=CSH SUB=subject;
REPEATED/GRP=formulation SUB=subject;
ESTIMATE 'T vs. R' formulation 1 -1/CL ALPHA=0.1 E;
RUN;