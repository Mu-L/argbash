#!/bin/bash

# ARG_POSITIONAL_SINGLE([positional-arg],[Positional arg description])
# ARG_OPTIONAL_SINGLE([option],[o],[A option with short and long flags and default],[b])
# ARG_OPTIONAL_BOOLEAN([print],[],[A boolean option with long flag (and implicit default: off)],[])
# ARG_VERSION([echo $0 v0.1])
# ARG_HELP([This is a minimal demo of Argbash potential])
# ARGBASH_SET_INDENT([  ])
# ARGBASH_GO()
# needed because of Argbash --> m4_ignore([
### START OF CODE GENERATED BY Argbash v2.1.1 one line above ###
# Argbash is a bash code generator used to get arguments parsing right.
# Argbash is FREE SOFTWARE, know your rights: https://github.com/matejak/argbash

die()
{
  local _ret=$2
  test -n "$_ret" || _ret=1
  test "$_PRINT_HELP" = yes && print_help >&2
  echo "$1" >&2
  exit ${_ret}
}

# THE DEFAULTS INITIALIZATION - POSITIONALS
# THE DEFAULTS INITIALIZATION - OPTIONALS
_arg_option="b"
_arg_print=off

# THE PRINT HELP FUNCION
print_help ()
{
  echo "This is a minimal demo of Argbash potential"
  printf 'Usage: %s [-o|--option <arg>] [--(no-)print] [-v|--version] [-h|--help] <positional-arg>\n' "$0"
  printf "\t<positional-arg->: Positional arg description\n"
  printf "\t-o,--option: A option with short and long flags and default (default: '%s')\n" "b"
  printf "\t--print,--no-print: A boolean option with long flag (and implicit default: off) (%s by default)\n" "off"
  printf "\t-v,--version: Prints version\n"
  printf "\t-h,--help: Prints help\n"
}

# THE PARSING ITSELF
while test $# -gt 0
do
  _key="$1"
  case "$_key" in
    -o|--option|--option=*)
      _val="${_key##--option=}"
      if test "$_val" = "$_key"
      then
        test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
        _val="$2"
        shift
      fi
      _arg_option="$_val"
      ;;
    --no-print|--print)
      _arg_print="on"
      test "${1:0:5}" = "--no-" && _arg_print="off"
      ;;
    -v|--version)
      echo $0 v0.1
      exit 0
      ;;
    -h|--help)
      print_help
      exit 0
      ;;
    *)
      _positionals+=("$1")
      ;;

  esac
  shift
done

_positional_names=('_arg_positional_arg' )
test ${#_positionals[@]} -lt 1 && _PRINT_HELP=yes die "FATAL ERROR: Not enough positional arguments - we require exactly 1, but got only ${#_positionals[@]}." 1
test ${#_positionals[@]} -gt 1 && _PRINT_HELP=yes die "FATAL ERROR: There were spurious positional arguments --- we expect exactly 1, but got ${#_positionals[@]} (the last one was: '${_positionals[*]: -1}')." 1
for (( ii = 0; ii < ${#_positionals[@]}; ii++))
do
  eval "${_positional_names[ii]}=\${_positionals[ii]}" || die "Error during argument parsing, possibly an Argbash bug." 1
done

# OTHER STUFF GENERATED BY Argbash

### END OF CODE GENERATED BY Argbash (sortof) ### ])
# [ <-- needed because of Argbash


if [ "$_arg_print" = on ]
then
  echo "Positional arg value: '$_arg_positional_arg'"
  echo "Optional arg '--option' value: '$_arg_option'"
else
  echo "Not telling anything, print not requested"
fi

# ] <-- needed because of Argbash
