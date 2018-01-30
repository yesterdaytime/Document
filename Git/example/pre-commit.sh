# tslint, you can change the shell script to do eslint 
check_tslint()
{
  STAGED_FILES=$(git diff --cached --name-only --diff-filter=ACM | grep "ts$")
  if [[ "$STAGED_FILES" = "" ]]; then
      exit 0
  fi

  PASS=true
  for FILE in $STAGED_FILES
  do
      ./node_modules/.bin/tslint "$FILE"

      if [[ "$?" == 0 ]]; then
          echo "\t\033[32mTSLint Passed: \033[0m$FILE"
      else
          echo "\t\033[41mTSLint Failed: \033[0m$FILE"
          PASS=false
          exit 1;
      fi
  done
}

check_tslint

