# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Staff.create(f_name: "میم", l_name: "میم زاده",place_id:nil, username: "admin_meam", password: "meam_group_admin2121")

Place.create([{id:1,name:"مدیر آموزش"},
              {id:2,name:"مسئول نظام وظیفه"},
              {id:3,name:"مسئول آموزش کامپیوتر"},
              {id:4,name:"مسئول آموزش الکترونیک"},
              {id:5,name:"مسئول آموزش حسابداری"},
              {id:6,name:"ریاست"},
              {id:7,name:"امور مالی"},
              {id:8,name:"دبیرخانه"},
              {id:9,name:"انبار داری"},
              {id:10,name:"انبار"},
              {id:11,name:"بایگانی"}])

Feature.create(id:1,name:"اشتغال به تحصیل")


Message.create([{text:"شما بدهکار هستید لطفاً برای تصویه اقدام نمایید"},
               {text:"مشخصات پر شده توسط شما صحیح یا معتبر نمی باشد"},
               {text:"شما دارای سنوات هستید ، لطفاً به واحد مالی مراجعه فرمایید"}])
