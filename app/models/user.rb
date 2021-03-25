class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # ショップテーブルと関連付け
  has_one :shop, dependent: :destroy
  # has_oneは一人だけのデータを紐付ける。
  has_many :products, dependent: :destroy
  has_many :productcomments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :contacts, dependent: :destroy
  
  
  validates :name, length:  { in: 1..20 }, presence: true, uniqueness: true # ユーザーネームを1文字以上20文字以下で入力
  validates :email, presence: true
  
  # 物理削除の代わりにユーザーの`deleted_at`をタイムスタンプで更新
  def soft_delete  
    update_attribute(:deleted_at, Time.current)  
  end

  # ユーザーのアカウントが有効であることを確認 
  def active_for_authentication?  
    super && !deleted_at  
  end  

  # 削除したユーザーにカスタムメッセージを追加します  
  def inactive_message   
    !deleted_at ? super : :deleted_account  
  end 
  
end
