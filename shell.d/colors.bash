
########################## Terminal ANSI Escapes #########################

alias fixstty='stty sane'

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

# TODO lookup clearline (I have someplace in Go)

############################### ANSI Colors ##############################

ansicolors () {
for attr in 0 1 4 5 7 ; do
    echo "------------------------------------------------"
    printf "ESC[%s;Foreground;Background - \n" $attr
    for fore in 30 31 32 33 34 35 36 37; do
        for back in 40 41 42 43 44 45 46 47; do
            printf '\033[%s;%s;%sm %02s;%02s\033[0m' \
              $attr $fore $back $fore $back
        done
    printf '\n'
    done
done
}

# foregrounds

_x=30; export black=$'\033['$_x'm'   # black
_r=31; export red=$'\033['$_r'm'     # red
_g=32; export green=$'\033['$_g'm'   # green
_y=33; export yellow=$'\033['$_y'm'  # yellow
_b=34; export blue=$'\033['$_b'm'    # blue
_m=35; export magenta=$'\033['$_m'm' # magenta
_c=36; export cyan=$'\033['$_c'm'    # cyan
_w=37; export white=$'\033['$_w'm'   # white

# backgrounds

_xb=40; export bgblack=$'\033['$_xb'm'   # bgblack
_rb=41; export bgred=$'\033['$_rb'm'     # bgred
_gb=42; export bggreen=$'\033['$_gb'm'   # bggreen
_yb=43; export bgyellow=$'\033['$_yb'm'  # bgyellow
_bb=44; export bgblue=$'\033['$_bb'm'    # bgblue
_mb=45; export bgmagenta=$'\033['$_mb'm' # bgmagenta
_cb=46; export bgcyan=$'\033['$_cb'm'    # bgcyan
_wb=47; export bgwhite=$'\033['$_wb'm'   # bgwhite

# modern bright (not bold) foregrounds

_X=90; export brblack=$'\033['$_X'm'   # brblack
_R=91; export brred=$'\033['$_R'm'     # brred
_G=92; export brgreen=$'\033['$_G'm'   # brgreen
_Y=93; export bryellow=$'\033['$_Y'm'  # bryellow
_B=94; export brblue=$'\033['$_B'm'    # brblue
_M=95; export brmagenta=$'\033['$_M'm' # brmagenta
_C=96; export brcyan=$'\033['$_C'm'    # brcyan
_W=97; export brwhite=$'\033['$_W'm'   # brwhite

# modern bright (not bold) backgrounds

_Xb=100 # brblack
_Rb=101 # brred
_Gb=102 # brgreen
_Yb=103 # bryellow
_Bb=104 # brblue
_Mb=105 # brmagenta
_Cb=106 # brcyan
_Wb=107 # brwhite

############################ Solarized Colors ############################

# https://ethanschoonover.com/solarized/

# Modern terminals no longer require Solarized to use bold (\033[1m) and
# can use the equivalent background numbers instead (40+). Unfortunately
# for backward compatibility this means that bold itself cannot be used
# dependably with Solarized because it also switches to the legacy color
# variation (for example, bold-red becomes bold-orange instead).
# (Personally I've abandonned Solarized for a more traditional approach
# with higher contrast -- particularly for visibility on small devices
# where I'm told people watch my stream (when I'm not playing around with
# retro terminals for fun.)

# (Yes I know about 256 and rgb color escapes, not interested, but if you
# *are* interested and want to use the entire CSS specification for every
# color ever named have a look at https://github.com/rwxrob/go-colors to
# get all the specific RGB values.)

export soly=$'\033['$_y'm'; export yellow=$soly
export solo=$'\033['$_R'm'; export orange=$solo
export solr=$'\033['$_r'm'; export red=$solr
export solm=$'\033['$_m'm'; export magen=$solm
export solv=$'\033['$_M'm'; export violet=$solv
export solb=$'\033['$_b'm'; export blue=$solb
export solc=$'\033['$_c'm'; export cyan=$solc
export solg=$'\033['$_g'm'; export green=$solg

