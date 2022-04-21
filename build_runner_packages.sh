# This script is used in CI/CD to pub get all packages
BLUE="\e[36;1m%s\e[0m\n"
GREEN="\e[32;1m%s\e[0m\n"
YELLOW="\e[33;1m%s\e[0m\n"
printf "${BLUE}" 'Starting execute build_runner in all packages'

printf "${GREEN}" "Execute in: root"
flutter pub run build_runner build

for dir in packages/*
do
  cd $dir
  printf "${GREEN}" "Execute in: $dir"
  flutter pub run build_runner build
  cd -
done
printf "${BLUE}" 'Finished execute build_runner in all packages'
