#!/bin/bash
read -p "push or rebase: " option
if [ $option == "push" ]
then
  git add -A
  git status
  read -p "feature, hotfix, doc, or bugFix:" commitType
  read -p "message:" message
  read -p "Check that the files changes are correct. [y/n]: " isCorrect
  if [ $isCorrect == "y" ]
  then
    git commit -m "$commitType/$message"
    git push
  else
    echo "It's not pushed"
  fi
elif [ $option == "rebase" ]
  then
  git add -A
  git commit -m "rebase"
  git rebase -i HEAD~2
  read -p "Modified to complete. [y/n]: " isCorrect
  if [ $isCorrect == "y" ]
  then
    git push origin master -f
  else
    echo "It's not rebased"
  fi
else
  echo "Invalid attempt"
  fi
