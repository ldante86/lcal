#!/bin/bash -

_western_pfm_date()
{
	local y=$1
	local golden_number=$(bc <<< "scale=3; $y/19")

	case ${golden_number##*.} in
		000)  echo 14; pm=A ;;
		052)  echo 3; pm=A ;;
		105)  echo 23; pm=M ;;
		157)  echo 11; pm=A ;;
		210)  echo 31; pm=M ;;
		263)  echo 18; pm=A ;;
		315)  echo 8; pm=A ;;
		368)  echo 28; pm=M ;;
		421)  echo 16; pm=A ;;
		473)  echo 5; pm=A ;;
		526)  echo 25; pm=M ;;
		578)  echo 13; pm=A ;;
		631)  echo 2; pm=A ;;
		684)  echo 22; pm=M ;;
		736)  echo 10; pm=A ;;
		789)  echo 30; pm=M ;;
		842)  echo 17; pm=A ;;
		894)  echo 7; pm=A ;;
		947)  echo 27; pm=M;;
	esac
}

_western_pfm_date_2()
{
	local y=$1
	case $(_western_pfm_date $y) in
		26|2|9|16     )  echo 0 ;;
		27|3|10|17    )  echo 1 ;;
		21|28|4|11|18 )  echo 2 ;;
		22|29|5|12    )  echo 3 ;;
		23|30|6|13    )  echo 4 ;;
		24|31|7|14    )  echo 5 ;;
		25|1|8|15     )  echo 6 ;;
	esac
}

_western_first_2()
{
	local y=$1
	case ${y:0:2} in
		06|13                      )  echo 6 ;;
		07|14|17|21|25|29|33|37    )  echo 5 ;;
		08|15                      )  echo 4 ;;
		09|18|22|26|30|34|38       )  echo 3 ;;
		03|10                      )  echo 2 ;;
		04|11|15|19|23|27|31|35|39 )  echo 1 ;;
		05|12|16|20|24|28|32|36|40 )  echo 0 ;;
	esac
}

_orthodox_western_last_2()
{
	local y=$1
	case ${y:2:2} in
		00|06|17|23|28|34|45|51|56|62|73|79|84|90    )  echo 0 ;;
		01|07|12|18|29|35|40|46|57|62|68|74|85|91|96 )  echo 1 ;;
		02|13|19|24|30|41|47|52|58|69|75|80|86|97    )  echo 2 ;;
		03|08|14|25|31|36|42|53|59|64|70|81|87|92|98 )  echo 3 ;;
		09|15|20|26|37|43|48|54|65|71|76|82|93|99    )  echo 4 ;;
		04|10|21|27|32|38|49|55|60|66|77|83|88|94    )  echo 5 ;;
		05|11|16|22|33|39|44|50|61|67|72|78|89|95    )  echo 6 ;;
	esac
}

_show_western_easter()
{
	local y=$1 add w w2 ow d m pfm
	if [ $y -lt 1900 ] || [ $y -gt 2199 ]; then
		echo "bad"
		return 1
	fi

	pfm=$(_western_pfm_date $y)
	w=$(_western_pfm_date_2 $y)
	w2=$(_western_first_2 $y)
	ow=$(_orthodox_western_last_2 $y)

	case $(( w + w2 + ow )) in
		0|7|14   )  add=7 ;;
		1|8|15   )  add=6 ;;
		2|9|16   )  add=5 ;;
		3|10|17  )  add=4 ;;
		4|11|18  )  add=3 ;;
		5|12     )  add=2 ;;
		6|13     )  add=1 ;;
	esac

	((d=pfm + add))

	_western_pfm_date $y >/dev/null

	case $pm in
		A)  m="April" ;;
		M)  m="March" ;;
	esac

	if [ $d -gt 31 ]; then
		((d-=31))
		m="April"
	fi

	echo $m $d $y
}

_show_western_easter "${1:-$(date +%Y)}"
