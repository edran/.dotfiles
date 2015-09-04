set -e
set -u

RED='\033[0;31m'
BLUE='\033[1;34m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

print_bl () {
echo -en "${BLUE}"
printf "$1"
echo -en "${NC}"
}

print_gr () {
echo -en "${GREEN}"
printf "$1"
echo -en "${NC}"
}

print_rd () {
echo -en "${RED}"
printf "$1"
echo -en "${NC}"
}

print_yl () {
echo -en "${YELLOW}"
printf "$1"
echo -en "${NC}"
}
