
export escape=$'\033'
export reset=$'\033[0m'
export bold=$'\033[1m'
export underline=$'\033[4m'
export blinkon=$'\033[5m'
export blinkoff=$'\033[25m'
export inverse=$'\033[7m'
export inverseoff=$'\033[27m'
export normal=$'\033[39m'
export normalbg=$'\033[49m'

export clear=$'\033[H\033[2J'
clear () { echo -n $clear; }

export black=$'\033[30m'
export red=$'\033[31m'
export green=$'\033[32m'
export yellow=$'\033[33m'
export blue=$'\033[34m'
export magenta=$'\033[35m'
export cyan=$'\033[36m'
export white=$'\033[37m'

export brblack=$'\033[90m'   # brblack
export brred=$'\033[91m'     # brred
export brgreen=$'\033[92m'   # brgreen
export bryellow=$'\033[93m'  # bryellow
export brblue=$'\033[94m'    # brblue
export brmagenta=$'\033[95m' # brmagenta
export brcyan=$'\033[96m'    # brcyan
export brwhite=$'\033[97m'   # brwhite
