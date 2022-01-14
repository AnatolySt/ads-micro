class PaginationUtil
  def initialize(collection)
    @collection = collection
  end

  def paginate(per = 25, page = 1)
    return [] if @collection.blank?

    @collection.limit(per).offset((page - 1) * per)
  end
end