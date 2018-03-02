define($IP 10.10.1.1);
define($MAC 00:00:00:00:01:00);
source :: FromDevice;
sink   :: ToDevice;
c::Classifier(
	63/000A 65/000A,       //CONNECTION START
	63/000A 65/000B,       //CONNECTION START OK
	63/000A 65/001E,       //CONNECTION TUNE
	63/000A 65/001F,       //CONNECTION TUNE OK
	63/000A 65/0028,       //CONNECTION OPEN
	63/000A 65/0029,       //CONNECTION OPEN OK
	63/0014 65/000A,       //CHANNEL OPEN
	63/0014 65/000B,       //CHANNEL OPEN OK
	63/0032 65/000A,       //QUEUE DECLARE
	63/0032 65/000B,       //QUEUE DECLARE OK
	63/003C 65/0014,       //BASIC CONSUME
	63/003C 65/0015,       //BASIC CONSUME OK
	63/003C 65/0028,       //BASIC PUBLISH
	-);

source ->c;
c[0]->Print('CONNECTION START') -> sink;
c[1]->Print('CONNECTION START OK') -> sink;
c[2]->Print('CONNECTION TUNE') -> sink;
c[3]->Print('CONNECTION TUNE OK') -> sink;
c[4]->Print('CONNECTION OPEN') -> sink;
c[5]->Print('CONNECTION OPEN OK') -> sink;
c[6]->Print('CHANNEL OPEN') -> sink;
c[7]->Print('CHANNEL OPEN OK') -> sink;
c[8]->Print('QUEUE DECLARE') -> sink;
c[9]->Print('QUEUE DECLARE OK') -> sink;
c[10]->Print('BASIC CONSUME') -> sink;
c[11]->Print('BASIC CONSUME OK') -> sink;
c[12]->Print('BASIC PUBLISH') -> sink;
c[13]->Print('Others') ->Discard;
