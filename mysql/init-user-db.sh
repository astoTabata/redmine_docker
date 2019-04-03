#!/bin/bash
set -e

mysql -uroot -prootpass <<-EOSQL
    CREATE DATABASE redmine;
    CREATE DATABASE redmine_dev;
    CREATE DATABASE redmine_test;
EOSQL
