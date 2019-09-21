#!/bin/bash
#--------------------------------------------
### Use node to parse json if installed, support subkeys
### Example json: {"a": 1, "b": {"c": "test"}}
### Example usage: getJsonValueByNode "$json" "b.c"
### @author mingli
###
### 2 params: json, key


# function getJsonValueByNode() {
#     if which node; then
#         local json="$1"
#         local key="$2"
#         # node -pe "JSON.stringify(eval($json).$key)" | awk '{print ($0 == "undefined" ? "" : $0)}'
#         node -pe "JSON.stringify(JSON.parse(process.argv[1]).$key)" "$json" | awk '{print ($0 == "undefined" ? "null" : $0)}'
#         return 0
#     else
#         return 1
#     fi
# }

# echo "Shell pass parameter instance!" ;
# echo "File name of execution: $0";
# echo "the first parameter is: $1";
# echo "the second parameter is: $2";
# echo "the third parameter is: $3";
# echo "Shell pass parameter instance!" ;
# echo "the first parameter is: $1";

if which node; then
	json="$1"
	key="$2"
    # node -pe "JSON.stringify(eval($json).$key)" | awk '{print ($0 == "undefined" ? "" : $0)}'
    node -pe "JSON.stringify(JSON.parse(process.argv[1]).$key)" "$json" | awk '{print ($0 == "undefined" ? "null" : $0)}'
    #node -pe "JSON.stringify(JSON.parse(process.argv[1]).$key)" "$json"
#     echo return 0
# else
# 	echo return 1
fi
# echo "done"