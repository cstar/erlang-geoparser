-module (geo_parser_tests).
-include_lib("eunit/include/eunit.hrl").
-author("Schmidely Stephane").
-vsn(1.0).
-import (geo_parser, [analyser/2]).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%							TESTS UNITAIRES
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

parse_test() -> 
	[
		{"a Paris",				?assert([{date,{2013,12,2}},{lieu,{2.086790, 48.658291, 2.637910, 49.046940}}]  
											=:= geo_parser:analyser("a Paris", [{date, {2013,12,2}}]))}, 

		{"pres de Paris",		?assert([{date,{2013,12,2}},{lieu,{2.086790, 48.658291, 2.637910, 49.046940}}]  
											=:= geo_parser:analyser("pres de Paris", [{date, {2013,12,2}}]))},

		{"en AlsAce",	 		?assert([{date,{2013,12,2}},{lieu,{6.841000, 47.420521, 8.232620,  49.077911}}] 
											=:= geo_parser:analyser("en AlsAce", [{date, {2013,12,2}}]))},

		{"autour de Marseille", ?assert([{date,{2013,12,2}},{lieu,{5.290060, 43.192768, 5.568580, 43.420399}}]  
											=:= geo_parser:analyser("autour de Marseille", [{date, {2013,12,2}}]))},

		{"a cote de Nice", 		?assert([{date,{2013,12,2}},{lieu,{7.199050, 43.657860, 7.319330, 43.741329}}]  
											=:= geo_parser:analyser("a cote de Nice", [{date, {2013,12,2}}]))},

		{"dAnS le NorD",	 	?assert([{date,{2013,12,2}},{lieu,{{1.55536,49.969059,4.23093,51.089062}}}]     
											=:= geo_parser:analyser("dAnS le NorD", [{date, {2013,12,2}}]))},

		{"dans l'ouest",		?assert([{date,{2013,12,2}},{lieu,{{1.6535,46.992729,1.69219,47.018871}, 
										{-2.55892,46.266819,0.91664,48.567989}}}] 
										=:= geo_parser:analyser("dans l'ouest", [{date, {2013,12,2}}]))},

		{"dans l'EST",			?assert([{date,{2013,12,2}},{lieu,{{6.841,47.420521,8.23262,49.077911}, 
										{5.25132,46.260872,7.14348,48.024101}, {4.88857,47.813068,7.64005,49.617741}}}]
										=:= geo_parser:analyser("dans l'EST", [{date, {2013,12,2}}]))},

		{"Dans lE suD",			?assert([{date,{2013,12,2}},{lieu,{{-1.78878,42.777729,1.44827,45.714581}, 
										{1.68839,42.332272,4.84517,44.975811}, {-0.32716,42.571651,3.4515,45.046719},
										{4.2272,43.159821,7.07782,45.126492}}}] 
										=:= geo_parser:analyser("Dans lE suD", [{date, {2013,12,2}}]))},

		{"a La mer",			?assert([{date,{2013,12,2}},{lieu,{{-1.78878,42.777729,1.44827,45.714581}, 
										{1.6535,46.992729,1.69219,47.018871}, {1.68839,42.332272,4.84517,44.975811},
										{-0.32716,42.571651,3.4515,45.046719}, {1.55536,49.969059,4.23093,51.089062},
										{-2.55892,46.266819,0.91664,48.567989},	{4.2272,43.159821,7.07782,45.126492}}}]
										=:= geo_parser:analyser("a La mer", [{date, {2013,12,2}}]))},

		{"a la montagne",		?assert([{date,{2013,12,2}}, {lieu,{{6.841,47.420521,8.23262,49.077911},
        								 {-1.78878,42.777729,1.44827,45.714581}, {0.05289,46.34716,3.1286,48.940971},
        								 {5.25132,46.260872,7.14348,48.024101}, {1.68839,42.332272,4.84517,44.975811},
        								 {4.88857,47.813068,7.64005,49.617741}, {-0.32716,42.571651,3.4515,45.046719},
        								 {3.68843,44.115379,7,185480,46,519890}}}]
        								 =:= geo_parser:analyser("a la montagne", [{date, {2013,12,2}}]))},

		{"au bord de la MER",	?assert([{date,{2013,12,2}},{lieu,{{-1.78878,42.777729,1.44827,45.714581}, 
										{1.6535,46.992729,1.69219,47.018871}, {1.68839,42.332272,4.84517,44.975811}, 
										{-0.32716,42.571651,3.4515,45.046719}, {1.55536,49.969059,4.23093,51.089062},
										{-2.55892,46.266819,0.91664,48.567989},{4.2272,43.159821,7.07782,45.126492}}}]
										 =:= geo_parser:analyser("au bord de la MER", [{date, {2013,12,2}}]))}, 

		{"en moselle",			?assert([{date,{2013,12,2}},{lieu,{5.8919,48.5267,7.64,49.5151}}]
										 =:= geo_parser:analyser("en moselle", [{date, {2013,12,2}}]))}, 

		{"dans l'ain",			?assert([{date,{2013,12,2}},{lieu,{4.7281,45.6111,6.1702,46.52}}]
										 =:= geo_parser:analyser("dans l'ain", [{date, {2013,12,2}}]))}, 

		{"dans le gard",		?assert([{date,{2013,12,2}},{lieu,{3.2619,43.4602,4.8456,44.4597}}]
										 =:= geo_parser:analyser("dans le gard", [{date, {2013,12,2}}]))}, 

		{"dans la meuse",		?assert([{date,{2013,12,2}},{lieu,{4.8884,48.409,5.8542,49.6169}}]
										 =:= geo_parser:analyser("dans la meuse", [{date, {2013,12,2}}]))}, 

		{"dans les landes",		?assert([{date,{2013,12,2}},{lieu,{-1.5236,43.4874,0.1367,44.5324}}]
										 =:= geo_parser:analyser("dans les landes", [{date, {2013,12,2}}]))}
	].