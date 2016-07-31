class ListeningSession < ApplicationRecord
  belongs_to :user

  def formatted_created_at
    created_at.localtime.strftime("%m/%d/%Y %I:%M%p")
  end

  def formatted_updated_at
    updated_at.localtime.strftime("%m/%d/%Y %I:%M%p")
  end

  def self.to_csv
    attributes = %w(id user_id item_name item_type item_id playlist_owner_id notes agitation_before agitation_after awareness_before awareness_after communicativeness_before communicativeness_after duration created_at updated_at)

    CSV.generate(headers: true) do |csv|
      csv << attributes
      all.each do |ls|
        csv << ls.attributes.values_at(*attributes)
      end
    end
  end

end