export solb03=$'\033['$_X'm'; export base03=$solb03
export solb02=$'\033['$_x'm'; export base02=$solb02
export solb01=$'\033['$_G'm'; export base01=$solb01
export solb00=$'\033['$_Y'm'; export base00=$solb00
export solb0=$'\033['$_B'm';  export base0=$solb0
export solb1=$'\033['$_C'm';  export base1=$solb1
export solb2=$'\033['$_w'm';  export base2=$solb2
export solb3=$'\033['$_W'm';  export base3=$solb3
 
export solY=$'\033['$_yb'm'; export bgyellow=$solY
export solO=$'\033['$_Rb'm'; export bgorange=$solO
export solR=$'\033['$_rb'm'; export bgred=$solR
export solM=$'\033['$_mb'm'; export bgmagen=$solM
export solV=$'\033['$_Mb'm'; export bgviolet=$solV
export solB=$'\033['$_bb'm'; export bgblue=$solB
export solC=$'\033['$_cb'm'; export bgcyan=$solC
export solG=$'\033['$_gb'm'; export bggreen=$solG

export solB03=$'\033['$_Xb'm'; export bgbase03=$solB03
export solB02=$'\033['$_xb'm'; export bgbase02=$solB02
export solB01=$'\033['$_Gb'm'; export bgbase01=$solB01
export solB00=$'\033['$_Yb'm'; export bgbase00=$solB00
export solB0=$'\033['$_Bb'm';  export bgbase0=$solB0
export solB1=$'\033['$_Cb'm';  export bgbase1=$solB1
export solB2=$'\033['$_wb'm';  export bgbase2=$solB2
export solB3=$'\033['$_Wb'm';  export bgbase3=$solB3

solcolors=(y o r m v b c g)
solbases=(b03 b02 b01 b00 b0 b1 b2 b3)

# TODO add a decolor (port from Go version)

rnd () {
  declare num=$[RANDOM%8]
  declare col=${solcolors[$num]}
  declare name=sol$col
  echo -n ${!name}
}

iscolor () {
  case "$1" in
    $yellow|$orange|$red|$magen|$violet|$blue|$cyan|$green)
      return 0
      ;;
  esac
  return 1
}

isbgcolor () {
  case "$1" in
    $bgyellow|$bgorange|$bgred|$bgmagen|$bgviolet|$bgblue|$bgcyan|$bggreen)
      return 0
      ;;
  esac
  return 1
}

isbase () {
  case "$1" in
    $base03|$base02|$base01|$base00|$base0|$base1|$base2|$base3)
      return 0
      ;;
  esac
  return 1
}

isbgbase () {
  case "$1" in
    $bgbase03|$bgbase02|$bgbase01|$bgbase00|$bgbase0|$bgbase1|$bgbase2|$bgbase3)
      return 0
      ;;
  esac
  return 1
}

issol () {
  iscolor $1 && return 0
  isbase $1 && return 0
  isbgcolor $1 && return 0
  isbgbase $1 && return 0
  return 1
}

# ooooooo, pretty

sols () {
  printf "     "
  for fore in ${solbases[@]} ${solcolors[@]} ;do
    declare c=sol$fore
    printf "%-4s" $fore
  done
  printf $reset
  for back in ${solbases[@]} ${solcolors[@]};do
    #declare b=sol${back^^}
    declare b=sol${back}
    #printf "$reset\n %-4s%s" ${back^^} ${!b} 
    printf "$reset\n %-4s%s" ${back} ${!b} 
    for fore in ${solbases[@]} ${solcolors[@]};do
      declare f=sol${fore}
      printf "%s%s%-4s" ${!b} ${!f} sol
    done
  done
  printf $reset
  printf "\n[reset clear]\n"
}

############################### Modern RGB ###############################

rgb () {
  echo -n $'\033[38;2;'$1';'$2';'$3'm'
}

rgbg () {
  echo -n $'\033[48;2;'$1';'$2';'$3'm'
}

############################## Named Colors ##############################

export twitch=$'\035[38;2;169;112;255m'
export twrwxrob=$'\033[38;2;230;77;73m'

########################### CSS Standard Colors ##########################

# Thanks to the wonderful work of Ethan Baker (github.com/ethanbaker).

