class User < ApplicationRecord

  has_and_belongs_to_many :tests

  before_save :create_email
  before_create :create_remember_token

  ########валидация при регистрации########

  validates_presence_of :user_name, :surname, :email, message: 'Заполните поле'
  validates_length_of :user_name, :surname, minimum: 3, message: 'Минимальная длина 3 символа'
  validates_format_of :user_name, :surname, with: /[\u0410-\u044F]+/i, message: 'пишите русскими буквами'
  validates_format_of :email, with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: 'неккоректный формат'

  #проверка уникальности email в базе с учетом регистра
  validates_uniqueness_of :email, case_sensitive: false

  validates_length_of :password, minimum: 6, message: 'Минимальная длина 6 символов'

  #создание виртуальных полей и проверка на наличие и совпадения password и password_confirmation
  # + шифрует для записи в базу User.password_digest с использованием gem 'bcrypt'
  has_secure_password

  private

  #пишем в базу User.remember_token
  def create_remember_token
    #Digest - библиотека, SHA1 - алгоритм хеширования, hexdigest - метод
    #SecureRandom - модуль, urlsafe_base64 - метод возвращает случайную строку длиной в 16 символов
    #SecureRandom.urlsafe_base64 - это сам токен из случайных 16 символов
    #Digest::SHA1.hexdigest - шифруем токен
    self.remember_token = Digest::SHA1.hexdigest(SecureRandom.urlsafe_base64)
  end

  #сохраняем в базу поле User.email в нижнем регистре
  def create_email
    self.email = email.downcase
  end

end