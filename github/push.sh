
#!/bin/bash
<<<<<<< HEAD
read -p "push or rebase: " option
if [ $option == "push" ]
=======
read -p "push or rebase: " oper
if [ $oper == "push" ]
>>>>>>> 349b115... rebase
then
  git add -A
  git status
  read -p "Check that the files changes are correct. [y/n]: " variable
  if [ $variable == "y" ]
  then
    git commit -m ":memo: Add some documents `date`"
    git pull origin master
    git push origin master
  else
    echo "It's not pushed"
  fi
<<<<<<< HEAD
elif [ $option == "rebase" ]
  then
=======
else
>>>>>>> 349b115... rebase
  git add -A
  git commit -m "rebase"
  git rebase -i HEAD~2
  read -p "Modified to complete. [y/n]: " variable
  if [ $variable == "y" ]
  then
    git push origin master -f
  else
    echo "It's not rebased"
  fi
<<<<<<< HEAD
else
  echo "Invalid attempt"
  fi
=======
fi
>>>>>>> 349b115... rebase
