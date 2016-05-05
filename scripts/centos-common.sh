#!/bin/bash

# Vagrant provisioning script for LAMP installation on CentOS

# Install OS updates, exclude kernel updates
yum update -y --exclude=kernel

# Install commonly used packaged
yum install git screen nc telnet -y

