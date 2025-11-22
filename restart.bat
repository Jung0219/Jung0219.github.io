@echo off
echo Restarting Jekyll server...
docker compose down
docker compose up
