echo "Stoping healthdatadb"
docker stop healthdatadb
echo "removing healthdatadb container"
docker rm healthdatadb
echo "clearing out old db files"
cd db
rm -rf *
cd ..
echo "rebuilding container"
./build.sh
echo "Starting healthdatadb"
./run-db.sh
sleep 15
echo "Running migration"
./migrate.sh
echo "done!"
exit 0