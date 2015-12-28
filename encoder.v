module encoder
#(parameter WIDTH = 600)(
	encoder_in	,	//  600-bit Input
	binary_out		//  7 bit binary Output
);
	output [9:0] binary_out  ;
	input [WIDTH - 1:0] encoder_in ;
	
	assign binary_out  =(encoder_in[  0]) ? 10'd0: ( 
						(encoder_in[  1]) ? 10'd1: 
						(encoder_in[  2]) ? 10'd2: 
						(encoder_in[  3]) ? 10'd3: 
						(encoder_in[  4]) ? 10'd4: 
						(encoder_in[  5]) ? 10'd5: 
						(encoder_in[  6]) ? 10'd6: 
						(encoder_in[  7]) ? 10'd7: 
						(encoder_in[  8]) ? 10'd8: 
						(encoder_in[  9]) ? 10'd9: 
						(encoder_in[ 10]) ? 10'd10: 
						(encoder_in[ 11]) ? 10'd11: 
						(encoder_in[ 12]) ? 10'd12: 
						(encoder_in[ 13]) ? 10'd13: 
						(encoder_in[ 14]) ? 10'd14: 
						(encoder_in[ 15]) ? 10'd15: 
						(encoder_in[ 16]) ? 10'd16: 
						(encoder_in[ 17]) ? 10'd17: 
						(encoder_in[ 18]) ? 10'd18: 
						(encoder_in[ 19]) ? 10'd19: 
						(encoder_in[ 20]) ? 10'd20: 
						(encoder_in[ 21]) ? 10'd21: 
						(encoder_in[ 22]) ? 10'd22: 
						(encoder_in[ 23]) ? 10'd23: 
						(encoder_in[ 24]) ? 10'd24: 
						(encoder_in[ 25]) ? 10'd25: 
						(encoder_in[ 26]) ? 10'd26: 
						(encoder_in[ 27]) ? 10'd27: 
						(encoder_in[ 28]) ? 10'd28: 
						(encoder_in[ 29]) ? 10'd29: 
						(encoder_in[ 30]) ? 10'd30: 
						(encoder_in[ 31]) ? 10'd31: 
						(encoder_in[ 32]) ? 10'd32: 
						(encoder_in[ 33]) ? 10'd33: 
						(encoder_in[ 34]) ? 10'd34: 
						(encoder_in[ 35]) ? 10'd35: 
						(encoder_in[ 36]) ? 10'd36: 
						(encoder_in[ 37]) ? 10'd37: 
						(encoder_in[ 38]) ? 10'd38: 
						(encoder_in[ 39]) ? 10'd39: 
						(encoder_in[ 40]) ? 10'd40: 
						(encoder_in[ 41]) ? 10'd41: 
						(encoder_in[ 42]) ? 10'd42: 
						(encoder_in[ 43]) ? 10'd43: 
						(encoder_in[ 44]) ? 10'd44: 
						(encoder_in[ 45]) ? 10'd45: 
						(encoder_in[ 46]) ? 10'd46: 
						(encoder_in[ 47]) ? 10'd47: 
						(encoder_in[ 48]) ? 10'd48: 
						(encoder_in[ 49]) ? 10'd49:  
						(encoder_in[ 50]) ? 10'd50: 
						(encoder_in[ 51]) ? 10'd51: 
						(encoder_in[ 52]) ? 10'd52: 
						(encoder_in[ 53]) ? 10'd53: 
						(encoder_in[ 54]) ? 10'd54: 
						(encoder_in[ 55]) ? 10'd55: 
						(encoder_in[ 56]) ? 10'd56: 
						(encoder_in[ 57]) ? 10'd57: 
						(encoder_in[ 58]) ? 10'd58: 
						(encoder_in[ 59]) ? 10'd59: 
						(encoder_in[ 60]) ? 10'd60: 
						(encoder_in[ 61]) ? 10'd61: 
						(encoder_in[ 62]) ? 10'd62: 
						(encoder_in[ 63]) ? 10'd63: 
						(encoder_in[ 64]) ? 10'd64: 
						(encoder_in[ 65]) ? 10'd65: 
						(encoder_in[ 66]) ? 10'd66: 
						(encoder_in[ 67]) ? 10'd67: 
						(encoder_in[ 68]) ? 10'd68: 
						(encoder_in[ 69]) ? 10'd69: 
						(encoder_in[ 70]) ? 10'd70: 
						(encoder_in[ 71]) ? 10'd71: 
						(encoder_in[ 72]) ? 10'd72: 
						(encoder_in[ 73]) ? 10'd73: 
						(encoder_in[ 74]) ? 10'd74: 
						(encoder_in[ 75]) ? 10'd75: 
						(encoder_in[ 76]) ? 10'd76: 
						(encoder_in[ 77]) ? 10'd77: 
						(encoder_in[ 78]) ? 10'd78: 
						(encoder_in[ 79]) ? 10'd79: 
						(encoder_in[ 80]) ? 10'd80: 
						(encoder_in[ 81]) ? 10'd81: 
						(encoder_in[ 82]) ? 10'd82: 
						(encoder_in[ 83]) ? 10'd83: 
						(encoder_in[ 84]) ? 10'd84: 
						(encoder_in[ 85]) ? 10'd85: 
						(encoder_in[ 86]) ? 10'd86: 
						(encoder_in[ 87]) ? 10'd87: 
						(encoder_in[ 88]) ? 10'd88: 
						(encoder_in[ 89]) ? 10'd89: 
						(encoder_in[ 90]) ? 10'd90: 
						(encoder_in[ 91]) ? 10'd91: 
						(encoder_in[ 92]) ? 10'd92: 
						(encoder_in[ 93]) ? 10'd93: 
						(encoder_in[ 94]) ? 10'd94: 
						(encoder_in[ 95]) ? 10'd95: 
						(encoder_in[ 96]) ? 10'd96: 
						(encoder_in[ 97]) ? 10'd97: 
						(encoder_in[ 98]) ? 10'd98: 
						(encoder_in[ 99]) ? 10'd99:  
						(encoder_in[100]) ? 10'd100: 
						(encoder_in[101]) ? 10'd101: 
						(encoder_in[102]) ? 10'd102: 
						(encoder_in[103]) ? 10'd103: 
						(encoder_in[104]) ? 10'd104: 
						(encoder_in[105]) ? 10'd105: 
						(encoder_in[106]) ? 10'd106: 
						(encoder_in[107]) ? 10'd107: 
						(encoder_in[108]) ? 10'd108: 
						(encoder_in[109]) ? 10'd109: 
						(encoder_in[110]) ? 10'd110: 
						(encoder_in[111]) ? 10'd111: 
						(encoder_in[112]) ? 10'd112: 
						(encoder_in[113]) ? 10'd113: 
						(encoder_in[114]) ? 10'd114: 
						(encoder_in[115]) ? 10'd115: 
						(encoder_in[116]) ? 10'd116: 
						(encoder_in[117]) ? 10'd117: 
						(encoder_in[118]) ? 10'd118: 
						(encoder_in[119]) ? 10'd119: 
						(encoder_in[120]) ? 10'd120: 
						(encoder_in[121]) ? 10'd121: 
						(encoder_in[122]) ? 10'd122: 
						(encoder_in[123]) ? 10'd123: 
						(encoder_in[124]) ? 10'd124: 
						(encoder_in[125]) ? 10'd125: 
						(encoder_in[126]) ? 10'd126: 
						(encoder_in[127]) ? 10'd127: 
						(encoder_in[128]) ? 10'd128: 
						(encoder_in[129]) ? 10'd129: 
						(encoder_in[130]) ? 10'd130: 
						(encoder_in[131]) ? 10'd131: 
						(encoder_in[132]) ? 10'd132: 
						(encoder_in[133]) ? 10'd133: 
						(encoder_in[134]) ? 10'd134: 
						(encoder_in[135]) ? 10'd135: 
						(encoder_in[136]) ? 10'd136: 
						(encoder_in[137]) ? 10'd137: 
						(encoder_in[138]) ? 10'd138: 
						(encoder_in[139]) ? 10'd139: 
						(encoder_in[140]) ? 10'd140: 
						(encoder_in[141]) ? 10'd141: 
						(encoder_in[142]) ? 10'd142: 
						(encoder_in[143]) ? 10'd143: 
						(encoder_in[144]) ? 10'd144: 
						(encoder_in[145]) ? 10'd145: 
						(encoder_in[146]) ? 10'd146: 
						(encoder_in[147]) ? 10'd147: 
						(encoder_in[148]) ? 10'd148: 
						(encoder_in[149]) ? 10'd149:  
						(encoder_in[150]) ? 10'd150: 
						(encoder_in[151]) ? 10'd151: 
						(encoder_in[152]) ? 10'd152: 
						(encoder_in[153]) ? 10'd153: 
						(encoder_in[154]) ? 10'd154: 
						(encoder_in[155]) ? 10'd155: 
						(encoder_in[156]) ? 10'd156: 
						(encoder_in[157]) ? 10'd157: 
						(encoder_in[158]) ? 10'd158: 
						(encoder_in[159]) ? 10'd159: 
						(encoder_in[160]) ? 10'd160: 
						(encoder_in[161]) ? 10'd161: 
						(encoder_in[162]) ? 10'd162: 
						(encoder_in[163]) ? 10'd163: 
						(encoder_in[164]) ? 10'd164: 
						(encoder_in[165]) ? 10'd165: 
						(encoder_in[166]) ? 10'd166: 
						(encoder_in[167]) ? 10'd167: 
						(encoder_in[168]) ? 10'd168: 
						(encoder_in[169]) ? 10'd169: 
						(encoder_in[170]) ? 10'd170: 
						(encoder_in[171]) ? 10'd171: 
						(encoder_in[172]) ? 10'd172: 
						(encoder_in[173]) ? 10'd173: 
						(encoder_in[174]) ? 10'd174: 
						(encoder_in[175]) ? 10'd175: 
						(encoder_in[176]) ? 10'd176: 
						(encoder_in[177]) ? 10'd177: 
						(encoder_in[178]) ? 10'd178: 
						(encoder_in[179]) ? 10'd179: 
						(encoder_in[180]) ? 10'd180: 
						(encoder_in[181]) ? 10'd181: 
						(encoder_in[182]) ? 10'd182: 
						(encoder_in[183]) ? 10'd183: 
						(encoder_in[184]) ? 10'd184: 
						(encoder_in[185]) ? 10'd185: 
						(encoder_in[186]) ? 10'd186: 
						(encoder_in[187]) ? 10'd187: 
						(encoder_in[188]) ? 10'd188: 
						(encoder_in[189]) ? 10'd189: 
						(encoder_in[190]) ? 10'd190: 
						(encoder_in[191]) ? 10'd191: 
						(encoder_in[192]) ? 10'd192: 
						(encoder_in[193]) ? 10'd193: 
						(encoder_in[194]) ? 10'd194: 
						(encoder_in[195]) ? 10'd195: 
						(encoder_in[196]) ? 10'd196: 
						(encoder_in[197]) ? 10'd197: 
						(encoder_in[198]) ? 10'd198: 
						(encoder_in[199]) ? 10'd199:  
						(encoder_in[200]) ? 10'd200: 
						(encoder_in[201]) ? 10'd201: 
						(encoder_in[202]) ? 10'd202: 
						(encoder_in[203]) ? 10'd203: 
						(encoder_in[204]) ? 10'd204: 
						(encoder_in[205]) ? 10'd205: 
						(encoder_in[206]) ? 10'd206: 
						(encoder_in[207]) ? 10'd207: 
						(encoder_in[208]) ? 10'd208: 
						(encoder_in[209]) ? 10'd209: 
						(encoder_in[210]) ? 10'd210: 
						(encoder_in[211]) ? 10'd211: 
						(encoder_in[212]) ? 10'd212: 
						(encoder_in[213]) ? 10'd213: 
						(encoder_in[214]) ? 10'd214: 
						(encoder_in[215]) ? 10'd215: 
						(encoder_in[216]) ? 10'd216: 
						(encoder_in[217]) ? 10'd217: 
						(encoder_in[218]) ? 10'd218: 
						(encoder_in[219]) ? 10'd219: 
						(encoder_in[220]) ? 10'd220: 
						(encoder_in[221]) ? 10'd221: 
						(encoder_in[222]) ? 10'd222: 
						(encoder_in[223]) ? 10'd223: 
						(encoder_in[224]) ? 10'd224: 
						(encoder_in[225]) ? 10'd225: 
						(encoder_in[226]) ? 10'd226: 
						(encoder_in[227]) ? 10'd227: 
						(encoder_in[228]) ? 10'd228: 
						(encoder_in[229]) ? 10'd229: 
						(encoder_in[230]) ? 10'd230: 
						(encoder_in[231]) ? 10'd231: 
						(encoder_in[232]) ? 10'd232: 
						(encoder_in[233]) ? 10'd233: 
						(encoder_in[234]) ? 10'd234: 
						(encoder_in[235]) ? 10'd235: 
						(encoder_in[236]) ? 10'd236: 
						(encoder_in[237]) ? 10'd237: 
						(encoder_in[238]) ? 10'd238: 
						(encoder_in[239]) ? 10'd239: 
						(encoder_in[240]) ? 10'd240: 
						(encoder_in[241]) ? 10'd241: 
						(encoder_in[242]) ? 10'd242: 
						(encoder_in[243]) ? 10'd243: 
						(encoder_in[244]) ? 10'd244: 
						(encoder_in[245]) ? 10'd245: 
						(encoder_in[246]) ? 10'd246: 
						(encoder_in[247]) ? 10'd247: 
						(encoder_in[248]) ? 10'd248: 
						(encoder_in[249]) ? 10'd249:  
						(encoder_in[250]) ? 10'd250: 
						(encoder_in[251]) ? 10'd251: 
						(encoder_in[252]) ? 10'd252: 
						(encoder_in[253]) ? 10'd253: 
						(encoder_in[254]) ? 10'd254: 
						(encoder_in[255]) ? 10'd255: 
						(encoder_in[256]) ? 10'd256: 
						(encoder_in[257]) ? 10'd257: 
						(encoder_in[258]) ? 10'd258: 
						(encoder_in[259]) ? 10'd259: 
						(encoder_in[260]) ? 10'd260: 
						(encoder_in[261]) ? 10'd261: 
						(encoder_in[262]) ? 10'd262: 
						(encoder_in[263]) ? 10'd263: 
						(encoder_in[264]) ? 10'd264: 
						(encoder_in[265]) ? 10'd265: 
						(encoder_in[266]) ? 10'd266: 
						(encoder_in[267]) ? 10'd267: 
						(encoder_in[268]) ? 10'd268: 
						(encoder_in[269]) ? 10'd269: 
						(encoder_in[270]) ? 10'd270: 
						(encoder_in[271]) ? 10'd271: 
						(encoder_in[272]) ? 10'd272: 
						(encoder_in[273]) ? 10'd273: 
						(encoder_in[274]) ? 10'd274: 
						(encoder_in[275]) ? 10'd275: 
						(encoder_in[276]) ? 10'd276: 
						(encoder_in[277]) ? 10'd277: 
						(encoder_in[278]) ? 10'd278: 
						(encoder_in[279]) ? 10'd279: 
						(encoder_in[280]) ? 10'd280: 
						(encoder_in[281]) ? 10'd281: 
						(encoder_in[282]) ? 10'd282: 
						(encoder_in[283]) ? 10'd283: 
						(encoder_in[284]) ? 10'd284: 
						(encoder_in[285]) ? 10'd285: 
						(encoder_in[286]) ? 10'd286: 
						(encoder_in[287]) ? 10'd287: 
						(encoder_in[288]) ? 10'd288: 
						(encoder_in[289]) ? 10'd289: 
						(encoder_in[290]) ? 10'd290: 
						(encoder_in[291]) ? 10'd291: 
						(encoder_in[292]) ? 10'd292: 
						(encoder_in[293]) ? 10'd293: 
						(encoder_in[294]) ? 10'd294: 
						(encoder_in[295]) ? 10'd295: 
						(encoder_in[296]) ? 10'd296: 
						(encoder_in[297]) ? 10'd297: 
						(encoder_in[298]) ? 10'd298: 
						(encoder_in[299]) ? 10'd299:  
						(encoder_in[300]) ? 10'd300: 
						(encoder_in[301]) ? 10'd301: 
						(encoder_in[302]) ? 10'd302: 
						(encoder_in[303]) ? 10'd303: 
						(encoder_in[304]) ? 10'd304: 
						(encoder_in[305]) ? 10'd305: 
						(encoder_in[306]) ? 10'd306: 
						(encoder_in[307]) ? 10'd307: 
						(encoder_in[308]) ? 10'd308: 
						(encoder_in[309]) ? 10'd309: 
						(encoder_in[310]) ? 10'd310: 
						(encoder_in[311]) ? 10'd311: 
						(encoder_in[312]) ? 10'd312: 
						(encoder_in[313]) ? 10'd313: 
						(encoder_in[314]) ? 10'd314: 
						(encoder_in[315]) ? 10'd315: 
						(encoder_in[316]) ? 10'd316: 
						(encoder_in[317]) ? 10'd317: 
						(encoder_in[318]) ? 10'd318: 
						(encoder_in[319]) ? 10'd319: 
						(encoder_in[320]) ? 10'd320: 
						(encoder_in[321]) ? 10'd321: 
						(encoder_in[322]) ? 10'd322: 
						(encoder_in[323]) ? 10'd323: 
						(encoder_in[324]) ? 10'd324: 
						(encoder_in[325]) ? 10'd325: 
						(encoder_in[326]) ? 10'd326: 
						(encoder_in[327]) ? 10'd327: 
						(encoder_in[328]) ? 10'd328: 
						(encoder_in[329]) ? 10'd329: 
						(encoder_in[330]) ? 10'd330: 
						(encoder_in[331]) ? 10'd331: 
						(encoder_in[332]) ? 10'd332: 
						(encoder_in[333]) ? 10'd333: 
						(encoder_in[334]) ? 10'd334: 
						(encoder_in[335]) ? 10'd335: 
						(encoder_in[336]) ? 10'd336: 
						(encoder_in[337]) ? 10'd337: 
						(encoder_in[338]) ? 10'd338: 
						(encoder_in[339]) ? 10'd339: 
						(encoder_in[340]) ? 10'd340: 
						(encoder_in[341]) ? 10'd341: 
						(encoder_in[342]) ? 10'd342: 
						(encoder_in[343]) ? 10'd343: 
						(encoder_in[344]) ? 10'd344: 
						(encoder_in[345]) ? 10'd345: 
						(encoder_in[346]) ? 10'd346: 
						(encoder_in[347]) ? 10'd347: 
						(encoder_in[348]) ? 10'd348: 
						(encoder_in[349]) ? 10'd349:  
						(encoder_in[350]) ? 10'd350: 
						(encoder_in[351]) ? 10'd351: 
						(encoder_in[352]) ? 10'd352: 
						(encoder_in[353]) ? 10'd353: 
						(encoder_in[354]) ? 10'd354: 
						(encoder_in[355]) ? 10'd355: 
						(encoder_in[356]) ? 10'd356: 
						(encoder_in[357]) ? 10'd357: 
						(encoder_in[358]) ? 10'd358: 
						(encoder_in[359]) ? 10'd359: 
						(encoder_in[360]) ? 10'd360: 
						(encoder_in[361]) ? 10'd361: 
						(encoder_in[362]) ? 10'd362: 
						(encoder_in[363]) ? 10'd363: 
						(encoder_in[364]) ? 10'd364: 
						(encoder_in[365]) ? 10'd365: 
						(encoder_in[366]) ? 10'd366: 
						(encoder_in[367]) ? 10'd367: 
						(encoder_in[368]) ? 10'd368: 
						(encoder_in[369]) ? 10'd369: 
						(encoder_in[370]) ? 10'd370: 
						(encoder_in[371]) ? 10'd371: 
						(encoder_in[372]) ? 10'd372: 
						(encoder_in[373]) ? 10'd373: 
						(encoder_in[374]) ? 10'd374: 
						(encoder_in[375]) ? 10'd375: 
						(encoder_in[376]) ? 10'd376: 
						(encoder_in[377]) ? 10'd377: 
						(encoder_in[378]) ? 10'd378: 
						(encoder_in[379]) ? 10'd379: 
						(encoder_in[380]) ? 10'd380: 
						(encoder_in[381]) ? 10'd381: 
						(encoder_in[382]) ? 10'd382: 
						(encoder_in[383]) ? 10'd383: 
						(encoder_in[384]) ? 10'd384: 
						(encoder_in[385]) ? 10'd385: 
						(encoder_in[386]) ? 10'd386: 
						(encoder_in[387]) ? 10'd387: 
						(encoder_in[388]) ? 10'd388: 
						(encoder_in[389]) ? 10'd389: 
						(encoder_in[390]) ? 10'd390: 
						(encoder_in[391]) ? 10'd391: 
						(encoder_in[392]) ? 10'd392: 
						(encoder_in[393]) ? 10'd393: 
						(encoder_in[394]) ? 10'd394: 
						(encoder_in[395]) ? 10'd395: 
						(encoder_in[396]) ? 10'd396: 
						(encoder_in[397]) ? 10'd397: 
						(encoder_in[398]) ? 10'd398: 
						(encoder_in[399]) ? 10'd399:  
						(encoder_in[400]) ? 10'd400: 
						(encoder_in[401]) ? 10'd401: 
						(encoder_in[402]) ? 10'd402: 
						(encoder_in[403]) ? 10'd403: 
						(encoder_in[404]) ? 10'd404: 
						(encoder_in[405]) ? 10'd405: 
						(encoder_in[406]) ? 10'd406: 
						(encoder_in[407]) ? 10'd407: 
						(encoder_in[408]) ? 10'd408: 
						(encoder_in[409]) ? 10'd409: 
						(encoder_in[410]) ? 10'd410: 
						(encoder_in[411]) ? 10'd411: 
						(encoder_in[412]) ? 10'd412: 
						(encoder_in[413]) ? 10'd413: 
						(encoder_in[414]) ? 10'd414: 
						(encoder_in[415]) ? 10'd415: 
						(encoder_in[416]) ? 10'd416: 
						(encoder_in[417]) ? 10'd417: 
						(encoder_in[418]) ? 10'd418: 
						(encoder_in[419]) ? 10'd419: 
						(encoder_in[420]) ? 10'd420: 
						(encoder_in[421]) ? 10'd421: 
						(encoder_in[422]) ? 10'd422: 
						(encoder_in[423]) ? 10'd423: 
						(encoder_in[424]) ? 10'd424: 
						(encoder_in[425]) ? 10'd425: 
						(encoder_in[426]) ? 10'd426: 
						(encoder_in[427]) ? 10'd427: 
						(encoder_in[428]) ? 10'd428: 
						(encoder_in[429]) ? 10'd429: 
						(encoder_in[430]) ? 10'd430: 
						(encoder_in[431]) ? 10'd431: 
						(encoder_in[432]) ? 10'd432: 
						(encoder_in[433]) ? 10'd433: 
						(encoder_in[434]) ? 10'd434: 
						(encoder_in[435]) ? 10'd435: 
						(encoder_in[436]) ? 10'd436: 
						(encoder_in[437]) ? 10'd437: 
						(encoder_in[438]) ? 10'd438: 
						(encoder_in[439]) ? 10'd439: 
						(encoder_in[440]) ? 10'd440: 
						(encoder_in[441]) ? 10'd441: 
						(encoder_in[442]) ? 10'd442: 
						(encoder_in[443]) ? 10'd443: 
						(encoder_in[444]) ? 10'd444: 
						(encoder_in[445]) ? 10'd445: 
						(encoder_in[446]) ? 10'd446: 
						(encoder_in[447]) ? 10'd447: 
						(encoder_in[448]) ? 10'd448: 
						(encoder_in[449]) ? 10'd449:  
						(encoder_in[450]) ? 10'd450: 
						(encoder_in[451]) ? 10'd451: 
						(encoder_in[452]) ? 10'd452: 
						(encoder_in[453]) ? 10'd453: 
						(encoder_in[454]) ? 10'd454: 
						(encoder_in[455]) ? 10'd455: 
						(encoder_in[456]) ? 10'd456: 
						(encoder_in[457]) ? 10'd457: 
						(encoder_in[458]) ? 10'd458: 
						(encoder_in[459]) ? 10'd459: 
						(encoder_in[460]) ? 10'd460: 
						(encoder_in[461]) ? 10'd461: 
						(encoder_in[462]) ? 10'd462: 
						(encoder_in[463]) ? 10'd463: 
						(encoder_in[464]) ? 10'd464: 
						(encoder_in[465]) ? 10'd465: 
						(encoder_in[466]) ? 10'd466: 
						(encoder_in[467]) ? 10'd467: 
						(encoder_in[468]) ? 10'd468: 
						(encoder_in[469]) ? 10'd469: 
						(encoder_in[470]) ? 10'd470: 
						(encoder_in[471]) ? 10'd471: 
						(encoder_in[472]) ? 10'd472: 
						(encoder_in[473]) ? 10'd473: 
						(encoder_in[474]) ? 10'd474: 
						(encoder_in[475]) ? 10'd475: 
						(encoder_in[476]) ? 10'd476: 
						(encoder_in[477]) ? 10'd477: 
						(encoder_in[478]) ? 10'd478: 
						(encoder_in[479]) ? 10'd479: 
						(encoder_in[480]) ? 10'd480: 
						(encoder_in[481]) ? 10'd481: 
						(encoder_in[482]) ? 10'd482: 
						(encoder_in[483]) ? 10'd483: 
						(encoder_in[484]) ? 10'd484: 
						(encoder_in[485]) ? 10'd485: 
						(encoder_in[486]) ? 10'd486: 
						(encoder_in[487]) ? 10'd487: 
						(encoder_in[488]) ? 10'd488: 
						(encoder_in[489]) ? 10'd489: 
						(encoder_in[490]) ? 10'd490: 
						(encoder_in[491]) ? 10'd491: 
						(encoder_in[492]) ? 10'd492: 
						(encoder_in[493]) ? 10'd493: 
						(encoder_in[494]) ? 10'd494: 
						(encoder_in[495]) ? 10'd495: 
						(encoder_in[496]) ? 10'd496: 
						(encoder_in[497]) ? 10'd497: 
						(encoder_in[498]) ? 10'd498: 
						(encoder_in[499]) ? 10'd499:  
						(encoder_in[500]) ? 10'd500: 
						(encoder_in[501]) ? 10'd501: 
						(encoder_in[502]) ? 10'd502: 
						(encoder_in[503]) ? 10'd503: 
						(encoder_in[504]) ? 10'd504: 
						(encoder_in[505]) ? 10'd505: 
						(encoder_in[506]) ? 10'd506: 
						(encoder_in[507]) ? 10'd507: 
						(encoder_in[508]) ? 10'd508: 
						(encoder_in[509]) ? 10'd509: 
						(encoder_in[510]) ? 10'd510: 
						(encoder_in[511]) ? 10'd511: 
						(encoder_in[512]) ? 10'd512: 
						(encoder_in[513]) ? 10'd513: 
						(encoder_in[514]) ? 10'd514: 
						(encoder_in[515]) ? 10'd515: 
						(encoder_in[516]) ? 10'd516: 
						(encoder_in[517]) ? 10'd517: 
						(encoder_in[518]) ? 10'd518: 
						(encoder_in[519]) ? 10'd519: 
						(encoder_in[520]) ? 10'd520: 
						(encoder_in[521]) ? 10'd521: 
						(encoder_in[522]) ? 10'd522: 
						(encoder_in[523]) ? 10'd523: 
						(encoder_in[524]) ? 10'd524: 
						(encoder_in[525]) ? 10'd525: 
						(encoder_in[526]) ? 10'd526: 
						(encoder_in[527]) ? 10'd527: 
						(encoder_in[528]) ? 10'd528: 
						(encoder_in[529]) ? 10'd529: 
						(encoder_in[530]) ? 10'd530: 
						(encoder_in[531]) ? 10'd531: 
						(encoder_in[532]) ? 10'd532: 
						(encoder_in[533]) ? 10'd533: 
						(encoder_in[534]) ? 10'd534: 
						(encoder_in[535]) ? 10'd535: 
						(encoder_in[536]) ? 10'd536: 
						(encoder_in[537]) ? 10'd537: 
						(encoder_in[538]) ? 10'd538: 
						(encoder_in[539]) ? 10'd539: 
						(encoder_in[540]) ? 10'd540: 
						(encoder_in[541]) ? 10'd541: 
						(encoder_in[542]) ? 10'd542: 
						(encoder_in[543]) ? 10'd543: 
						(encoder_in[544]) ? 10'd544: 
						(encoder_in[545]) ? 10'd545: 
						(encoder_in[546]) ? 10'd546: 
						(encoder_in[547]) ? 10'd547: 
						(encoder_in[548]) ? 10'd548: 
						(encoder_in[549]) ? 10'd549:  
						(encoder_in[550]) ? 10'd550: 
						(encoder_in[551]) ? 10'd551: 
						(encoder_in[552]) ? 10'd552: 
						(encoder_in[553]) ? 10'd553: 
						(encoder_in[554]) ? 10'd554: 
						(encoder_in[555]) ? 10'd555: 
						(encoder_in[556]) ? 10'd556: 
						(encoder_in[557]) ? 10'd557: 
						(encoder_in[558]) ? 10'd558: 
						(encoder_in[559]) ? 10'd559: 
						(encoder_in[560]) ? 10'd560: 
						(encoder_in[561]) ? 10'd561: 
						(encoder_in[562]) ? 10'd562: 
						(encoder_in[563]) ? 10'd563: 
						(encoder_in[564]) ? 10'd564: 
						(encoder_in[565]) ? 10'd565: 
						(encoder_in[566]) ? 10'd566: 
						(encoder_in[567]) ? 10'd567: 
						(encoder_in[568]) ? 10'd568: 
						(encoder_in[569]) ? 10'd569: 
						(encoder_in[570]) ? 10'd570: 
						(encoder_in[571]) ? 10'd571: 
						(encoder_in[572]) ? 10'd572: 
						(encoder_in[573]) ? 10'd573: 
						(encoder_in[574]) ? 10'd574: 
						(encoder_in[575]) ? 10'd575: 
						(encoder_in[576]) ? 10'd576: 
						(encoder_in[577]) ? 10'd577: 
						(encoder_in[578]) ? 10'd578: 
						(encoder_in[579]) ? 10'd579: 
						(encoder_in[580]) ? 10'd580: 
						(encoder_in[581]) ? 10'd581: 
						(encoder_in[582]) ? 10'd582: 
						(encoder_in[583]) ? 10'd583: 
						(encoder_in[584]) ? 10'd584: 
						(encoder_in[585]) ? 10'd585: 
						(encoder_in[586]) ? 10'd586: 
						(encoder_in[587]) ? 10'd587: 
						(encoder_in[588]) ? 10'd588: 
						(encoder_in[589]) ? 10'd589: 
						(encoder_in[590]) ? 10'd590: 
						(encoder_in[591]) ? 10'd591: 
						(encoder_in[592]) ? 10'd592: 
						(encoder_in[593]) ? 10'd593: 
						(encoder_in[594]) ? 10'd594: 
						(encoder_in[595]) ? 10'd595: 
						(encoder_in[596]) ? 10'd596: 
						(encoder_in[597]) ? 10'd597: 
						(encoder_in[598]) ? 10'd598: 
						(encoder_in[599]) ? 10'd599:
						10'b1111111111);
endmodule
