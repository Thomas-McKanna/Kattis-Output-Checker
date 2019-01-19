@ECHO OFF
setlocal enabledelayedexpansion
SET tag=%1
SET program=%2
SET url=https://open.kattis.com/problems/%tag%/file/statement/samples.zip
SET on=1
SET off=0

IF NOT EXIST samples (
    MKDIR samples
    CD samples
    curl %url% --output temp.zip
    7z x temp.zip -y -r
    rm temp.zip
    CD ..
) ELSE (
    @ECHO ON
    ECHO samples already existed
    @ECHO OFF
)

SET flag=%on%
FOR %%I IN (samples\*) DO (
    IF "!flag!"=="%on%" (
        SET ans_file=%%I
        SET flag=%off%
    ) ELSE (
        %program% < %%I > temp.txt
        diff -y temp.txt !ans_file!
        IF "!errorlevel!"=="1" (
            @ECHO ON
            ECHO Failed: output with %%I did not match !ans_file!
            @ECHO OFF
        ) ELSE (
            @ECHO ON
            ECHO Success: output with %%I matched !ans_file!
            @ECHO OFF
        )
        SET flag=%on%
    )
)
rm temp.txt
@ECHO ON
