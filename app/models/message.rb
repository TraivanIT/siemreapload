class Message < ApplicationRecord
  belongs_to :visitor

  def mark_status
  	if status == false
  		update(status: true)
  	end
  end
  
end
