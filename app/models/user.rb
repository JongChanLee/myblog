class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  #관계 설정도 이렇게 안하고, Post 하나에서 해결해버릴수 있지 않을까?
  #class_name: :post 옵션을 주고, def self.published_posts 를 하면 되지 않을까
  # -> 갑자기 든 생각. 삭제나 없데이트 같은 메소드도 하나씩 override를 해야할 것 같다.(또는 새로운 메소드를 만들거나)
end
