#!/usr/bin/env sh
# 使用须知需提前：
# 1.在本地创建好gh-pages分支添加完内容再将gh-pages分支推送到远程
# git checkout -b gh-pages
# git push -u homepage gh-pages



# 确保脚本抛出遇到的错误
set -e

# 生成静态文件
npm run docs:build

# 进入生成的文件夹
cd docs/.vuepress/dist

# 如果是发布到自定义域名
# echo 'www.example.com' > CNAME

git init
git add -A
git commit -m 'deploy'

# 在本地仓库中建立一个与远程仓库的别名，以便之后提交代码而不是每次都要输入远程仓库地址。
git remote add homepage git@github.com:shuguang2000/homepage.git

# 更改当前分支为mian
git branch -m main

# 强制将更改推送到远程仓库中的gh-pages分支
git push -f homepage main:gh-pages

# 返回之前所在的目录
cd -