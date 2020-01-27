# Liniux_env
Geant4, Garfiled++, ROOT, cmake, pythonなどの環境構築

---
## Cmake(serverなどで local)

.bashrcに以下を記入

```
#.bachrc
export PATH=$HOME/local/CMAKE/bin:$PATH::
export LD_LIBRARY=$HOME/lib/:$LD_LIBRARY_PATH::
```

ソースをダウンロード
Cmakeをダウンロードしたいところで

```
$ git clone git://cmake.org/cmake.git
$ cd cmake
$ ./configure —prefix=$HOME/local/CMAKE(インストールしたいところ)
$ make
$ make install
```

## Cmake(Mac)

`$ brew install cmake`

---
## Root build

localで

```
$ git clone  http://github.com/root-project/root.git .
$ cd root
$ git checkout *******
```

builddirを作成し、そこで

```
$ cmake path/to/src -DCMAKE_CXX_COMPILER=/usr/local/gcc-4.9.1/bin/g++ -DCMAKE_C_COMPILER=/usr/local/gcc-4.9.1/bin/gcc  -DPYTHON_EXECUTABLE=/usr/local/pyenv/versions/3.6.5/bin/python3
$ cmake —build . — -j. /path/to/builddir/bin/thisroot.sh
```

---
## Garfield++ build

.bashrcに書く
```
#bachrc
export GARFIELD_HOME=~/local/Garfield::
export HEED_DATABASE=$GARFIELD_HOME/Heed/heed++/database
```

```
$ git clone  https://gitlib.cern.ch/garfield/garfieldpp.git $GARFIELD_HOME
$ cd $GARFIELD_HOME
$ mkdir build
$ mkdir install
$ cd build
$ cmake $GARFIELD_HOME/garfieldpp -DCMAKE_INSTALL_PREFIX=$GARFIELD_HOME/install
$ make -j4
$ make install
```



---
## Geant4 install & build

[Geant4_CMake - KobaWiki](http://be.nucl.ap.titech.ac.jp/~koba/cgi-bin/moin.cgi/Geant4_CMake)

```
$ cd ~/local/Geant4/
$ wget http://geant4-data.web.cern.ch/geant4-data/releases/geant4.10.05.p01.tar.gz

$ tar zxf geant4.9.5.p01.tar.gz
$ mkdir geant4-build
$ cd geant4-build
$ cmake -DCMAKE_INSTALL_PREFIX=~/local/Geant4/geant4.10.05.p01-install -DGEANT4_USE_OPENGL_X11=ON -DGEANT4_INSTALL_DATA=ON ../geant4.10.05.p01
$ make -j4
$ make install
```

```.bashrc
source ~/local/Geant4/geant4.10.05.p01-install/bin/geant4.sh
```
---
## mount

[Linuxサーバ間でのマウントについて - Linux系OS 解決済み| 【OKWAVE】](https://okwave.jp/qa/q7749733.html)
サーバ側
```
$ mkdir {s_mount_DIR}
$ cd /etc
$ echo "{絶対パス}/s_mount_DIR {client_ip}(rw,no_root_squash)" >> exports
($ vim exports で書き換える)
$ /usr/sbin/exportfなんちゃらで設定できているか確認
```
クライアント側
```
$ mkdir {c_mount_DIR}
$ mount -t nfs {server_ip}:{絶対パス}/{s_mount_DIR} {絶対パス}/{c_mount_DIR}
```
---
# python

---
## pyenv
```.bashrc
export PYENV_ROOT=“$HOME/.pyenv”
export PATH=“$PYENV_ROOT/bin:$PATH”
eval “$(pyenv init -)”
```
```
$ pyenv install --list
$ pyenv install (you want to install the src)
$ python
```
---
## jupyter lab

[JupyterLabのすゝめ - Qiita](https://qiita.com/kirikei/items/a1639954ce5ccaf7ac3c)
```
$ conda install -c conda-forge jupyterlab # anacondaを入れている場合
# or
$ pip install jupyterlab # pipのみを入れている場合
# or
$ pipenv install jupyterlab # pipenvを入れている場合
```
extention
```
conda install -c conda-forge nodejs
```
---
---
### install
`pip install jupyter`
`jupyter notebook //ブラウザで開かれる`

---
* sshで開く方法
ローカル側
[Jupyter Notebook - おすすめの nbextensions まとめ - Pynote](http://pynote.hatenablog.com/entry/jupyter-notebook-nbextensions)
[Jupyterを導入しよう -ローカル編- - Qiita](https://qiita.com/Miggy/items/8e4bb0fbfe32dd8c98d5)
```
$ pip install jupyter
$ pip install https://github.com/ipython-contrib/IPython-notebook-extensions/archive/master.zip
$ git clone https://github.com/ipython-contrib/IPython-notebook-extensions.git
```
ダウンロードした際のファイル「nbextensions」「 extensions」「templates」フォルダを、$(jupyter —data-dir)以下に配置。

リモート側
[Jupyterを導入しよう -リモート編- - Qiita](https://qiita.com/Miggy/items/5466a2c1e968602f3ebe)
```
$ jupyter notebook --generate-config
$ pip install ipython
In [1]: from IPython.lib import passwd
In [2]: passwd()
#2回パスワードを入力するとsha1:XXXXXXXXXが生成
```
---
* リモートでLabを使うとき
```
$ jupyter notebook --generate-config #脳死で
$ ls ~/.jupyter/
jupyter_notebook_config.py #<-こいつが生成される
$ vim jupyter_notebook_config.py
```
```#jupyter_notebook_config.py
from jupyter_core.paths import jupyter_config_dir, jupyter_data_dir
import os.path
import sys

sys.path.append(os.path.join(jupyter_data_dir(), 'extensions'))

c = get_config()
c.NotebookApp.extra_template_paths = [os.path.join(jupyter_data_dir(), 'templates')]
c.NotebookApp.ip = 'i.p.adre.ss'(ssh側のipアドレス)
c.NotebookApp.open_browser = True(Falseでもいい)
c.NotebookApp.password = u'sha1:c1feb47be1eb:13c15239a3a080250c0d3e69efb4f2ace6c0f3dc'
#ipythonで作ったときの鍵的なの
c.NotebookApp.port = 9999
c.NotebookApp.server_extensions = ['nbextensions']
```
ローカルとサーバをつなぐ
```
$ ssh -L 9999:10.37.0.236:9999 shimada@ip.address -Y -f -N
#Backgroundでトンネルする。
$ ssh shimada@ip.address jupyter-lab
```

node.jsをローカルにインストールする
[ローカル環境にnode.jsをインストール - Qiita](https://qiita.com/sims0728/items/0b7443f00959ad1dbea7)
```

```
Extensionからvimやらなんやらを設定できる。
[Extensions — JupyterLab 1.2.5 documentation](https://jupyterlab.readthedocs.io/en/stable/user/extensions.html)