export aliceblue=$'\033[38;2;240;248;255m'
export antiquewhite=$'\033[38;2;250;235;215m'
export aqua=$'\033[38;2;0;255;255m'
export aquamarine=$'\033[38;2;127;255;212m'
export azure=$'\033[38;2;1240;255;255m'
export beige=$'\033[38;2;245;245;220m'
export bisque=$'\033[38;2;255;228;196m'
export black=$'\033[38;2;0;0;0m'
export blanchedalmond=$'\033[38;2;255;235;205m'
export blue=$'\033[38;2;0;0;255m'
export blueviolet=$'\033[38;2;138;43;226m'
export brown=$'\033[38;2;165;42;42m'
export burlywood=$'\033[38;2;222;184;135m'
export cadetblue=$'\033[38;2;95;158;160m'
export chartreuse=$'\033[38;2;95;158;160m'
export chocolate=$'\033[38;2;210;105;30m'
export coral=$'\033[38;2;255;127;80m'
export cornflowerblue=$'\033[38;2;100;149;237m'
export cornsilk=$'\033[38;2;255;248;220m'
export crimson=$'\033[38;2;220;20;60m'
export cyan=$'\033[38;2;0;255;255m'
export darkblue=$'\033[38;2;0;0;139m'
export darkcyan=$'\033[38;2;0;139;139m'
export darkgoldenrod=$'\033[38;2;184;134;11m'
export darkgray=$'\033[38;2;169;169;169m'
export darkgreen=$'\033[38;2;0;100;0m'
export darkkhaki=$'\033[38;2;189;183;107m'
export darkmagenta=$'\033[38;2;139;0;139m'
export darkolivegreen=$'\033[38;2;85;107;47m'
export darkorange=$'\033[38;2;255;140;0m'
export darkorchid=$'\033[38;2;153;50;204m'
export darkred=$'\033[38;2;139;0;0m'
export darksalmon=$'\033[38;2;233;150;122m'
export darkseagreen=$'\033[38;2;143;188;143m'
export darkslateblue=$'\033[38;2;72;61;139m'
export darkslategray=$'\033[38;2;47;79;79m'
export darkturquoise=$'\033[38;2;0;206;209m'
export darkviolet=$'\033[38;2;148;0;211m'
export deeppink=$'\033[38;2;255;20;147m'
export deepskyblue=$'\033[38;2;0;191;255m'
export dimgray=$'\033[38;2;0;191;255m'
export dodgerblue=$'\033[38;2;30;144;255m'
export firebrick=$'\033[38;2;178;34;34m'
export floralwhite=$'\033[38;2;255;250;240m'
export forestgreen=$'\033[38;2;34;139;34m'
export fuchsia=$'\033[38;2;255;0;255m'
export gainsboro=$'\033[38;2;220;220;220m'
export ghostwhite=$'\033[38;2;248;248;255m'
export gold=$'\033[38;2;255;215;0m'
export goldenrod=$'\033[38;2;218;165;32m'
export gray=$'\033[38;2;127;127;127m'
export green=$'\033[38;2;0;128;0m'
export greenyellow=$'\033[38;2;173;255;47m'
export honeydew=$'\033[38;2;240;255;240m'
export hotpink=$'\033[38;2;255;105;180m'
export indianred=$'\033[38;2;205;92;92m'
export indigo=$'\033[38;2;75;0;130m'
export ivory=$'\033[38;2;255;255;240m'
export khaki=$'\033[38;2;240;230;140m'
export lavender=$'\033[38;2;230;230;250m'
export lavenderblush=$'\033[38;2;255;240;245m'
export lawngreen=$'\033[38;2;124;252;0m'
export lemonchiffon=$'\033[38;2;255;250;205m'
export lightblue=$'\033[38;2;173;216;230m'
export lightcoral=$'\033[38;2;240;128;128m'
export lightcyan=$'\033[38;2;224;255;255m'
export lightgoldenrodyellow=$'\033[38;2;250;250;210m'
export lightgreen=$'\033[38;2;144;238;144m'
export lightgrey=$'\033[38;2;211;211;211m'
export lightpink=$'\033[38;2;255;182;193m'
export lightsalmon=$'\033[38;2;255;160;122m'
export lightseagreen=$'\033[38;2;32;178;170m'
export lightskyblue=$'\033[38;2;135;206;250m'
export lightslategray=$'\033[38;2;119;136;153m'
export lightsteelblue=$'\033[38;2;176;196;222m'
export lightyellow=$'\033[38;2;255;255;224m'
export lime=$'\033[38;2;0;255;0m'
export limegreen=$'\033[38;2;50;205;50m'
export linen=$'\033[38;2;250;240;230m'
export magenta=$'\033[38;2;255;0;255m'
export maroon=$'\033[38;2;128;0;0m'
export mediumaquamarine=$'\033[38;2;102;205;170m'
export mediumblue=$'\033[38;2;0;0;205m'
export mediumorchid=$'\033[38;2;186;85;211m'
export mediumpurple=$'\033[38;2;147;112;219m'
export mediumseagreen=$'\033[38;2;60;179;113m'
export mediumslateblue=$'\033[38;2;123;104;238m'
export mediumspringgreen=$'\033[38;2;0;250;154m'
export mediumturquoise=$'\033[38;2;72;209;204m'
export mediumvioletred=$'\033[38;2;199;21;133m'
export midnightblue=$'\033[38;2;25;25;112m'
export mintcream=$'\033[38;2;245;255;250m'
export mistyrose=$'\033[38;2;255;228;225m'
export moccasin=$'\033[38;2;255;228;181m'
export navajowhite=$'\033[38;2;255;222;173m'
export navy=$'\033[38;2;0;0;128m'
export navyblue=$'\033[38;2;159;175;223m'
export oldlace=$'\033[38;2;253;245;230m'
export olive=$'\033[38;2;128;128;0m'
export olivedrab=$'\033[38;2;107;142;35m'
export orange=$'\033[38;2;255;165;0m'
export orangered=$'\033[38;2;255;69;0m'
export orchid=$'\033[38;2;218;112;214m'
export palegoldenrod=$'\033[38;2;238;232;170m'
export palegreen=$'\033[38;2;152;251;152m'
export paleturquoise=$'\033[38;2;175;238;238m'
export palevioletred=$'\033[38;2;219;112;147m'
export papayawhip=$'\033[38;2;255;239;213m'
export peachpuff=$'\033[38;2;255;218;185m'
export peru=$'\033[38;2;205;133;63m'
export pink=$'\033[38;2;255;192;203m'
export plum=$'\033[38;2;221;160;221m'
export powderblue=$'\033[38;2;176;224;230m'
export purple=$'\033[38;2;128;0;128m'
export red=$'\033[38;2;255;0;0m'
export rosybrown=$'\033[38;2;188;143;143m'
export royalblue=$'\033[38;2;65;105;225m'
export saddlebrown=$'\033[38;2;139;69;19m'
export salmon=$'\033[38;2;250;128;114m'
export sandybrown=$'\033[38;2;244;164;96m'
export seagreen=$'\033[38;2;46;139;87m'
export seashell=$'\033[38;2;255;245;238m'
export sienna=$'\033[38;2;160;82;45m'
export silver=$'\033[38;2;192;192;192m'
export skyblue=$'\033[38;2;135;206;235m'
export slateblue=$'\033[38;2;106;90;205m'
export slategray=$'\033[38;2;112;128;144m'
export snow=$'\033[38;2;255;250;250m'
export springgreen=$'\033[38;2;0;255;127m'
export steelblue=$'\033[38;2;70;130;180m'
export tan=$'\033[38;2;210;180;140m'
export teal=$'\033[38;2;0;128;128m'
export thistle=$'\033[38;2;216;191;216m'
export tomato=$'\033[38;2;255;99;71m'
export turquoise=$'\033[38;2;64;224;208m'
export violet=$'\033[38;2;238;130;238m'
export wheat=$'\033[38;2;245;222;179m'
export white=$'\033[38;2;255;255;255m'
export whitesmoke=$'\033[38;2;245;245;245m'
export yellow=$'\033[38;2;255;255;0m'
export yellowgreen=$'\033[38;2;139;205;50m'

