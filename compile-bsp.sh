#!/bin/bash
set -e

#set these...
#WINEPREFIX
#HALO_HOME

RADIOSITY_QUALITY=0.99
RADIOSITY_STOP=0.4

mkdir -p "$HALO_HOME/data/levels/venera/models"
blender -b \
  "data/levels/venera/models/venera.blend" \
  --python blender-export.py \
  -- \
  --filepath "$HALO_HOME/data/levels/venera/models/venera" \
  --extension ".JMS" \
  --jms_version 8200 \
  --scale_enum 1 \
  --game_version haloce \
  --triangulate_faces \
  # --hidden_geo \

# assuming shaders already exist
cd "$HALO_HOME"
wine tool.exe structure levels\\venera venera
# wine "$HALO_HOME/LM_Tool.exe" lightmaps levels\\venera\\venera venera $RADIOSITY_QUALITY $RADIOSITY_STOP
