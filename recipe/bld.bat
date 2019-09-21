:: build
cargo build   --release                  || goto :error
cargo install --root "%PREFIX%" --path . || goto :error

:: strip debug symbols
strip "%PREFIX%\bin\fd.exe" || goto :error

:: remove extra build file
del /F /Q "%PREFIX%\.crates.toml"

goto :EOF

:error
echo Failed with error #%errorlevel%.
exit 1
