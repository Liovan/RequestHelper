# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Staff.create(f_name: "میم", l_name: "میم زاده",place_id:nil, username: "admin_meam", password: "meam_group_admin2121")

Place.create([{name:"مدیر آموزش"},
              {name:"مسئول نظام وظیفه"},
              {name:"مسئول آموزش کامپیوتر"},
              {name:"مسئول آموزش الکترونیک"},
              {name:"مسئول آموزش حسابداری"},
              {name:"ریاست"},
              {name:"امور مالی"},
              {name:"دبیرخانه"},
              {name:"انبار داری"},
              {name:"انبار"},
              {name:"بایگانی"}])

Message.create([{text:"شما بدهکار هستید لطفاً برای تصویه اقدام نمایید"},
               {text:"مشخصات پر شده توسط شما صحیح یا معتبر نمی باشد"},
               {text:"شما دارای سنوات هستید ، لطفاً به واحد مالی مراجعه فرمایید"}])
