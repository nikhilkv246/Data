define($IP 10.10.1.1);
define($MAC 00:00:00:00:01:00);
source :: FromDevice;
sink   :: ToDevice;
c::Classifier(
	66/10,    	 //CONNECT(Header Flag)
	66/20,	 	 //CONNECT ACK
	66/30, 		 //PUBLISH DISCONNECT REQUEST
	66/31, 		 //PUBLISH
	66/40, 		 //PUBLISH ACK
	66/50, 		 //PUBLISH RECEIVED
	66/60, 		 //PUBLISH RELEASE
	66/70, 		 //PUBLISH COMPLETE
	66/82, 		 //SUBSCRIBE REQUEST
	66/90, 		 //SUBSCRIBE ACK
	66/A0, 		 //UNSUBSCRIBE
	66/B0, 		 //UNSUBSCRIBE ACK
	66/C0, 		 //PING REQUEST
	66/D0, 		 //PING RESPONSE
	66/E0, 		 //DISCONNECT
	-);

source ->c;
c[0]->Print('CONNECT') -> sink;
c[1]->Print('CONNECT ACK') -> sink;
c[2]->Print('PUBLISH DISCONNECT REQUEST') -> sink;
c[3]->Print('PUBLISH MESSAGE') -> sink;
c[4]->Print('PUBLISH ACK') -> sink;
c[5]->Print('PUBLISH RECEIVED') -> sink;
c[6]->Print('PUBLISH RELEASE') -> sink;
c[7]->Print('PUBLISH COMPLETE') -> sink;
c[8]->Print('SUBSCRIBE REQUEST') -> sink;
c[9]->Print('SUBSCRIBE ACK') -> sink;
c[10]->Print('UNSUBSCRIBE') -> sink;
c[11]->Print('UNSUBSCRIBE ACK') -> sink;
c[12]->Print('PING REQUEST') -> sink;
c[13]->Print('PING RESPONSE') -> sink;
c[14]->Print('DISCONNECT') -> sink;
c[15]->Print('Others') ->Discard;
