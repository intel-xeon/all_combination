#!/bin/bash

sqlite3 :memory: <<EOF | sed "s/|/$3/g"
.mode list
.separator '|'

CREATE TABLE x(x TEXT);
.import $1 x

CREATE TABLE y(y TEXT);
.import $2 y

SELECT x.x || '|' || y.y FROM x,y;
EOF
