#!/bin/bash

# https://gist.github.com/6033293

function die () {
  local st=$?
  printf '%b\n' "$*" >&2
  exit $st
}

function plist_read () {
  /usr/bin/defaults read "$1" "$2" 2>/dev/null
}

if [[ -d "/Library/Internet Plug-Ins/JavaAppletPlugin.plugin" ]]; then
  plugin="/Library/Internet Plug-Ins/JavaAppletPlugin.plugin"
elif [[ -d "/Library/Internet Plug-Ins/JavaPluginCocoa.bundle" ]]; then
  plugin="/Library/Internet Plug-Ins/JavaPluginCocoa.bundle"
else
  die "Not installed"
fi

if [[ -e "$plugin/Contents/Info.plist" ]]; then
  bundle_id=$(plist_read "$plugin/Contents/Info" CFBundleIdentifier) || die "Error: Could not read bundle identifier"
else
  die "Error: Could not find $plugin/Contents/Info.plist"
fi

case $bundle_id in
  com.oracle.* )
    version=$(plist_read "$plugin/Contents/Info" CFBundleVersion) || die "Error: Could not read bundle version"
    ;;
  com.apple.* )
    # Normalize the Java runtime version so that it looks something like x.y.z.b instead of x.y.0_z-b-foo
    output=$(/usr/libexec/java_home -v 1.6 -exec java -version 2>&1 | /usr/bin/awk '/Runtime Environment/ { sub(/.$/, "", $NF); print $NF }') || die "Error: Could not get runtime version"
    [[ -n $output ]] || die "Not installed"
    # The output looks something like '1.6.0_51-b11-457-11M4509' so we trim off what is useful to identify what isn't
    waste=${output#*.*.0_*-b*-}
    # From right-to-left, trim off the waste plus an extra '-' character
    version=${output%-$waste}
    # Substitute an empty string for the '0_'
    version=${version/0_/}
    # Finally, substitute a '.' for the '-b'
    version=${version/-b/.}
    ;;
  * )
    die "Unknown bundle identifier\n$bundle_id"
    ;;
esac

# Regex pattern to match a version string
# Matches any of the following where N is any n-digit number: N, N.N, N.N.N, or N.N.N.N
pattern='^[[:digit:]]+(\.[[:digit:]]+){0,3}$'
if [[ $version =~ $pattern ]]; then
  printf '%s\n' "$version"
else
  die "Unknown version\n$version"
fi

exit 0