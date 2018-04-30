require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @article = articles(:one)
  end

  test "get article_url(@article) should show article" do
    get article_url(@article)
    assert_response :success
  end

  test "article_url raises with no argument" do
    assert_raises(ActionController::UrlGenerationError) {
      get article_url
    }
  end
  test "example from issue #31472 raises error: get article_url, params: { id: @article.id }, ..." do
    assert_raises(ActionController::UrlGenerationError) {
      get article_url, params: { id: @article.id }, headers: { 'HTTP_REFERER' => 'http://example.com/home' }
    }
  end
  test "get article_url(@article), params: { id: @article.id }, ..." do
    get article_url(@article), params: { id: @article.id }, headers: { 'HTTP_REFERER' => 'http://example.com/home' }
  end
  test "raises error: get article_url, params: { article: { id: @article.id } }, ..." do
    assert_raises(ActionController::UrlGenerationError) {
      get article_url, params: { article: { id: @article.id } }, headers: { 'HTTP_REFERER' => 'http://example.com/home' }
    }
  end
  test "get article_url(@article), params: { article: { id: @article.id } }, ..." do
    get article_url(@article), params: { article: { id: @article.id } }, headers: { 'HTTP_REFERER' => 'http://example.com/home' }
  end

  test "patch article_url(@article) should update article" do
    patch article_url(@article), params: { article: { body: @article.body, title: @article.title } }
    assert_redirected_to article_url(@article)
  end

  test "raises error: patch article_url, params: { article: { ... " do
    assert_raises(ActionController::UrlGenerationError) {
      patch article_url, params: { article: { id: @article.id, body: @article.body, title: @article.title } }
    }
  end
  test "raises_error: patch article_url, params: { id: @article.id }, xhr: true" do
    assert_raises(ActionController::UrlGenerationError) {
      patch article_url, params: { id: @article.id }, xhr: true
    }
  end
  # test "raises a ParamMissing error: patch article_url(@article), params: { id: @article.id }, xhr: true" do
  #   patch article_url(@article), params: { id: @article.id }, xhr: true
  # end

end
