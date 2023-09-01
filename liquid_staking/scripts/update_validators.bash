#!/usr/bin/env bash

ENVIRONMENT=$1
SCRIPT_PATH=$(dirname "$0")

source "$SCRIPT_PATH/../.env-$ENVIRONMENT"

echo "Contract setup..."

GAS_BUDGET=${GAS_BUDGET:=300000000}
echo "Gas budget: $GAS_BUDGET"
echo "Package: $PACKAGE"

# [0x..,0x..,0x...] is validators presented on network
# [1,2,3] their priority
sui client call --function update_validators --module native_pool --package "$PACKAGE" --args "$NATIVE_POOL" "[0x07466289c5f00ce745b24336a0efac170d8811379a62b2b87458126a9636bc3e,0x6d6e9f9d3d81562a0f9b767594286c69c21fea741b1c2303c5b7696d6c63618a,0xba4d20899c7fd438d50b2de2486d08e03f34beb78a679142629a6baacb88b013,0x3d618b03660f4e8b4ec99c52af08a814f5248154937782d22b5a8f2e44ba15fc]" "[1,2,3,4]" "$OPERATOR_CAP" --gas-budget "$GAS_BUDGET"
sui client call --function sort_validators --module native_pool --package "$PACKAGE" --args "$NATIVE_POOL" --gas-budget "$GAS_BUDGET"

exit 0
