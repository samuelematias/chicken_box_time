# This script is used in CI/CD to format the code in all packages.
BLUE="\e[36;1m%s\e[0m\n"
GREEN="\e[32;1m%s\e[0m\n"
YELLOW="\e[33;1m%s\e[0m\n"
RED="\e[31;1m%s\e[0m\n"
printf "${BLUE}" 'Starting running format code in packages'

if [ -d "/test" ]
then
    printf "${GREEN}" "Running format code in: root"
    cd $dir
    flutter format --set-exit-if-changed lib test
    cd -
else
    printf "${RED}" "No found code to format in: root"
fi

for dir in packages/*
do
    if [ -d "$dir/test" ]
    then
        printf "${GREEN}" "Running format code in: $dir"
        cd $dir
        flutter format --set-exit-if-changed lib test
        cd -
    else
        printf "${RED}" "No found code to format in: $dir"
    fi
done
printf "${BLUE}" "Finished format code in packages"
