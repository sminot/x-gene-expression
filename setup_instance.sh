#!/bin/bash

# This script contains all of the commands needed to set up an AWS instance
# This includes all of the analytical packages needed (BLAST, BWA, etc.)

# this ensures that if any command results in an error, the entire script will exit
set -e

# Install BWA and BLAST
apt-get install bwa ncbi-blast+