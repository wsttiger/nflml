#!/bin/bash

mkdir -p results

grep "left end" *.csv      | grep -i -v "pass" > ./results/left_end_runs.csv
grep "left tackle" *.csv   | grep -i -v "pass" > ./results/left_tackle_runs.csv
grep "left guard" *.csv    | grep -i -v "pass" > ./results/left_guard_runs.csv
grep "up the middle" *.csv | grep -i -v "pass" > ./results/middle_runs.csv
grep "right guard" *.csv   | grep -i -v "pass" > ./results/right_guard_runs.csv
grep "right tackle" *.csv  | grep -i -v "pass" > ./results/right_tackle_runs.csv
grep "right end" *.csv     | grep -i -v "pass" > ./results/right_end_runs.csv

grep "left end" *.csv      | grep -i "pass" > ./results/left_end_scrambles.csv
grep "left tackle" *.csv   | grep -i "pass" > ./results/left_tackle_scrambles.csv
grep "left guard" *.csv    | grep -i "pass" > ./results/left_guard_scrambles.csv
grep "up the middle" *.csv | grep -i "pass" > ./results/middle_scrambles.csv
grep "right guard" *.csv   | grep -i "pass" > ./results/right_guard_scrambles.csv
grep "right tackle" *.csv  | grep -i "pass" > ./results/right_tackle_scrambles.csv
grep "right end" *.csv     | grep -i "pass" > ./results/right_end_scrambles.csv

grep "pass incomplete" *.csv                > ./results/incomplete_passes.csv
grep "pass" *.csv | grep -i "intercepted"   > ./results/intercepted_passes.csv

grep "pass left" *.csv                      > ./results/passes_left.csv
grep "pass middle" *.csv                    > ./results/passes_middle.csv
grep "pass right" *.csv                     > ./results/passes_right.csv
grep "pass short left" *.csv                > ./results/passes_short_left.csv
grep "pass short middle" *.csv              > ./results/passes_short_middle.csv
grep "pass short right" *.csv               > ./results/passes_short_right.csv
grep "pass deep left" *.csv                 > ./results/passes_deep_left.csv
grep "pass deep middle" *.csv               > ./results/passes_deep_middle.csv
grep "pass deep right" *.csv                > ./results/passes_deep_right.csv

# remove interceptions from passes
grep -i -v "intercepted" ./results/passes_left.csv            > ./results/passes_left.csv
grep -i -v "intercepted" ./results/passes_middle.csv          > ./results/passes_middle.csv
grep -i -v "intercepted" ./results/passes_right.csv           > ./results/passes_right.csv
grep -i -v "intercepted" ./results/passes_short_left.csv      > ./results/passes_short_left.csv
grep -i -v "intercepted" ./results/passes_short_middle.csv    > ./results/passes_short_middle.csv
grep -i -v "intercepted" ./results/passes_short_right.csv     > ./results/passes_short_right.csv
grep -i -v "intercepted" ./results/passes_deep_left.csv       > ./results/passes_deep_left.csv
grep -i -v "intercepted" ./results/passes_deep_middle.csv     > ./results/passes_deep_middle.csv
grep -i -v "intercepted" ./results/passes_deep_right.csv      > ./results/passes_deep_right.csv

# remove incompletions from passes
grep -i -v "pass incomplete" ./results/passes_left.csv            > ./results/passes_left.csv
grep -i -v "pass incomplete" ./results/passes_middle.csv          > ./results/passes_middle.csv
grep -i -v "pass incomplete" ./results/passes_right.csv           > ./results/passes_right.csv
grep -i -v "pass incomplete" ./results/passes_short_left.csv      > ./results/passes_short_left.csv
grep -i -v "pass incomplete" ./results/passes_short_middle.csv    > ./results/passes_short_middle.csv
grep -i -v "pass incomplete" ./results/passes_short_right.csv     > ./results/passes_short_right.csv
grep -i -v "pass incomplete" ./results/passes_deep_left.csv       > ./results/passes_deep_left.csv
grep -i -v "pass incomplete" ./results/passes_deep_middle.csv     > ./results/passes_deep_middle.csv
grep -i -v "pass incomplete" ./results/passes_deep_right.csv      > ./results/passes_deep_right.csv



