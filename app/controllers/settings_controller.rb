class SettingsController < InheritedResources::Base
  layout :set_layout
  
  def create
    create! do |success, failure|
      success.html { render :create }
      failure.html { render :errors, :status => :bad_request }
    end
  end

  def update
    update! do |success, failure|
      success.html { render :update }
      failure.html { render :errors, :status => :bad_request }
    end
  end

  def destroy
    destroy! do |format|
      format.js { render :nothing => true }
    end
  end
  
  private
  
  def set_layout
    request.xhr? ? false : 'application'
  end
end
