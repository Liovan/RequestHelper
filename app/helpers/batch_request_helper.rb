module BatchRequestHelper
  def batch_nil?
    cookies[:batch_print].nil? || cookies[:batch_print].blank?
  end

  def get_batch
    unless batch_nil?
      cookies[:batch_print].split('&')
    else
      return []
    end
  end

  def has_batch?(parameter)
    get_batch.include?(parameter)
  end

  def add_batch(parameter)
    return false if parameter.nil?
    unless batch_nil?
      # nilnist
      cookies[:batch_print] += "&#{parameter}"
    else
      # nile
      cookies[:batch_print]=parameter
    end
  end

  def clear_batch
    cookies.delete(:batch_print) unless batch_nil?
  end

end
