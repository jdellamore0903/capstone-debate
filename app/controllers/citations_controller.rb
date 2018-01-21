class CitationsController < ApplicationController
  def index
    citations = Citation.all
    render json: citations.as_json
  end

  def show
    citation = Citation.find_by(id: params["id"])
    render json: citation.as_json
  end

  def create
    citation = Citation.new({
      author_first: params['author_first'],
      author_last: params['author_last'],
      url_link: params['url_link'],
      up_vote: params['up_vote'],
      down_vote: params['down_vote'],
      article_title: params['article_title'],
      article_date: params['article_date']
      })

    if citation.save
      render json: citation.as_json
    else
      render json: {errors: citation.errors.full_message}
    end
  end

  def update
    citation = Citation.find_by(id: params["id"])
    citation["author_first"] = params["author_first"] || citation["author_first"]
    citation["author_last"] = params["author_last"] || citation["author_last"]
    citation["url_link"] = params["url_link"] || citation["url_link"]
    citation["article_title"] = params["article_title"] || citation["article_title"]
    citation["article_date"] = params["article_date"] || citation["article_date"]
    
    citation["up_vote"] = params["up_vote"] || citation["up_vote"]
    citation["down_vote"] = params["down_vote"] || citation["down_vote"]

    if citation.save
      render json: citation.as_json
    else
      render json: {errors: citation.errors.full_message}
    end

  end

  def destroy
    citation = Citation.find_by(id: params['id'])
    citation.destroy
    render json: {message: "complete!"}
  end

end
