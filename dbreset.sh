#!/bin/bash

dropdb booking
createdb booking
psql -d booking < create.sql
psql -d booking
