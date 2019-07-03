class Owner < ApplicationRecord
  belongs_to :item, polymorphic: true
  belongs_to :user

  validates_presence_of :item
  validates_presence_of :user

  validate :dates_must_be_valid
  private def dates_must_be_valid
    return errors.add(:start, "Date de début invalide") unless start.present?
    return errors.add(:end, "Date de fin invalide") unless self[:end].present?

    if self[:end] < start
      errors.add(:end, "Date de fin avant la date de début")
    end
  end
end
