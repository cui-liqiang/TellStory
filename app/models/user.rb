# encoding: utf-8

require 'digest'

class User < ActiveRecord::Base
  attr_accessible :name, :email, :display_name, :head
  attr_accessor  :password
  validates :password, :presence => {:message => "密码不能为空"},
                       :length => { :within => 6..40 }
  validates :email, :presence => {:message => "邮箱不能为空"}
  validates_format_of :email,
                      :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i,
                      :message => "邮箱格式不对"

  before_save :encrypt_password

  def has_password?(submitted_password)
    encrypted_password == encrypt(submitted_password)
  end

  def self.authenticate(email, submitted_password)
    user = find_by_email(email)
    return nil if user.nil?
    return user if user.has_password?(submitted_password)
  end

  private
  def encrypt_password
    self.salt = make_salt if new_record?
    self.encrypted_password = encrypt(password)
  end

  def encrypt(string)
    secure_hash("#{salt}--#{string}")
  end

  def make_salt
    secure_hash("#{Time.now.utc}--#{password}")
  end

  def secure_hash(string)
    Digest::SHA2.hexdigest(string)
  end
end
