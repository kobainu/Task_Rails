class Post < ApplicationRecord
  # タイトル:入力必須
  validates :title, presence: true
  # 開始日:入力必須
  validates :start_date, presence: true
  # 終了日:入力必須
  validates :end_date, presence: true
  # 開始日:今日以降の日付を指定
  validate :date_before_start
  # 終了日:開始日以降の日付を指定
  validate :date_before_end
  # スケジュールメモ:文字数制限(最大500文字)
  validates :memo, length: { maximum: 500 }

  def date_before_start
    return if start_date.blank?
    errors.add(:start_date, "は今日以降の日付を選択してください") if start_date < Date.today - 1
  end

  def date_before_end
    return if end_date.blank? || start_date.blank?
    errors.add(:end_date, "は開始日以降の日付を選択してください") if end_date < start_date
  end
end
