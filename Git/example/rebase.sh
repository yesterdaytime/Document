para=$1
project=${1:-project-name}
cd `pwd`/$project
# stash change code 
stash_size=$(git stash list | wc -l)
git stash
# save current branch, reset this branch after rebase
curr_branch=$(git rev-parse --abbrev-ref HEAD)
git checkout master || exit 1
git pull origin master || exit 1
# rebase all branches
branches=$(git branch -l)
for branch in $branches
do
  if [[ (! -f "${branch}") &&  (! -d "${branch}") && ("${branch}" != "master") ]]
  then
    git checkout $branch || exit 1
    git rebase master || exit 1
  fi
done
# reset curr_branch
git co "${curr_branch}"
# reset code from rebase 
if [ "${stash_size}" -lt "$(git stash list | wc -l)" ]
then
  git stash pop
fi