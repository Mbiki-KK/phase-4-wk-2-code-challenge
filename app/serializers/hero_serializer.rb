class HeroSerializer < ActiveModel::Serializer
  attributes :id , :name, :super_name
  has_many :powers,serializer: PowerSerializer, if: :include_powers?
  def include_powers?
    instance_options[:include_powers]
  end
end

