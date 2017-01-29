module ApplicationHelper

  #sets Global app's name
	$APP_NAME = "درخواست"

  #return full title
	def full_title(page_title)
		base_title = $APP_NAME
		if page_title.empty?
			provide(:title,base_title)
		else
			provide(:title,"#{page_title} | #{base_title}")
		end
	end

  def javascript(*files)
    content_for(:javascript){javascript_include_tag *files, 'data-turbolinks-track': 'reload' }
  end
  def stylesheet(*files)
    content_for(:stylesheet){stylesheet_link_tag(*files , 'data-turbolinks-track': 'reload')}
  end

end
