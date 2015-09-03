class HogeForm
include Virtus
extend ActiveModel::Naming
include ActiveModel::Conversion
include ActiveModel::Validations
attribute :name, String
attribute :email, String
attribute :address, String

# validationが必要ならここにvalidatesを書ける
#  validates :name, presence: true
def search
scoped = Hoge.scoped
scoped = Hoge.where("name LIKE ?", "%#{name}%") if name.present?
scoped = Hoge.where("email LIKE ?", "%#{email}%") if email.present?
scoped = Hoge.where("address LIKE ?", "%#{address}%") if address.present?
scoped
end
end
