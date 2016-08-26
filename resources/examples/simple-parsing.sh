#!/bin/bash

# ARG_POSITIONAL_SINGLE([filename])
# ARG_OPTIONAL_SINGLE([unit],[u],[What unit we accept (b for bytes, k for kibibytes, M for mebibytes)],[b])
# ARG_VERSION([echo $0 v0.1])
# ARG_OPTIONAL_BOOLEAN([verbose])
# ARG_HELP([This program tells you size of file that you pass to it in chosen units.])
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
_arg_unit="b"
_arg_verbose=off

# THE PRINT HELP FUNCION
print_help ()
{
  echo "This program tells you size of file that you pass to it in chosen units."
  printf 'Usage: %s [-u|--unit <arg>] [-v|--version] [--(no-)verbose] [-h|--help] <filename>\n' "$0"
  printf "\t-u,--unit: What unit we accept (b for bytes, k for kibibytes, M for mebibytes) (default: '%s')\n" "b"
  printf "\t-v,--version: Prints version\n"
  printf "\t-h,--help: Prints help\n"
}

# THE PARSING ITSELF
while test $# -gt 0
do
  _key="$1"
  case "$_key" in
    -u|--unit|--unit=*)
      _val="${_key##--unit=}"
      if test "$_val" = "$_key"
      then
        test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
        _val="$2"
        shift
      fi
      _arg_unit="$_val"
      ;;
    -v|--version)
      echo $0 v0.1
      exit 0
      ;;
    --no-verbose|--verbose)
      _arg_verbose="on"
      test "${1:0:5}" = "--no-" && _arg_verbose="off"
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

_positional_names=('_arg_filename' )
test ${#_positionals[@]} -lt 1 && _PRINT_HELP=yes die "FATAL ERROR: Not enough positional arguments - we require exactly 1, but got only ${#_positionals[@]}." 1
test ${#_positionals[@]} -gt 1 && _PRINT_HELP=yes die "FATAL ERROR: There were spurious positional arguments --- we expect exactly 1, but got ${#_positionals[@]} (the last one was: '${_positionals[*]: -1}')." 1
for (( ii = 0; ii < ${#_positionals[@]}; ii++))
do
  eval "${_positional_names[ii]}=\${_positionals[ii]}" || die "Error during argument parsing, possibly an Argbash bug." 1
done

# OTHER STUFF GENERATED BY Argbash

### END OF CODE GENERATED BY Argbash (sortof) ### ])
