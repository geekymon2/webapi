#!/bin/bash

set -e
run_cmd="dotnet run --server.urls http://*:5000"

until dotnet ef database update; do
>&2 echo "SQL Server is starting up...."
sleep 1
done

>&2 echo "SQL Server is up - Running appliction"
exec $run_cmd