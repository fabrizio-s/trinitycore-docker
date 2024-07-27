#!/bin/bash

cd /trinity/client

echo ""
echo "Running mapextractor..."
echo ""

mapextractor

echo ""
echo "Running vmap4extractor..."
echo ""

vmap4extractor
mkdir vmaps
vmap4assembler Buildings vmaps

echo ""
echo "Running mmaps_generator..."
echo ""

mkdir mmaps
mmaps_generator

echo ""
echo "Copying all output to data directory..."
echo ""

mv Cameras dbc maps /trinity/data/
mv vmaps /trinity/data/
mv mmaps /trinity/data/
rm -rf Buildings

echo ""
echo "Done!"
echo ""
