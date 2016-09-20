## ShameBird Alone Version
![Shame Bird Look](http://7xi85m.com1.z0.glb.clouddn.com/shamebird.png)
### About ShameBird

---
 ShameBird is a sample blog application，build with rails,now is under the development,just has little things to do.
### Function

---
 - 支持分类功能，通过选择不同的分类类型，来实现不同的记录方式
 - 积木化的组件：分为文章，便签，影集三种记录方式
 - Markdown 和 富文本编辑器
 - 评论功能
 - 图片上传功能
 - 支持通过 id 插入网易云音乐

### 文档完善中。。。(=￣ω￣=)

---
 This README would normally document whatever steps are necessary to get the application up and running.  
 Things you may want to cover:  
 -	Ruby version ruby 2.3.1
 -	System dependencies
 -	Configuration
 -	Database creation
 -	Database initialization
 -	How to run the test suite
 -	Services (job queues, cache servers, search engines, etc.)
 -	Deployment instructions
 -	...  
 Please feel free to use a different markup language if you do not plan to run`rake doc:app`.
### 部署

---
    # login your server as root
    ssh root@yourIpAdress
    # add deploy user
    sudo adduser deploy
    # add deploy user to sudo group
    sudo adduser deploy sudo
    # switch to deploy user
    su deploy
    # update your server system
    sudo apt-get update
    # resolve the system dependencies
    sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev 
    sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev
    cd
    # install rbenv
    git clone https://github.com/rbenv/rbenv.git ~/.rbenv
    echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
    echo 'eval "$(rbenv init -)"' >> ~/.bashrc
    exec $SHELL
    git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
    echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
    exec $SHELL
    # list the available ruby virsion
    rbenv install -l
    # only for Chinese
    git clone https://github.com/andorchen/rbenv-china-mirror.git ~/.rbenv/plugins/rbenv-china-mirror
    # use the rbenv to install ruby 2.3.1
    rbenv install 2.3.1
    # use ruby 2.3.1 as default
    rbenv global 2.3.1
    ruby -v
    # just for Chinese
    gem sources --add https://ruby.taobao.org/ --remove https://rubygems.org/
    gem sources -l
    gem install bundler
    rbenv rehash
    # install Nodejs
    sudo apt-get install nodejs
    # install PostgreSQL
    sudo apt-get install postgresql postgresql-contrib libpq-dev
    # set postgres user
    sudo su - postgres
    createuser --pwprompt
    exit
    sudo mkdir -p /var/www/shamebird
    sudo chown deploy:deploy /var/www/shamebird
    # just for Chinese
    bundle config mirror.https://rubygems.org https://ruby.taobao.org
    bundle install

    
### LICENSE

---
GNU GENERAL PUBLIC LICENSE Version 3.0
