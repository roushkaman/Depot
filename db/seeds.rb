# coding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Order.delete_all
LineItem.delete_all
Cart.delete_all
PaymentType.delete_all
PaymentType.create([{ pay_type: 'Оплата чеком' }, { pay_type: 'Пластиковая карта' }, { pay_type: 'Наличный рассчет' }])
User.create(name: 'admin', password: 'admin', password_confirmation: 'admin')