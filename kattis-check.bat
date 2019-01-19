SET tag=%1
SET url=https://open.kattis.com/problems/%tag%/file/statement/samples.zip

IF NOT EXIST samples (
    mkdir samples
    cd samples
    curl %url% --output temp.zip
    7z x temp.zip -y -r
    rm temp.zip
    cd ..
) ELSE (
    echo samples already existed
)

echo *.exe