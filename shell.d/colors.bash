
escape=$'\033'
reset=$'\033[0m'
bold=$'\033[1m'
underline=$'\033[4m'
blinkon=$'\033[5m'
blinkoff=$'\033[25m'
inverse=$'\033[7m'
inverseoff=$'\033[27m'
normal=$'\033[39m'
normalbg=$'\033[49m'

clear=$'\033[H\033[2J'
clear () { echo -n $clear; }

black=$'\033[30m'
red=$'\033[31m'
green=$'\033[32m'
yellow=$'\033[33m'
blue=$'\033[34m'
magenta=$'\033[35m'
cyan=$'\033[36m'
white=$'\033[37m'

brblack=$'\033[90m'   # brblack
brred=$'\033[91m'     # brred
brgreen=$'\033[92m'   # brgreen
bryellow=$'\033[93m'  # bryellow
brblue=$'\033[94m'    # brblue
brmagenta=$'\033[95m' # brmagenta
brcyan=$'\033[96m'    # brcyan
brwhite=$'\033[97m'   # brwhite
