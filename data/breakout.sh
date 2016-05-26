#!/bin/bash

mkdir -p results

# concatenate nfl data to one file
cat *nfl_pbp_data.csv > total_data.csv

# remove special teams plays
grep -i -v "kicks"                      total_data.csv   > working_data0.csv
grep -i -v 'two.point'                  working_data0.csv > working_data1.csv
grep -i -v "punts"                      working_data1.csv > working_data2.csv
grep -i -v "field goal"                 working_data2.csv > working_data3.csv
grep -i -v "extra point"                working_data3.csv > working_data.csv

grep "left end" working_data.csv      | grep -i -v "pass" > ./results/left_end_runs.csv
grep "left tackle" working_data.csv   | grep -i -v "pass" > ./results/left_tackle_runs.csv
grep "left guard" working_data.csv    | grep -i -v "pass" > ./results/left_guard_runs.csv
grep "up the middle" working_data.csv | grep -i -v "pass" > ./results/middle_runs.csv
grep "right guard" working_data.csv   | grep -i -v "pass" > ./results/right_guard_runs.csv
grep "right tackle" working_data.csv  | grep -i -v "pass" > ./results/right_tackle_runs.csv
grep "right end" working_data.csv     | grep -i -v "pass" > ./results/right_end_runs.csv

grep "left end" working_data.csv      | grep -i "pass" > ./results/left_end_scrambles.csv
grep "left tackle" working_data.csv   | grep -i "pass" > ./results/left_tackle_scrambles.csv
grep "left guard" working_data.csv    | grep -i "pass" > ./results/left_guard_scrambles.csv
grep "up the middle" working_data.csv | grep -i "pass" > ./results/middle_scrambles.csv
grep "right guard" working_data.csv   | grep -i "pass" > ./results/right_guard_scrambles.csv
grep "right tackle" working_data.csv  | grep -i "pass" > ./results/right_tackle_scrambles.csv
grep "right end" working_data.csv     | grep -i "pass" > ./results/right_end_scrambles.csv

# treat the incomplete and intercepted passes separately
grep "pass incomplete" working_data.csv                > ./results/incomplete_passes.csv
grep "pass" working_data.csv | grep -i "intercepted"   > ./results/intercepted_passes.csv

grep "pass left" working_data.csv                      > ./results/passes_left0.csv
grep "pass middle" working_data.csv                    > ./results/passes_middle0.csv
grep "pass right" working_data.csv                     > ./results/passes_right0.csv
grep "pass short left" working_data.csv                > ./results/passes_short_left0.csv
grep "pass short middle" working_data.csv              > ./results/passes_short_middle0.csv
grep "pass short right" working_data.csv               > ./results/passes_short_right0.csv
grep "pass deep left" working_data.csv                 > ./results/passes_deep_left0.csvjkkkjjjjj
grep "pass deep middle" working_data.csv               > ./results/passes_deep_middle0.csv
grep "pass deep right" working_data.csv                > ./results/passes_deep_right0.csv

# remove interceptions from passes
grep -i -v "intercepted" ./results/passes_left0.csv            > ./results/passes_left1.csv
grep -i -v "intercepted" ./results/passes_middle0.csv          > ./results/passes_middle1.csv
grep -i -v "intercepted" ./results/passes_right0.csv           > ./results/passes_right1.csv
grep -i -v "intercepted" ./results/passes_short_left0.csv      > ./results/passes_short_left1.csv
grep -i -v "intercepted" ./results/passes_short_middle0.csv    > ./results/passes_short_middle1.csv
grep -i -v "intercepted" ./results/passes_short_right0.csv     > ./results/passes_short_right1.csv
grep -i -v "intercepted" ./results/passes_deep_left0.csv       > ./results/passes_deep_left1.csv
grep -i -v "intercepted" ./results/passes_deep_middle0.csv     > ./results/passes_deep_middle1.csv
grep -i -v "intercepted" ./results/passes_deep_right0.csv      > ./results/passes_deep_right1.csv

# remove incompletions from passes
grep -i -v "pass incomplete" ./results/passes_left1.csv            > ./results/passes_left.csv
grep -i -v "pass incomplete" ./results/passes_middle1.csv          > ./results/passes_middle.csv
grep -i -v "pass incomplete" ./results/passes_right1.csv           > ./results/passes_right.csv
grep -i -v "pass incomplete" ./results/passes_short_left1.csv      > ./results/passes_short_left.csv
grep -i -v "pass incomplete" ./results/passes_short_middle1.csv    > ./results/passes_short_middle.csv
grep -i -v "pass incomplete" ./results/passes_short_right1.csv     > ./results/passes_short_right.csv
grep -i -v "pass incomplete" ./results/passes_deep_left1.csv       > ./results/passes_deep_left.csv
grep -i -v "pass incomplete" ./results/passes_deep_middle1.csv     > ./results/passes_deep_middle.csv
grep -i -v "pass incomplete" ./results/passes_deep_right1.csv      > ./results/passes_deep_right.csv

# remove temporary files
rm total_data.csv
rm working_data*.csv
rm ./results/passes_*0.csv
rm ./results/passes_*1.csv

#concatenate pass files
cat ./results/passes_*.csv ./results/intercepted_passes.csv ./results/incomplete_passes.csv ./results/*_scrambles.csv > ./results/total_passes.csv
cat ./results/*_runs.csv > ./results/total_runs.csv
