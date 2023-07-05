#!/bin/bash

# Function to install Python and pip
install_python() {
  if [[ "$OSTYPE" == "linux-gnu" ]]; then
    if command -v apt-get &> /dev/null; then
      # Debian/Ubuntu
      sudo apt-get install -y python3 python3-pip
    elif command -v dnf &> /dev/null; then
      # Fedora
      sudo dnf install -y python3 python3-pip
    elif command -v yum &> /dev/null; then
      # CentOS/RHEL
      sudo yum install -y python3 python3-pip
    else
      echo "Unsupported distribution. Please install Python 3 and pip3 manually."
      exit 1
    fi
  elif [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS using Homebrew
    if ! command -v brew &> /dev/null; then
      echo "Homebrew is required but not found. Please install Homebrew and try again."
      exit 1
    fi
    brew install python3
  elif [[ "$OSTYPE" == "msys" || "$OSTYPE" == "cygwin" || "$OSTYPE" == "win32" ]]; then
    # Windows using Chocolatey
    if ! command -v choco &> /dev/null; then
      echo "Chocolatey is required but not found. Please install Chocolatey and try again."
      exit 1
    fi
    choco install -y python
  else
    echo "Unsupported operating system. Please install Python 3 and pip3 manually."
    exit 1
  fi
}

# Install Python if not already installed
if ! command -v python3 &> /dev/null; then
  echo "Python 3 is not found. Installing Python and pip..."
  install_python
fi

# Change to your project directory
cd .

# Install dependencies using pip
pip3 install -r requirements.txt

# Check the installation status
if [ $? -eq 0 ]; then
  echo "Dependencies installed successfully."
else
  echo "An error occurred while installing dependencies."
fi