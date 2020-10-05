#!/bin/bash

# Remove blank spaces to the start/end of a string

echo -n ${1//[$'\t\r\n ']}
