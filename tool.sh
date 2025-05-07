#!/bin/bash
set -e

echo "Actualizando los índices de paquetes..."
sudo apt-get update

function instalar_si_variable_es_true() {
  local var="$1"
  local paquete="$2"
  local descripcion="$3"

  if [ "${!var}" = "true" ]; then
    echo "Instalando $descripcion..."
    sudo apt-get install -y "$paquete"
  else
    echo "Saltando $descripcion."
  fi
}

# Variables controladas por el devcontainer.json
instalar_si_variable_es_true "INSTALAR_PING" "iputils-ping" "ping"
instalar_si_variable_es_true "INSTALAR_NET" "net-tools" "net-tools (ifconfig, netstat)"
instalar_si_variable_es_true "INSTALAR_TRACEROUTE" "traceroute" "traceroute"
instalar_si_variable_es_true "INSTALAR_CURL" "curl" "curl"
instalar_si_variable_es_true "INSTALAR_DNS" "dnsutils" "dnsutils (dig, nslookup)"
instalar_si_variable_es_true "INSTALAR_NMAP" "nmap" "nmap"
