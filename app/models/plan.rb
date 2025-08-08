class Plan < ApplicationRecord
  #必須項目化
  validates :title, :start_date, :end_date, presence: true

  #文字数制限
  validates :title, length: { maximum: 20 }
  validates :memo, length: { maximum: 500 }

  #終了日は開始日以降
  validate :end_date_after_start_date

  has_many :memos, dependent: :destroy

  private

  def end_date_after_start_date
    if start_date.present? && end_date.present? && end_date < start_date
        errors.add(:end_date, "は開始日以降の日付にしてください")
    end
  end
end
