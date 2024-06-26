#!/bin/bash

# SonarQube Scanner version
SONAR_SCANNER_VERSION="4.6.2.2472"
SONAR_SCANNER_DIR="sonar-scanner-${SONAR_SCANNER_VERSION}"

# Detect operating system
OS=$(uname -s)
case "$OS" in
  Linux*)     OS=linux;;
  Darwin*)    OS=macos;;
  *)          OS=unknown;;
esac

# Function to download and install SonarQube Scanner for Linux
install_sonar_scanner_linux() {
  echo "Installing SonarQube Scanner for Linux..."
  wget "https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/${SONAR_SCANNER_DIR}-linux.zip"
  unzip "${SONAR_SCANNER_DIR}-linux.zip"
  export PATH=$PWD/${SONAR_SCANNER_DIR}/bin:$PATH
  echo "SonarQube Scanner installed successfully."
}

# Function to download and install SonarQube Scanner for macOS
install_sonar_scanner_macos() {
  echo "Installing SonarQube Scanner for macOS..."
  curl -OL "https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/${SONAR_SCANNER_DIR}-macosx.zip"
  unzip "${SONAR_SCANNER_DIR}-macosx.zip"
  export PATH=$PWD/${SONAR_SCANNER_DIR}/bin:$PATH
  echo "SonarQube Scanner installed successfully."
}

# Check if sonar-scanner is installed
if ! command -v sonar-scanner &> /dev/null; then
  case "$OS" in
    linux)  install_sonar_scanner_linux;;
    macos)  install_sonar_scanner_macos;;
    *)      echo "Unsupported OS: $OS"; exit 1;;
  esac
fi

# Path to the sonar-project.properties file
SONAR_PROJECT_PROPERTIES="sonar-project.properties"

# Check if the sonar-project.properties file exists
if [ ! -f "$SONAR_PROJECT_PROPERTIES" ]; then
  echo "Error: sonar-project.properties file not found!"
  exit 1
fi

# Run the SonarQube scanner
sonar-scanner -Dproject.settings=$SONAR_PROJECT_PROPERTIES

# Capture the exit code
EXIT_CODE=$?

# Check if the scanner ran successfully
if [ $EXIT_CODE -eq 0 ]; then
  echo "SonarQube analysis completed successfully."
else
  echo "SonarQube analysis failed with exit code $EXIT_CODE."
  exit $EXIT_CODE
fi
