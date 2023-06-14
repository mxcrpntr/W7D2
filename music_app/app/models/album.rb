# == Schema Information
#
# Table name: albums
#
#  id         :bigint           not null, primary key
#  band_id    :bigint           not null
#  title      :string           not null
#  year       :integer          not null
#  live?      :boolean          default(FALSE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Album < ApplicationRecord
    validates :band_id, :title, :year, :live?, presence: true
    validates :title, uniqueness: {scope: :band_id}
    
    belongs_to :band
end
