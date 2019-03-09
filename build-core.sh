#!/bin/bash -ex
#
# Copyright (C) 2019 Canonical Ltd
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 3 as
# published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

print_usage()
{
    printf "Usage: %s <tx1|tx2> <authority_id> <gadget_snap> <kernel_snap> [key_id]\n" \
           "$(basename "$0")"
}

# Input validation
if [ $# -lt 4 ] || [ $# -gt 5 ]; then
    print_usage
    exit 1
fi
board=$1
if [ "$board" != tx1 ] && [ "$board" != tx2 ]; then
    print_usage
    exit 1
fi
authority_id=$2
gadget_snap=$3
kernel_snap=$4
if [ $# -ge 5 ]; then
    key_id=$5
else
    key_id=default
fi

channel=stable
outdir=out-"$board"
mkdir -p "$outdir"

# Generate model assertion
assert_file="$outdir"/jetson-"$board"-model.assert
cat << EOF | snap sign -k "$key_id" > "$assert_file"
{
  "type": "model",
  "authority-id": "$authority_id",
  "brand-id": "$authority_id",
  "series": "16",
  "model": "jetson-$board",
  "architecture": "arm64",
  "base": "core18",
  "gadget": "jetson-$board",
  "kernel": "jetson-$board-kernel",
  "timestamp": "$(date -Iseconds --utc)"
}
EOF

ubuntu-image snap --channel "$channel" --output-dir "$outdir" "$assert_file" \
             --extra-snaps "$gadget_snap" \
             --extra-snaps "$kernel_snap"
