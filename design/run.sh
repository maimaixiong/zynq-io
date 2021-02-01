# Add path to Vivado executables if necessary
# export PATH=$PATH:
# Set license file
# export XILINXD_LICENSE_FILE=

print_help() {
	echo ""
	echo "Usage: ./run.sh BOARD"
	echo "  BOARD - name of the board, available values: A9, A19"
}

if [ "$1" == "--help" ]; then
	echo "Synthesis script for A9/A19 boards"
	print_help
	exit 0
fi

if [ "$#" -ne 1 ]; then
	echo "Wrong number of arguments!"
	print_help
	exit 1
fi

WORK="build_$1"

rm -rf $WORK
mkdir $WORK
vivado -mode batch -notrace -source setup.tcl -journal $WORK/vivado.jou -log $WORK/vivado.log -tclargs $1
