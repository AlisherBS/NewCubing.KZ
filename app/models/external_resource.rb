class ExternalResource < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :description
  validates :link, :format => URI::regexp(%w(http https))
  validates :img, :format => URI::regexp(%w(http https))
  validates_numericality_of :rank, only_integer: true, greater_than: 0, less_than_or_equal_to: ->(_) { ExternalResource.count + 1 }

  before_save :set_ranks_on_save, if: :will_save_change_to_rank?
  private def set_ranks_on_save
    previous_rank = self.rank_was || ExternalResource.count + 1
    if self.rank > previous_rank
      self.rank -= 1
      ExternalResource.where("rank > ? and rank <= ?", previous_rank, self.rank).update_all("rank = rank - 1")
    else
      ExternalResource.where("rank >= ? and rank < ?", self.rank, previous_rank).update_all("rank = rank + 1")
    end
  end

  after_destroy :fix_rank
  private def fix_rank
    ExternalResource.where("rank > ?", rank).update_all("rank = rank - 1")
  end
end
