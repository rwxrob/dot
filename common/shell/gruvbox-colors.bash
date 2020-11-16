

gruv () {
  printf "     "
  for fore in ${solbases[@]} ${solcolors[@]} ;do
    declare c=sol$fore
    printf "%-4s" $fore
  done
  printf $reset
  for back in ${solbases[@]} ${solcolors[@]};do
    declare b=sol${back^^}
    printf "$reset\n %-4s%s" ${back^^} ${!b} 
    for fore in ${solbases[@]} ${solcolors[@]};do
      declare f=sol${fore}
      printf "%s%s%-4s" ${!b} ${!f} sol
    done
  done
  printf $reset
  printf "\n[reset clear]\n"
}


