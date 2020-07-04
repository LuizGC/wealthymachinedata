#!/bin/bash
artifactId=`cat .github/workflows/artifactId`
echo artifactId
zipArtifact="wealthy-machine.zip"
runArtifact="wealthy-0.1.jar"
curl -L -H "authorization: Bearer $1" -o $zipArtifact "https://api.github.com/repos/LuizGC/wealthymachine/actions/artifacts/$artifactId/zip"
unzip $zipArtifact
java -jar $runArtifact
rm $zipArtifact
rm $runArtifact
git config --global user.name $2
git config --global user.email $3@users.noreply.github.com
git add .
git commit -m "Daily Update"
git remote set-url origin https://x-access-token:$1@github.com/$4
git push origin bovespa