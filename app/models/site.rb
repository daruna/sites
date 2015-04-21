class Site < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true

  paginates_per 10

  def available?
    uri = URI(title)
    res = Net::HTTP.get_response(uri)

    if res.code == '200'
      true
    else
      false
    end
  end
end
