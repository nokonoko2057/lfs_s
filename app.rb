require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?

require 'sinatra/activerecord'
require './models'

require './calculationmanager.rb'

# 誰が編集したかは左側の色によってわかる
# ふなみん申し訳ない。。。ありがとう。。

get '/' do 
   @units = Unit.all
   @histories = History.all
   erb :index
end

post '/result' do #doが抜けてた
   
   result = (params[:value].to_f / params[:unit].to_f).ceil
   History.create({
      value: params[:value],
      category: params[:category],
      unit: params[:unit],
      result: result
   })
   
   
   
   redirect '/'
  
   
   
   
end

get '/admin' do #doが抜けてた
   # 基本は追加モード。この値によって入力フォームの機能が追加と編集で変化する
   @mode = "add"
   
   @unit = Unit.none
   # ユニット一覧用
   @units = Unit.all
   @histories = History.all
   erb :admin
end

post '/admin/new' do
   Unit.create({
      name: params[:name],
      category: params[:category],
      value: params[:value]
   })
   redirect '/admin'
end

post '/admin/update/:id' do
   Unit.find_by(params[:id]).update({
      name: params[:name],
      category: params[:category],
      value: params[:value]
   })
   redirect '/admin'
end

post '/admin/delete/:id' do
   Unit.find_by(params[:id]).delete
   redirect '/admin'
end

post '/admin/edit/:id' do
   @unit = Unit.find_by(params[:id])
   
   # ユニット一覧用
   @units = Unit.all
   @histories = History.all
   # 編集モードにする
   @mode = "edit"
   erb :admin
end

post '/admin/history/reset' do
   History.delete_all
   redirect '/admin'
end

