echo "第一个参数为:$1";

cd '/Users/autel/Desktop/Wish/'

git add .;
git commit -m"updata";

if [[ $1 == push ]]; then
  git push origin master; #push to github
fi
