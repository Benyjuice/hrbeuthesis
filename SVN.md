# Linux 下 SVN 简易指南 #

**1、检出最新版本的代码，如果你打算检出以后 commit（模板维护小组成员才有此commit权限，普通用户只需下载），那么需要使用 HTTPS，如下：**
> _`svn checkout https://hrbeuthesis.googlecode.com/svn/trunk/ --username yourusername`_
这个命令执行成功后，会在你的当前目录下建立一个叫 trunk 的目录，里面就是项目的当前主分支最新版了。

**2、编辑修改：**

进 trunk 里面干活，查看代码、修改代码、添加删除文件等等……有人说最好 cp 出一个副本来工作，也有道理。举几个常见的例子：

譬如一：添加一个文件 foo.tex

譬如二：编辑文件 Makefile

譬如三：删除一个文件 old.tex

**3、检查状态：**

还是在 trunk 目录里面，命令
> _`svn stat *`_

如果你譬如一了：可以看到你的文件们的状态，譬如刚刚添加的 foo.tex，状态是?

如果你譬如二了：可以看到刚刚修改过的 Makefile，状态是M

如果你譬如三了：应该看不到什么，因为你将 old.tex 从本地删除了，接下来还需要使用 svn 命令将 old.tex 从 svn 代码库里删除

**4、更新 svn 数据：**

如果是譬如一：上传之前，命令
> _`svn add *`_
刚刚添加的文件 foo.tex，状态就变成了 A，意思是即将添加进去

如果是譬如二：直接转到步骤5即可

如果是譬如三：还需要命令
> _`svn delete old.tex`_
这样文件 old.tex 的状态就变成了 D，意思是将要从代码库中删除

**5、上传：**
> _`svn commit --username yourusername`_
然后 svn 会打开你之前在 _~/.subversion/config_ 文件里面设置的编辑器，譬如我的 vi，最上面一行写点更新日志啥的，最好不要啥也不写

## **Note:** ##
**有一点很容易疏忽，Google Code 里面，你的密码和你的 Google 帐户的密码是不同的，你需要到你的 Google Code 帐户页面，也就是 https://code.google.com/u/jyl198803 (应该改成你的用户名)里的 settings 页面查看 Google 为你生成的密码。**

**普通用户拿模板写自己的论文时，若要更新请特别注意模板的改动内容，千万别覆盖了你自己的论文正文!!! 建议正文文档的文件名与模板不同，然后在main.tex中替换相应的文件名为自己的论文文件名。**

