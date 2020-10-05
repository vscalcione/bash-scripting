#!/bin/bash

# Download of a website for offline navigation

wget --mirror --convert-links --adjust-extension --page-requisites --no-parent $1

# NOTES
# --mirror		Download recursive
# --convert-links	Convert all the links to relative, so it will be suitable for offline viewing
# --adjust-extension	Add suitable extensions to filenames (html/css) depending on their content-type
# --page-requisites	Download things like CSS style-sheets and images required to properly display the offline page
# --no-parent		When recursing do not ascend to the parent directory. It useful for restricting the download to only a portion of the site
