class Site < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validate :site_url_must_be_correct

  before_create :check_available

  paginates_per 6

  def available?
    uri = URI(title)
    res = Net::HTTP.get_response(uri)

    if res.code == '200'
      true
    else
      false
    end
  end

  private

  def check_available
    self.available = true if available?
  end

  def site_url_must_be_correct
    uri_correct = !!URI(title).scheme
    if !uri_correct
      errors.add(:title, 'the site url is incorrect!')
      false
    end
  end
end
