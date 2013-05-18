-module (geo_parser_tests).
-include_lib("eunit/include/eunit.hrl").
-author("Schmidely Stephane").
-vsn(1.0).
-import (geo_parser, [analyser/1]).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%							TESTS UNITAIRES
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

parse_test() -> 
	[
		{"a Paris",				?assert({2.086790, 48.658291, 2.637910, 49.046940}  =:= geo_parser:analyser("a Paris"))}, 
		{"en AlsAce",	 		?assert({6.841000, 47.420521, 8.232620,  49.077911} =:= geo_parser:analyser("en AlsAce"))},
		{"autour de Marseille", ?assert({5.290060, 43.192768, 5.568580, 43.420399}  =:= geo_parser:analyser("autour de Marseille"))},
		{"a cote de Nice", 		?assert({7.199050, 43.657860, 7.319330, 43.741329}  =:= geo_parser:analyser("samedi"))},
		{"dAnS le NorD",	 	?assert({{1.55536,49.969059,4.23093,51.089062}}     =:= geo_parser:analyser("dAnS le NorD"))},
		{"dans l'ouest",		?assert({{1.6535,46.992729,1.69219,47.018871}, {-2.55892,46.266819,0.91664,48.567989}}
											=:= geo_parser:analyser("dans l'ouest"))},
		{"dans l'EST",			?assert({{6.841,47.420521,8.23262,49.077911}, {5.25132,46.260872,7.14348,48.024101},
										{4.88857,47.813068,7.64005,49.617741}} =:= geo_parser:analyser("dans l'EST"))},
		{"Dans lE suD",			?assert({{-1.78878,42.777729,1.44827,45.714581}, {1.68839,42.332272,4.84517,44.975811},
										{-0.32716,42.571651,3.4515,45.046719}, {4.2272,43.159821,7.07782,45.126492}} 
											=:= geo_parser:analyser("Dans lE suD"))},
		{"a La mer",			?assert({{-1.78878,42.777729,1.44827,45.714581}, {1.6535,46.992729,1.69219,47.018871},
										{1.68839,42.332272,4.84517,44.975811}, {-0.32716,42.571651,3.4515,45.046719},
										{1.55536,49.969059,4.23093,51.089062}, {-2.55892,46.266819,0.91664,48.567989},
										{4.2272,43.159821,7.07782,45.126492}} =:= geo_parser:analyser("a La mer"))},
		{"a la montagne",		?assert({{6.841,47.420521,8.23262,49.077911},{-1.78878,42.777729,1.44827,45.714581},
										{0.05289,46.34716,3.1286,48.940971}, {5.25132,46.260872,7.14348,48.024101},
										{1.68839,42.332272,4.84517,44.975811}, {4.88857,47.813068,7.64005,49.617741},
										{-0.32716,42.571651,3.4515,45.046719}, {3.68843,44.115379,7.18548,46.51989}}
											=:= geo_parser:analyser("a la montagne"))},
		{"au bord de la MER",	?assert({{-1.78878,42.777729,1.44827,45.714581}, {1.6535,46.992729,1.69219,47.018871},
										{1.68839,42.332272,4.84517,44.975811}, {-0.32716,42.571651,3.4515,45.046719},
										{1.55536,49.969059,4.23093,51.089062}, {-2.55892,46.266819,0.91664,48.567989},
										{4.2272,43.159821,7.07782,45.126492}} =:= geo_parser:analyser("au bord de la MER"))},
	].