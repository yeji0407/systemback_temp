#!/bin/bash
echo "exitem08" | gpg --pinentry-mode loopback --passphrase-fd 0 --batch --import all.gpg
