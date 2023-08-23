#!/bin/bash
set -e
# Define target directory for merged content
TARGET_DIR="assets"

# Check if the directory exists. If not, create it.
if [ ! -d "$TARGET_DIR" ]; then
  mkdir "$TARGET_DIR"
fi

# Function to download and extract repo
download_and_extract() {
  USER=$1
  REPO=$2
  BRANCH=${3:-main}

  echo "Downloading $USER/$REPO..."

  ZIP_FILE="$REPO.zip"
  TEMP_DIR="temp_$REPO"

  wget "https://github.com/$USER/$REPO/archive/refs/heads/$BRANCH.zip" -O "$ZIP_FILE"

  # Extract to a temporary directory
  unzip "$ZIP_FILE" -d "$TEMP_DIR"
  if [ ! -d "$TARGET_DIR/$REPO" ]; then
    mkdir "$TARGET_DIR/$REPO"
  fi

  # Copy content to merged directory
  cp -r "$TEMP_DIR/$REPO-$BRANCH/"* "$TARGET_DIR/$REPO"
  # Cleanup downloaded files and temporary directory
  rm "$ZIP_FILE"
  rm -r "$TEMP_DIR"
}

# Use the function for each repo
download_and_extract "lizdotsh" "CS141_projects"
download_and_extract "lizdotsh" "otree" "master"
download_and_extract "lizdotsh" "Data-Structures-Projects"
# Add more as needed...

echo "All repositories have been downloaded and merged into $TARGET_DIR!"
