== Prerequisites ==
* VirtualBox
* Ruby
* MySQL client libraries (to install mysql2 gem)

== To Install ==
```
git clone git://github.com/9minutesnooze/mysql_replication_talk.git
gem install bundler
bundle install
bundle exec librarian-chef install
bundle exec vagrant up
```

After this, you should have 5 MySQL instances running under Vagrant
mysql1 - 33.33.33.11
mysql2 - 33.33.33.12
mysql3 - 33.33.33.13
mysql4 - 33.33.33.14
recovery - 33.33.33.15

Start writing to mysql1 by executing 

```
bundle exec ./writestuff.rb
```

To log into a specific instance, run:
```
bundle exec vagrant ssh mysql1
bundle exec vagrant ssh mysql2
...
etc
```
