class PageController < ApplicationController
  def index
    page = Page.find_by(ip_address: request.ip)
    if page.nil?
       percent_red = Page.where(color: "red").count.to_f / Page.count.to_f
      if percent_red == 0.75
        page = Page.create!(color: "blue")
      else
        page = Page.create!(color: "red")
      end
    end
    @page_color = page.color
    respond_to do |format|
      format.html
      format.json { render json: {
          page_color: page.color, 
          percent_red: percent_red, 
          total_pages: Page.count, 
          total_red: Page.where(color: "red").count, 
          total_blue: Page.where(color: "blue").count,
          ip_address: request.ip
        }.to_json }
    end
  end
end
