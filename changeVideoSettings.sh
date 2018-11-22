#!/usr/bin/env bash

# Adjust the video settings to 1280x800 resolution and 24-bit color depth

VBoxManage controlvm "Selenium" setvideomodehint 1280 800 24
