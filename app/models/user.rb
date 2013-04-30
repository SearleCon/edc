class User < ActiveRecord::Base
  include AfterSaveProcessing
  include Notable
  include Addressable

  belongs_to :account, autosave: true

  delegate :company, :subdomain, :drop_box_key, :drop_box_secret , to: :account, allow_nil: true

  acts_as_tenant :account

  accepts_nested_attributes_for :account

  rolify


  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_uniqueness_to_tenant :email
  validates_associated :account

  def after_create_processing
    UserMailer.delay.welcome(self)
  end
  
end