export alicebluebg=$'\033[48;2;240;248;255m'
export antiquewhitebg=$'\033[48;2;250;235;215m'
export aquabg=$'\033[48;2;0;255;255m'
export aquamarinebg=$'\033[48;2;127;255;212m'
export azurebg=$'\033[48;2;1240;255;255m'
export beigebg=$'\033[48;2;245;245;220m'
export bisquebg=$'\033[48;2;255;228;196m'
export blackbg=$'\033[48;2;0;0;0m'
export blanchedalmondbg=$'\033[48;2;255;235;205m'
export bluebg=$'\033[48;2;0;0;255m'
export bluevioletbg=$'\033[48;2;138;43;226m'
export brownbg=$'\033[48;2;165;42;42m'
export burlywoodbg=$'\033[48;2;222;184;135m'
export cadetbluebg=$'\033[48;2;95;158;160m'
export chartreusebg=$'\033[48;2;95;158;160m'
export chocolatebg=$'\033[48;2;210;105;30m'
export coralbg=$'\033[48;2;255;127;80m'
export cornflowerbluebg=$'\033[48;2;100;149;237m'
export cornsilkbg=$'\033[48;2;255;248;220m'
export crimsonbg=$'\033[48;2;220;20;60m'
export cyanbg=$'\033[48;2;0;255;255m'
export darkbluebg=$'\033[48;2;0;0;139m'
export darkcyanbg=$'\033[48;2;0;139;139m'
export darkgoldenrodbg=$'\033[48;2;184;134;11m'
export darkgraybg=$'\033[48;2;169;169;169m'
export darkgreenbg=$'\033[48;2;0;100;0m'
export darkkhakibg=$'\033[48;2;189;183;107m'
export darkmagentabg=$'\033[48;2;139;0;139m'
export darkolivegreenbg=$'\033[48;2;85;107;47m'
export darkorangebg=$'\033[48;2;255;140;0m'
export darkorchidbg=$'\033[48;2;153;50;204m'
export darkredbg=$'\033[48;2;139;0;0m'
export darksalmonbg=$'\033[48;2;233;150;122m'
export darkseagreenbg=$'\033[48;2;143;188;143m'
export darkslatebluebg=$'\033[48;2;72;61;139m'
export darkslategraybg=$'\033[48;2;47;79;79m'
export darkturquoisebg=$'\033[48;2;0;206;209m'
export darkvioletbg=$'\033[48;2;148;0;211m'
export deeppinkbg=$'\033[48;2;255;20;147m'
export deepskybluebg=$'\033[48;2;0;191;255m'
export dimgraybg=$'\033[48;2;0;191;255m'
export dodgerbluebg=$'\033[48;2;30;144;255m'
export firebrickbg=$'\033[48;2;178;34;34m'
export floralwhitebg=$'\033[48;2;255;250;240m'
export forestgreenbg=$'\033[48;2;34;139;34m'
export fuchsiabg=$'\033[48;2;255;0;255m'
export gainsborobg=$'\033[48;2;220;220;220m'
export ghostwhitebg=$'\033[48;2;248;248;255m'
export goldbg=$'\033[48;2;255;215;0m'
export goldenrodbg=$'\033[48;2;218;165;32m'
export graybg=$'\033[48;2;127;127;127m'
export greenbg=$'\033[48;2;0;128;0m'
export greenyellowbg=$'\033[48;2;173;255;47m'
export honeydewbg=$'\033[48;2;240;255;240m'
export hotpinkbg=$'\033[48;2;255;105;180m'
export indianredbg=$'\033[48;2;205;92;92m'
export indigobg=$'\033[48;2;75;0;130m'
export ivorybg=$'\033[48;2;255;255;240m'
export khakibg=$'\033[48;2;240;230;140m'
export lavenderbg=$'\033[48;2;230;230;250m'
export lavenderblushbg=$'\033[48;2;255;240;245m'
export lawngreenbg=$'\033[48;2;124;252;0m'
export lemonchiffonbg=$'\033[48;2;255;250;205m'
export lightbluebg=$'\033[48;2;173;216;230m'
export lightcoralbg=$'\033[48;2;240;128;128m'
export lightcyanbg=$'\033[48;2;224;255;255m'
export lightgoldenrodyellowbg=$'\033[48;2;250;250;210m'
export lightgreenbg=$'\033[48;2;144;238;144m'
export lightgreybg=$'\033[48;2;211;211;211m'
export lightpinkbg=$'\033[48;2;255;182;193m'
export lightsalmonbg=$'\033[48;2;255;160;122m'
export lightseagreenbg=$'\033[48;2;32;178;170m'
export lightskybluebg=$'\033[48;2;135;206;250m'
export lightslategraybg=$'\033[48;2;119;136;153m'
export lightsteelbluebg=$'\033[48;2;176;196;222m'
export lightyellowbg=$'\033[48;2;255;255;224m'
export limebg=$'\033[48;2;0;255;0m'
export limegreenbg=$'\033[48;2;50;205;50m'
export linenbg=$'\033[48;2;250;240;230m'
export magentabg=$'\033[48;2;255;0;255m'
export maroonbg=$'\033[48;2;128;0;0m'
export mediumaquamarinebg=$'\033[48;2;102;205;170m'
export mediumbluebg=$'\033[48;2;0;0;205m'
export mediumorchidbg=$'\033[48;2;186;85;211m'
export mediumpurplebg=$'\033[48;2;147;112;219m'
export mediumseagreenbg=$'\033[48;2;60;179;113m'
export mediumslatebluebg=$'\033[48;2;123;104;238m'
export mediumspringgreenbg=$'\033[48;2;0;250;154m'
export mediumturquoisebg=$'\033[48;2;72;209;204m'
export mediumvioletredbg=$'\033[48;2;199;21;133m'
export midnightbluebg=$'\033[48;2;25;25;112m'
export mintcreambg=$'\033[48;2;245;255;250m'
export mistyrosebg=$'\033[48;2;255;228;225m'
export moccasinbg=$'\033[48;2;255;228;181m'
export navajowhitebg=$'\033[48;2;255;222;173m'
export navybg=$'\033[48;2;0;0;128m'
export navybluebg=$'\033[48;2;159;175;223m'
export oldlacebg=$'\033[48;2;253;245;230m'
export olivebg=$'\033[48;2;128;128;0m'
export olivedrabbg=$'\033[48;2;107;142;35m'
export orangebg=$'\033[48;2;255;165;0m'
export orangeredbg=$'\033[48;2;255;69;0m'
export orchidbg=$'\033[48;2;218;112;214m'
export palegoldenrodbg=$'\033[48;2;238;232;170m'
export palegreenbg=$'\033[48;2;152;251;152m'
export paleturquoisebg=$'\033[48;2;175;238;238m'
export palevioletredbg=$'\033[48;2;219;112;147m'
export papayawhipbg=$'\033[48;2;255;239;213m'
export peachpuffbg=$'\033[48;2;255;218;185m'
export perubg=$'\033[48;2;205;133;63m'
export pinkbg=$'\033[48;2;255;192;203m'
export plumbg=$'\033[48;2;221;160;221m'
export powderbluebg=$'\033[48;2;176;224;230m'
export purplebg=$'\033[48;2;128;0;128m'
export redbg=$'\033[48;2;255;0;0m'
export rosybrownbg=$'\033[48;2;188;143;143m'
export royalbluebg=$'\033[48;2;65;105;225m'
export saddlebrownbg=$'\033[48;2;139;69;19m'
export salmonbg=$'\033[48;2;250;128;114m'
export sandybrownbg=$'\033[48;2;244;164;96m'
export seagreenbg=$'\033[48;2;46;139;87m'
export seashellbg=$'\033[48;2;255;245;238m'
export siennabg=$'\033[48;2;160;82;45m'
export silverbg=$'\033[48;2;192;192;192m'
export skybluebg=$'\033[48;2;135;206;235m'
export slatebluebg=$'\033[48;2;106;90;205m'
export slategraybg=$'\033[48;2;112;128;144m'
export snowbg=$'\033[48;2;255;250;250m'
export springgreenbg=$'\033[48;2;0;255;127m'
export steelbluebg=$'\033[48;2;70;130;180m'
export tanbg=$'\033[48;2;210;180;140m'
export tealbg=$'\033[48;2;0;128;128m'
export thistlebg=$'\033[48;2;216;191;216m'
export tomatobg=$'\033[48;2;255;99;71m'
export turquoisebg=$'\033[48;2;64;224;208m'
export violetbg=$'\033[48;2;238;130;238m'
export wheatbg=$'\033[48;2;245;222;179m'
export whitebg=$'\033[48;2;255;255;255m'
export whitesmokebg=$'\033[48;2;245;245;245m'
export yellowbg=$'\033[48;2;255;255;0m'
export yellowgreenbg=$'\033[48;2;139;205;50m'
