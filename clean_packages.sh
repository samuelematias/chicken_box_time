# This script can be used in CI/CD to clean all packages.
BLUE="\e[36;1m%s\e[0m\n"
GREEN="\e[32;1m%s\e[0m\n"
YELLOW="\e[33;1m%s\e[0m\n"
printf "${BLUE}" 'Starting clean all packages'

printf "${GREEN}" "Cleaning: root"
flutter clean

for dir in packages/*
do
  cd $dir
  printf "${GREEN}" "Cleaning: $dir"
  flutter clean
  cd -
done
printf "${BLUE}" "Finished clean all packages"
