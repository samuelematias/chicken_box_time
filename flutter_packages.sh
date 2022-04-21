# This script is used in CI/CD to pub get all packages
BLUE="\e[36;1m%s\e[0m\n"
GREEN="\e[32;1m%s\e[0m\n"
YELLOW="\e[33;1m%s\e[0m\n"
printf "${BLUE}" 'Starting get in all packages'

printf "${GREEN}" "Get in: root"
flutter packages get

for dir in packages/*
do
  cd $dir
  printf "${GREEN}" "Get in: $dir"
  flutter packages get $dir
  cd -
done
printf "${BLUE}" 'Finished get in all packages'
