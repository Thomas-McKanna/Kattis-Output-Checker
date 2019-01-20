@ECHO OFF
setlocal enabledelayedexpansion
SET tag=%1
SET program=%2
SET url=https://open.kattis.com/problems/%tag%/file/statement/samples.zip
SET on=1
SET off=0
set was_diff=1

IF "%1"=="" (
    @ECHO ON
    ECHO "Usage: kattis-check.bat <problem-tag> <path/to/program/executable>"
    EXIT /B
)

IF NOT EXIST samples (
    MKDIR samples
    CD samples
    curl %url% --output temp.zip -s
    7z x temp.zip -y -r > nul
    rm temp.zip
    CD ..
) 

SET flag=%on%
SET all_clear=%on%
FOR %%I IN (samples\*) DO (
    IF "!flag!"=="%on%" (
        SET ans_file=%%I
        SET flag=%off%
    ) ELSE (
        %program% < %%I > temp.txt
        diff -q --strip-trailing-cr temp.txt !ans_file! > nul
        ECHO ------------------------------------------------
        IF "!errorlevel!"=="%was_diff%" (
            @ECHO ON
            ECHO Failed: output with %%I did not match !ans_file!
            diff -y --strip-trailing-cr temp.txt !ans_file!
            SET all_clear=%off%
            @ECHO OFF
        ) ELSE (
            @ECHO ON
            ECHO Success: output with %%I matched !ans_file!
            @ECHO OFF
        )
        ECHO ------------------------------------------------
        SET flag=%on%
    )
)
rm temp.txt

IF "%all_clear%"=="%on%" (
    SET result_color=02
) ELSE (
    SET result_color=04
)

color %result_color%
timeout /T 1 > nul
color
