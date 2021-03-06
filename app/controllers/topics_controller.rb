class TopicsController < ApplicationController
  def index
    @alltopics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def new
    @topic = Topic.new
  end

  def edit
     @topic = Topic.find(params[:id])
  end
  
  def create
    @topic = Topic.new(topic_params)
    @topic.save
    redirect_to @topic
  end

  def update
    @topic = Topic.find(params[:id])
    if @topic.update(topic_params)
      redirect_to @topic
      else
        render 'edit'
    end
  end
  
  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy
    redirect_to @topic
  end
  
  def updote
    @topic = Topic.find(params[:id])
    @topic.votes.create
    redirect_to(topic_path)
  end

private
  def topic_params
    params.require(:topic).permit(:title,:description)
  end
end
