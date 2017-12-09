#/bin/bash

cd gen/input/achem

for f in $(ls | grep  .org$)
do
    emacs $f --batch -f org-md-export-to-markdown
    echo "exported " + $f + " as markdown" 
done
cd ../..

poole.py --build
echo "built website"

cd ..
cp -r gen/output/* .

git add -u
git commit -m "website"
git push
