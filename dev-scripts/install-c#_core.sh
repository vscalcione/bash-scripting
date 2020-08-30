#!/bin/bash

## install .net core sdk
sudo apt update
sudo apt install apt-transport-https
sudo apt update
sudo apt install dotnet-sdk-3.1

## install asp.net core runtime
sudo apt update
sudo apt install apt-transport-https
sudo apt update
sudo apt install aspnetcore-runtime-3.1

## install .net core runtime
sudo apt update
sudo apt install apt-transport-https
sudo apt update
sudo apt install dotnet-runtime-3.1
