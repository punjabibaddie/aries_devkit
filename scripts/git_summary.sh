#!/usr/bin/env bash
# git_summary.sh

REPO_PATH="$1"

if [ -z "$REPO_PATH" ]; then
    REPO_PATH=$(pwd)
fi

if [ -d "$REPO_PATH/.git" ]; then
    echo "it is a valid git folder"
else
    echo "***ERROR***  NOT A VALID GIT FOLDER"
    exit 1
fi

cd "$REPO_PATH" || exit 1

echo "===GIT SUMMARY==="
echo "Current Branch : "
git branch --show-current
echo "-----------------"
echo "Last 5 Commits : "
git log --oneline -5
echo "-----------------"
echo "Uncommited Changes : "
git status --short | wc -l
echo "-----------------"
echo "Done"