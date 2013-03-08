#!/usr/bin/env ruby

require 'rubygems'
require 'sequel'
require 'logger'
require 'random-word'
require 'pp'

logger = Logger.new $stdout
logger.level = Logger::DEBUG
connection_options = { :adapter  => 'mysql2',
                       :user     => 'root',
                       :password => 'root',
                       :host     => '33.33.33.1',
                       :port     => 3307,
                       :socket   => nil }

db = Sequel.connect( connection_options.merge(:database => 'mysql'))
db['CREATE DATABASE IF NOT EXISTS `stuff`'].all

db = Sequel.connect( connection_options.merge(:database => 'stuff'))
db.logger = logger
sql = <<SQL
CREATE TABLE IF NOT EXISTS phrases (
  id int AUTO_INCREMENT PRIMARY KEY,
  phrase varchar(255)
) ENGINE=InnoDB
SQL
db[sql].all


loop do
  db['INSERT INTO phrases (phrase) VALUES (?)', RandomWord.phrases.next].insert
  sleep rand()*1
end
