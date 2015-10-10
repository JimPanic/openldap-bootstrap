# Exit with an error when a command returns with something other than 0
# 
# Use with:
#   $(fail_on_nontrue_return_value)
function fail_on_nontrue_return_value () {
  echo 'set -o errexit'
  return 0
}

# Exit with an error when using not set variables
# 
# Use with:
#   $(fail_on_unbound_variables)
function fail_on_unbound_variables () {
  echo 'set -o nounset'
  return 0
}

# Show every line of bash being executed explicitely
#
# Use with:
#   $(be_explicit)
function be_explicit () {
  echo 'set -x'
  return 0
}

# Get the canonical path of a directory
#
# To get the canonical path for a file:
#
#   $(canonical_path $(dirname "file"))/$(basename "file")
function canonical_path () {
  pushd "$1" &> /dev/null
  canonical=`pwd -P`
  popd &> /dev/null

  echo "${canonical}"
  return 0
}

function equal () {
  test "$#" -eq "2" && test "$1" = "$2"
  return $?
}

function not_equal () {
  test "$#" -eq "2" && test "$1" -ne "$2"
  return $?
}

function match () {
  equal $# 2 && test "$1" = "$2"
  return $?
}

function match_not () {
  equal $# 2 && test "$1" != "$2"
  return $?
}

function exists () {
  test "$#" -eq "1" && ls "$1" &> /dev/null
  return $?
}

function exists_not () {
  test "$#" -eq "1" && ls "$1" &> /dev/null
  not_equal $? 0
  return $?
}

function want_help () {
  equal "$1" "-h" || equal "$1" "--help"
  return $?
}

function uri_encode () {
  echo $1 | sed -e "s|/|%2F|g" -e "s| |%20|g"
}

function empty () {
  test "$1" = ""
  return $?
}

function not_empty () {
  test "$1" != ""
  return $?
}
