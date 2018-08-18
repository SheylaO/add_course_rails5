module DeviseHelper
  def devise_error_messages!
    return "" unless devise_error_messages?

    sentence = pluralize(resource.errors.count, "error")
    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join

    html = <<-HTML
    <div class="card text-white bg-danger mb-3">
          <div class="card-header">#{sentence}
            <div class="card-body">
                <ul>#{messages}</ul>
            </div>
          </div>
    </div>
    HTML

    html.html_safe
  end

  def devise_error_messages?
    !resource.errors.empty?
  end

end
