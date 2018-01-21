class CitationCommentsController < ApplicationController
  def index
    citation_comments = CitationComment.all
    render json: citation_comments.all
  end

  def show
    citation_comment_id = params["id"]
    citation_comments = CitationComment.find_by(id: citation_comment_id)
    render json: citation_comments.as_json
  end

  def create
    citation_comment = CitationComment.new({
      comment: params["comment"],
      user_id: params["user_id"],
      citation_id: params["citation_id"],
      positive: params["positive"]
      })

    if citation_comment.save
      render json: citation_comment.as_json
    else
      render json: {message: citation_comment.errors.full_message}
    end
  end

  def update
    the_id = params["id"]
    citation_comment = CitationComment.find_by(id: the_id)
    citation_comment["comment"] = params["comment"] || citation_comment["comment"]
    citation_comment["citation_id"] = params["citation_id"] || citation_comment["citation_id"]
    citation_comment["positive"] = params["positive"] || citation_comment["positive"]
    
    if citation_comment.save
      render json: citation_comment.as_json
    else
      render json: {message: citation_comment.errors.full_message}
    end
  end

  def destroy
    the_id = params['id']
    citation_comment = CitationComment.find_by(id: the_id)
    citation_comment.destroy
    render json: {message: "Complete"}
  end 
end
