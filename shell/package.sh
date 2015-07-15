#!/bin/sh

SRC_DIR=/data/src/mongo/$1
DEPLOY_DIR=/data/packing/mongo
CONFIG_DIR=$DEPLOY_DIR/config

cd $SRC_DIR/

git pull

rm $DEPLOY_DIR -rf
mkdir $DEPLOY_DIR
mkdir $CONFIG_DIR

rm $CONFIG_DIR -rf

mkdir $CONFIG_DIR

cd $SRC_DIR/mongo/

mkdir $CONFIG_DIR/mongo/

cd $SRC_DIR/mongo/
cp $SRC_DIR/mongo/src/main/resources/*.xml $CONFIG_DIR/mongo/ -rf
cp $SRC_DIR/mongo/src/main/resources/*.properties $CONFIG_DIR/mongo -rf
rm $SRC_DIR/mongo/src/main/resources/*.xml
rm $SRC_DIR/mongo/src/main/resources/*.properties

mvn clean package shade:shade -U -Dmaven.test.skip=true

cp $SRC_DIR/app-web/target/mongo.jar $DEPLOY_DIR/mongo.jar

cd $DEPLOY_DIR

