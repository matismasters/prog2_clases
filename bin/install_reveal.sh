#! /bin/bash

#         <section
#          data-markdown="/1/slides.md"
#          data-separator="^\n---\n"
#          data-separator-vertical="^\n----\n"
#          data-separator-notes="^Note:"
#        ></section>

# We clone the hakimel/reveal.js repository to the directory

git clone https://github.com/hakimel/reveal.js.git presentation_server

# We go into the directory and install the dependencies

cd presentation_server || exit
npm install
cd ..

# - in the ../classes/ folder we have one folder for each class
# - inside of each of this folders there is a slides.md file
# - the file ./support/base_revealjs_index.html is the template index.html file
# that we need to copy into each ./classes folder

# We capture the path for all the classes folders

echo "=========================================="
echo "Creating index.html files for each class:"
DIRECTORIES=$(find ./classes -maxdepth 1 -mindepth 1 -type d)

# We iterate over each class folder and copy the template file into each folder

for DIRECTORY in $DIRECTORIES; do
	echo "- Creating $DIRECTORY/index.html"
	cp ./support/base_revealjs_index.html "$DIRECTORY/index.html"
done
echo "index.html files created"
echo "=========================================="

# We create a <li> element with a link into the ./support/classes_index.html

echo "=========================================="
echo "Creating classes links:"
for DIRECTORY in $DIRECTORIES; do
	CLASS_NAME=$(basename "$DIRECTORY")
	echo "      <li><a href='/classes/$CLASS_NAME/index.html'>$CLASS_NAME</a></li>" >>./support/classes_lis.html.tmp
	echo "- $CLASS_NAME"
done
echo "classes links created"
echo "=========================================="

# We copy the content of the ./support/classes_lis.html.tmp into right after the
# <ul id="classes-links"> inside the file ./support/classes_index.html

echo "=========================================="
echo "Creating classes index.html with links"
awk '/<ul id="classes-links">/{print; system("cat ./support/classes_lis.html.tmp"); next}1' ./support/classes_index.html >./support/classes_index.html.tmp
echo "classes/index.html created"
echo "=========================================="

# We copy classes_index.html.tmp into ./classes/index.html

echo "=========================================="
echo "Copying classes index.html files"
cp ./support/classes_index.html.tmp ./classes/index.html
echo "classes/index.html copied into folder"
echo "=========================================="

# We clean up tmp files

echo "=========================================="
echo "Cleaning up tmp files"
rm ./support/classes_lis.html.tmp
rm ./support/classes_index.html.tmp
echo "tmp files cleaned up"
echo "=========================================="

# We create a symbolic link to each folder ./classes
# into ./presentation_server/classes

echo "=========================================="
echo "Creating symbolic link"
ln -s "$(pwd)/classes" "$(pwd)/presentation_server/classes"
echo "Symbolic link of folder ./classes created into ./presentation_server/classes"
echo "=========================================="

# We let the user know things went well

echo "Reveal.js has been installed and the index.html files have been created for each class"
