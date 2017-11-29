para=$1
project=${1:-project-name}
cd `pwd`/$project
stash_size=$(git stash list | wc -l)
git stash
curr_branch=$(git rev-parse --abbrev-ref HEAD)
git checkout master
git pull origin master

branches=$(git branch -l)
for branch in $branches
do
  if [[ (! -f "${branch}") &&  (! -d "${branch}") && ("${branch}" != "master") ]]
  then
    git checkout $branch
    git rebase master
  fi
done
git co "${curr_branch}"
if [ "${stash_size}" -lt "$(git stash list | wc -l)" ]
then
  git stash pop
fi  