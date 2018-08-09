class Town < ApplicationRecord
  extend FriendlyId
  friendly_id :pug, use: :slugged

	validates :townname, presence: true, uniqueness: { scope: :state_id, case_sensitive: false }
	belongs_to :state
	validates :state_id, presence: true
  validates :slug, presence: true
  has_many :locations

  default_scope -> { order(townname: :asc)}
  # default_scope -> { order(state_id: :asc)}


  def pug
    "#{townname}-#{state.abv}".parameterize
  end

 	def self.import(file)
    spreadsheet = Roo::Spreadsheet.open(file.path)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      town = find_by(townname: row["townname"]) || new
      town.attributes = row.to_hash
      town.save!
    end
  end

  def self.to_csv(options = {})
    desired_columns = ["townname", "id", "state_id"]
    CSV.generate(options) do |csv|
      csv << desired_columns
      all.each do |location|
        csv << location.attributes.values_at(*desired_columns)
      end
    end
  end

end
