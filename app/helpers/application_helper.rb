module ApplicationHelper
  def find_locale_id(district, municipality, village)
    Locale.joins(municipality: :region).where(
      'regions.name = ? AND municipalities.name = ? AND locales.name = ?',
      district, municipality, village
    ).first.try(:id)
  end
end
