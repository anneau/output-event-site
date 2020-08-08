class ApplicationController < ActionController::API
  # controllerで発生したエラーをキャッチする
  rescue_from ActiveRecord::RecordInvalid, with: :render_bad_request
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

  # 400 Bad Request
  def render_bad_request(messages)
    render json: { errors: { messages: messages.record.errors.full_messages } }, status: :bad_request
  end

  # 404 Not Found
  def render_not_found
    render json: { errors: { message: '要求されたリソースが見つかりませんでした。' } }, status: :not_found
  end
end
