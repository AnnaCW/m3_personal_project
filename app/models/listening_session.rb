class ListeningSession < ApplicationRecord
  belongs_to :user

  def formatted_created_at
    created_at.localtime.strftime("%m/%d/%Y %I:%M%p")
  end

  def formatted_updated_at
    updated_at.localtime.strftime("%m/%d/%Y %I:%M%p")
  end

end
